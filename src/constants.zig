//! Shared constants for args.zig.
//! All user-visible strings, metavars, error messages, and config warning
//! text live here so every module can reuse them without duplicating literals.

pub const Defaults = struct {
    pub const program_name = "app";
    pub const error_prefix = "Error";
    pub const warning_prefix = "Warning";
    pub const note_prefix = "Note";
    pub const unknown_version = "unknown";
    pub const verbose_name = "verbose";
    pub const quiet_name = "quiet";
    pub const verbose_help = "Increase verbosity level";
    pub const quiet_help = "Decrease verbosity level (suppress output)";
    pub const select_name = "select";
    pub const select_help = "Select specific items";
    pub const select_csv_help = "Select specific items (comma-separated)";
    pub const all_name = "all";
    pub const all_help = "Select all items";
    pub const selection_group = "Selection";
    pub const selection_group_desc = "Target selection options";
    pub const filters_group = "Filters";
    pub const filters_group_desc = "Target filtering options";
    pub const include_name = "include";
    pub const include_help = "Comma-separated include filters";
    pub const exclude_name = "exclude";
    pub const exclude_help = "Comma-separated exclude filters";
    pub const prompt_question = "Choose target";
    pub const select_key = "select";
    pub const all_key = "all";
    pub const all_keyword = "all";
    // Duration / Size
    pub const duration_name = "duration";
    pub const duration_help = "Duration (e.g. 1h30m, 45s, 2d)";
    pub const size_name = "size";
    pub const size_help = "Byte size (e.g. 1GB, 512MB, 4096)";
    pub const range_name = "value";
    pub const range_help = "Integer in range";
};

pub const Metavars = struct {
    pub const path = "PATH";
    pub const abs_path = "ABS_PATH";
    pub const file = "FILE";
    pub const dir = "DIR";
    pub const file_name = "FILE_NAME";
    pub const email = "EMAIL";
    pub const url = "URL";
    pub const ipv4 = "IPV4";
    pub const ip = "IP";
    pub const ipv6 = "IPV6";
    pub const host = "HOST";
    pub const uuid = "UUID";
    pub const iso_date = "YYYY-MM-DD";
    pub const iso_datetime = "YYYY-MM-DDTHH:MM:SSZ";
    pub const json = "JSON";
    pub const key_value = "KEY=VALUE";
    pub const year = "YYYY";
    pub const time = "HH:MM";
    pub const port = "PORT";
    pub const endpoint = "HOST:PORT";
    pub const base64 = "BASE64";
    pub const int = "INT";
    pub const float = "FLOAT";
    pub const uint = "UINT";
    pub const hex = "HEX";
    pub const list = "LIST";
    pub const duration = "DURATION";
    pub const byte_size = "SIZE";
    pub const range = "N";
    pub const regex = "PATTERN";
    pub const slug = "SLUG";
};

pub const HelpText = struct {
    pub const usage = "USAGE:";
    pub const commands = "COMMANDS:";
    pub const arguments = "ARGUMENTS:";
    pub const options = "OPTIONS:";
    pub const print_help = "Print help";
    pub const print_version = "Print version";
    pub const author = "Author";
    pub const choices = "choices";
    pub const default_label = "default";
    pub const env = "env";
    pub const negate = "negate";
    pub const deprecated = "DEPRECATED";
    pub const conflicts_with_label = "conflicts";
    pub const requires_label = "requires";
    pub const range_label = "range";
};

pub const UpdateChecker = struct {
    pub const github_repo = "muhammad-fiaz/args.zig";
};

pub const ErrorMessages = struct {
    pub const parse_unknown_option = "unknown option";
    pub const parse_missing_required = "missing required argument";
    pub const parse_missing_value = "missing value for option";
    pub const parse_invalid_value = "invalid value";
    pub const parse_too_many_values = "too many values provided";
    pub const parse_too_few_values = "too few values provided";
    pub const parse_invalid_choice = "invalid choice";
    pub const parse_conflicting_arguments = "conflicting arguments";
    pub const parse_missing_dependency = "missing required dependency";
    pub const parse_duplicate_argument = "duplicate argument";
    pub const parse_invalid_format = "invalid argument format";
    pub const parse_unexpected_positional = "unexpected positional argument";
    pub const parse_unknown_subcommand = "unknown subcommand";
    pub const parse_missing_subcommand = "missing subcommand";
    pub const parse_mutually_exclusive = "mutually exclusive arguments used together";
    pub const parse_out_of_memory = "out of memory";
    pub const parse_overflow = "numeric overflow";
    pub const parse_invalid_character = "invalid character in value";
    pub const parse_required_if_violation = "argument is required when another is present";
    pub const parse_circular_conflict = "circular conflict detected between arguments";

    pub const schema_duplicate_argument = "duplicate argument";
    pub const schema_invalid_short = "invalid short name";
    pub const schema_invalid_long = "invalid long name";
    pub const schema_missing_name = "missing argument name";
    pub const schema_empty_name = "empty argument name";
    pub const schema_duplicate_name = "duplicate argument name";
    pub const schema_duplicate_alias = "duplicate alias";
    pub const schema_invalid_config = "invalid configuration";
    pub const schema_positional_after_variadic = "positional argument after variadic argument";
    pub const schema_required_after_optional = "required argument after optional argument";
    pub const schema_invalid_nargs = "invalid nargs specification";
    pub const schema_invalid_default = "invalid default value";
    pub const schema_invalid_choices = "invalid choices list";
    pub const schema_circular_dependency = "circular dependency";
    pub const schema_self_conflict = "argument conflicts with itself";
    pub const schema_out_of_memory = "out of memory";
    pub const schema_conflicting_self = "argument cannot conflict with itself";
    pub const schema_invalid_regex = "invalid regex pattern";
    pub const schema_invalid_duration = "invalid duration format";

    pub const validation_out_of_range = "value out of range";
    pub const validation_too_short = "value is too short";
    pub const validation_too_long = "value is too long";
    pub const validation_pattern_mismatch = "value does not match required pattern";
    pub const validation_custom_failed = "custom validation failed";
    pub const validation_file_not_found = "file not found";
    pub const validation_directory_not_found = "directory not found";
    pub const validation_permission_denied = "permission denied";
    pub const validation_invalid_path = "invalid path";
    pub const validation_invalid_duration = "invalid duration format (use e.g. 1h30m, 45s, 2d)";
    pub const validation_invalid_size = "invalid size format (use e.g. 1GB, 512MB, 4096)";
    pub const validation_not_alphanumeric = "value must contain only letters and digits";
    pub const validation_not_slug = "value must be lowercase alphanumeric with hyphens only";
    pub const validation_has_whitespace = "value must not contain whitespace";
    pub const validation_not_positive = "value must be a positive number (> 0)";
    pub const validation_not_non_negative = "value must be a non-negative number (>= 0)";
    pub const validation_min_length = "value is too short (minimum length not met)";
    pub const validation_max_length = "value is too long (maximum length exceeded)";
};

pub const ParserMessages = struct {
    pub const unknown_option = "Unknown option '{s}{s}'\n";
    pub const unknown_subcommand = "Unknown subcommand '{s}'\n";
    pub const decode_failed = "failed to decode value for argument '{s}'\n";
    pub const invalid_choice = "invalid choice '{s}' for argument '{s}'\n";
    pub const expected_one_of = "Value '{s}' is not in expected list for argument '{s}'. Expected one of: ";
    pub const unexpected_value = "Value '{s}' is unexpected for argument '{s}'. Expected one of: ";
    pub const did_you_mean = "\n\tDid you mean '{s}{s}'?\n";
    pub const hint = "\n\tHint: {s}\n";
    pub const deprecated_option = "Option '--{s}' is deprecated: {s}\n";
    pub const deprecated_option_no_msg = "Option '--{s}' is deprecated and may be removed in a future version\n";
};

/// Messages emitted when two arguments conflict at parse time.
pub const ConflictMessages = struct {
    pub const conflict_error = "Option '--{s}' cannot be used together with '--{s}'\n";
    pub const mutual_exclusion_error = "Only one of the following options may be used: {s}\n";
    pub const mutual_exclusion_used = "  --{s}\n";
    pub const conflict_hint = "\n\tRemove one of the conflicting options and try again.\n";
    pub const conflict_summary = "Conflicting arguments detected\n";
};

/// Messages emitted when a required dependency argument is missing.
pub const DependencyMessages = struct {
    pub const requires_error = "Option '--{s}' requires '--{s}' to also be provided\n";
    pub const required_if_error = "Option '--{s}' is required when '--{s}' is provided\n";
    pub const required_if_value_error = "Option '--{s}' is required when '--{s}' has value '{s}'\n";
    pub const dependency_hint = "\n\tAdd the required option and try again.\n";
    pub const circular_conflict_warn = "Warning: arguments '--{s}' and '--{s}' mutually conflict with each other\n";
};

/// Warnings emitted when config fields are inconsistent with each other.
pub const ConfigWarnings = struct {
    pub const permissive_exit_on_error =
        "Config: 'exit_on_error = true' has no effect when 'parsing_mode = .permissive' — " ++
        "unknown options are silently collected instead of causing an exit.";
    pub const colors_silent_errors =
        "Config: 'use_colors = true' wastes ANSI codes when 'silent_errors = true' — " ++
        "consider setting 'use_colors = false' in silent mode.";
    pub const suggest_zero_distance =
        "Config: 'suggest_closest = true' but 'suggestion_max_distance = 0' — " ++
        "no suggestions will ever be shown; set suggestion_max_distance >= 1.";
    pub const negated_flags_strict =
        "Config: 'allow_negated_flags = false' with 'parsing_mode = .strict' — " ++
        "'--no-<flag>' tokens will trigger an UnknownOption error.";
    pub const ignore_unknown_exit_on_error =
        "Config: 'exit_on_error = true' is unused when 'parsing_mode = .ignore_unknown' — " ++
        "unknown options are silently dropped.";
    pub const update_check_silent =
        "Config: 'check_for_updates = true' with 'silent_errors = true' — " ++
        "update notifications will be suppressed; consider disabling update checks.";
    pub const no_suggestion_candidates =
        "Config: 'suggest_builtin_commands = false' and 'suggest_subcommands = false' — " ++
        "suggestion engine has no candidates to offer; consider re-enabling at least one.";
    pub const indent_exceeds_width =
        "Config: 'help_indent' ({d}) is >= 'help_line_width' ({d}) — " ++
        "descriptions will have no room; increase help_line_width or reduce help_indent.";
    pub const auto_resolved_prefix = "[auto-resolved] ";
};

/// Messages for per-argument deprecation warnings.
pub const DeprecationMessages = struct {
    pub const deprecated_arg = "Warning: '--{s}' is deprecated. {s}\n";
    pub const deprecated_arg_no_reason = "Warning: '--{s}' is deprecated and may be removed soon.\n";
    pub const deprecated_positional = "Warning: positional argument '{s}' is deprecated. {s}\n";
    pub const use_instead = "\n\tUse '--{s}' instead.\n";
};

/// Messages for new typed option features (duration, size, range).
pub const FeatureMessages = struct {
    pub const duration_help_suffix = " (format: 1h30m, 45s, 2d12h, etc.)";
    pub const size_help_suffix = " (format: 1GB, 512MB, 1024KB, 4096, etc.)";
    pub const range_help_suffix = " (range: {d}..{d})";
    pub const range_help_suffix_min_only = " (min: {d})";
    pub const range_help_suffix_max_only = " (max: {d})";
    pub const invalid_duration_fmt = "invalid duration '{s}': expected format like '1h30m', '45s', '2d'\n";
    pub const invalid_size_fmt = "invalid size '{s}': expected format like '1GB', '512MB', '4096'\n";
    pub const out_of_range_fmt = "value {d} is out of range [{d}, {d}] for '--{s}'\n";
    pub const out_of_range_min_fmt = "value {d} is below minimum {d} for '--{s}'\n";
    pub const out_of_range_max_fmt = "value {d} exceeds maximum {d} for '--{s}'\n";
};

pub const PromptText = struct {
    pub const all_label = "all";
    pub const all_menu = "  0) all\n";
    pub const enter_prompt = "Enter number or name: ";
    pub const invalid_selection = "Invalid selection. Try again.\n";
    pub const did_you_mean = "Did you mean '{s}'?\n";
};

pub const Builtins = struct {
    pub const help = "help";
    pub const version = "version";
};

pub const TypeNames = struct {
    pub const string = "STRING";
    pub const int = "INT";
    pub const uint = "UINT";
    pub const float = "FLOAT";
    pub const bool_name = "BOOL";
    pub const path = "PATH";
    pub const choice = "CHOICE";
    pub const array = "ARRAY";
    pub const counter = "N";
    pub const custom = "VALUE";
    pub const key_value = "KEY=VALUE";
    pub const duration = "DURATION";
    pub const byte_size = "SIZE";

    pub const default_string = "";
    pub const default_int = "0";
    pub const default_float = "0.0";
    pub const default_array = "[]";
    pub const default_bool = "false";
    pub const default_duration = "0s";
    pub const default_size = "0";
};
