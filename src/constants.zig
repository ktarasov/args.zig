//! Shared constants for args.zig.

pub const Defaults = struct {
    pub const program_name = "app";
    pub const error_prefix = "Error";
    pub const warning_prefix = "Warning";
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

    pub const validation_out_of_range = "value out of range";
    pub const validation_too_short = "value is too short";
    pub const validation_too_long = "value is too long";
    pub const validation_pattern_mismatch = "value does not match required pattern";
    pub const validation_custom_failed = "custom validation failed";
    pub const validation_file_not_found = "file not found";
    pub const validation_directory_not_found = "directory not found";
    pub const validation_permission_denied = "permission denied";
    pub const validation_invalid_path = "invalid path";
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

    pub const default_string = "";
    pub const default_int = "0";
    pub const default_float = "0.0";
    pub const default_array = "[]";
    pub const default_bool = "false";
};
