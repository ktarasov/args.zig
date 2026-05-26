---
title: Constants Reference
description: Shared constants for args.zig including default labels, error messages, and update checker metadata.
head:
  - - meta
    - name: keywords
      content: zig, args.zig, constants, defaults, errors, help text, update checker
---

# Constants Reference

args.zig centralizes shared strings and defaults in the `constants` module to keep output consistent across the codebase.

## Import

```zig
const args = @import("args");
const constants = args.constants;
```

## Defaults

```zig
constants.Defaults.program_name
constants.Defaults.error_prefix
constants.Defaults.warning_prefix
constants.Defaults.unknown_version
```

## HelpText

Common labels used in help and completion output:

```zig
constants.HelpText.usage
constants.HelpText.commands
constants.HelpText.arguments
constants.HelpText.options
constants.HelpText.print_help
constants.HelpText.print_version
constants.HelpText.author
constants.HelpText.choices
constants.HelpText.default_label
constants.HelpText.env
constants.HelpText.negate
constants.HelpText.deprecated
```

## ErrorMessages

Human-readable messages used by error formatters:

```zig
constants.ErrorMessages.parse_unknown_option
constants.ErrorMessages.schema_invalid_config
constants.ErrorMessages.validation_invalid_path
```

## UpdateChecker

```zig
constants.UpdateChecker.github_repo
```

## TypeNames

Type labels and defaults for `ValueType`:

```zig
constants.TypeNames.string
constants.TypeNames.default_int
```
