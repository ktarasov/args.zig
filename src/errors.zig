//! Error types and handling for args.zig.

const std = @import("std");

/// Errors that occur during argument parsing.
pub const ParseError = error{
    UnknownOption,
    MissingRequired,
    MissingValue,
    InvalidValue,
    TooManyValues,
    TooFewValues,
    InvalidChoice,
    ConflictingArguments,
    MissingDependency,
    DuplicateArgument,
    InvalidFormat,
    UnexpectedPositional,
    UnknownSubcommand,
    MissingSubcommand,
    MutuallyExclusive,
    OutOfMemory,
    Overflow,
    InvalidCharacter,
};

/// Errors that occur during schema definition.
pub const SchemaError = error{
    DuplicateArgument,
    InvalidShortName,
    InvalidLongName,
    MissingName,
    EmptyName,
    DuplicateName,
    DuplicateAlias,
    InvalidConfig,
    PositionalAfterVariadic,
    RequiredAfterOptional,
    InvalidNargs,
    InvalidDefault,
    InvalidChoices,
    CircularDependency,
    SelfConflict,
    OutOfMemory,
};

/// Errors that occur during value validation.
pub const ValidationError = error{
    OutOfRange,
    TooShort,
    TooLong,
    PatternMismatch,
    CustomValidationFailed,
    FileNotFound,
    DirectoryNotFound,
    PermissionDenied,
    InvalidPath,
};

/// Context information for error reporting.
pub const ErrorContext = struct {
    argument: ?[]const u8 = null,
    value: ?[]const u8 = null,
    expected: ?[]const u8 = null,
    position: ?usize = null,
    message: ?[]const u8 = null,
    suggestion: ?[]const u8 = null,

    pub fn format(self: ErrorContext, allocator: std.mem.Allocator) ![]const u8 {
        var aw: std.Io.Writer.Allocating = .init(allocator);
        errdefer aw.deinit();
        const writer = &aw.writer;

        if (self.argument) |arg| try writer.print("argument '{s}': ", .{arg});
        if (self.message) |msg| try writer.writeAll(msg);
        if (self.value) |val| try writer.print(" (got '{s}')", .{val});
        if (self.expected) |exp| try writer.print(" (expected {s})", .{exp});
        if (self.suggestion) |sug| try writer.print("\n  Did you mean '{s}'?", .{sug});

        return aw.toOwnedSlice();
    }
};

const utils = @import("utils.zig");

/// Calculate Levenshtein distance between two strings for suggestions (delegates to utils).
pub const levenshteinDistance = utils.editDistance;

/// Find the closest match from a list of candidates (delegates to utils).
pub const findClosestMatch = utils.findClosest;

/// Format a parse error for display.
pub fn formatParseError(err: anyerror) []const u8 {
    return switch (err) {
        error.UnknownOption => "unknown option",
        error.MissingRequired => "missing required argument",
        error.MissingValue => "missing value for option",
        error.InvalidValue => "invalid value",
        error.TooManyValues => "too many values provided",
        error.TooFewValues => "too few values provided",
        error.InvalidChoice => "invalid choice",
        error.ConflictingArguments => "conflicting arguments",
        error.MissingDependency => "missing required dependency",
        error.DuplicateArgument => "duplicate argument",
        error.InvalidFormat => "invalid argument format",
        error.UnexpectedPositional => "unexpected positional argument",
        error.UnknownSubcommand => "unknown subcommand",
        error.MissingSubcommand => "missing subcommand",
        error.MutuallyExclusive => "mutually exclusive arguments used together",
        error.OutOfMemory => "out of memory",
        error.Overflow => "numeric overflow",
        error.InvalidCharacter => "invalid character in value",
        else => @errorName(err),
    };
}

/// Format a schema definition error for display.
pub fn formatSchemaError(err: SchemaError) []const u8 {
    return switch (err) {
        SchemaError.DuplicateArgument => "duplicate argument",
        SchemaError.InvalidShortName => "invalid short name",
        SchemaError.InvalidLongName => "invalid long name",
        SchemaError.MissingName => "missing argument name",
        SchemaError.EmptyName => "empty argument name",
        SchemaError.DuplicateName => "duplicate argument name",
        SchemaError.DuplicateAlias => "duplicate alias",
        SchemaError.InvalidConfig => "invalid configuration",
        SchemaError.PositionalAfterVariadic => "positional argument after variadic argument",
        SchemaError.RequiredAfterOptional => "required argument after optional argument",
        SchemaError.InvalidNargs => "invalid nargs specification",
        SchemaError.InvalidDefault => "invalid default value",
        SchemaError.InvalidChoices => "invalid choices list",
        SchemaError.CircularDependency => "circular dependency",
        SchemaError.SelfConflict => "argument conflicts with itself",
        SchemaError.OutOfMemory => "out of memory",
    };
}

/// Format a validation error for display.
pub fn formatValidationError(err: ValidationError) []const u8 {
    return switch (err) {
        ValidationError.OutOfRange => "value out of range",
        ValidationError.TooShort => "value is too short",
        ValidationError.TooLong => "value is too long",
        ValidationError.PatternMismatch => "value does not match required pattern",
        ValidationError.CustomValidationFailed => "custom validation failed",
        ValidationError.FileNotFound => "file not found",
        ValidationError.DirectoryNotFound => "directory not found",
        ValidationError.PermissionDenied => "permission denied",
        ValidationError.InvalidPath => "invalid path",
    };
}

test "levenshteinDistance" {
    try std.testing.expectEqual(@as(usize, 0), levenshteinDistance("hello", "hello"));
    try std.testing.expectEqual(@as(usize, 1), levenshteinDistance("hello", "hallo"));
    try std.testing.expectEqual(@as(usize, 3), levenshteinDistance("kitten", "sitting"));
    try std.testing.expectEqual(@as(usize, 5), levenshteinDistance("", "hello"));
}

test "findClosestMatch" {
    const candidates = [_][]const u8{ "verbose", "version", "help", "output" };
    try std.testing.expectEqualStrings("verbose", findClosestMatch("verbos", &candidates, 2).?);
    try std.testing.expectEqualStrings("version", findClosestMatch("versio", &candidates, 2).?);
    try std.testing.expectEqual(@as(?[]const u8, null), findClosestMatch("xyz", &candidates, 2));
}

test "ErrorContext.format" {
    const allocator = std.testing.allocator;

    const ctx = ErrorContext{
        .argument = "output",
        .message = "file not found",
        .value = "/invalid/path",
    };

    const formatted = try ctx.format(allocator);
    defer allocator.free(formatted);

    try std.testing.expect(std.mem.indexOf(u8, formatted, "output") != null);
    try std.testing.expect(std.mem.indexOf(u8, formatted, "file not found") != null);
}

test "formatParseError" {
    try std.testing.expectEqualStrings("unknown option", formatParseError(ParseError.UnknownOption));
    try std.testing.expectEqualStrings("missing required argument", formatParseError(ParseError.MissingRequired));
}

test "formatSchemaError" {
    try std.testing.expectEqualStrings("duplicate argument", formatSchemaError(SchemaError.DuplicateArgument));
    try std.testing.expectEqualStrings("invalid long name", formatSchemaError(SchemaError.InvalidLongName));
}

test "formatValidationError" {
    try std.testing.expectEqualStrings("value out of range", formatValidationError(ValidationError.OutOfRange));
    try std.testing.expectEqualStrings("file not found", formatValidationError(ValidationError.FileNotFound));
}
