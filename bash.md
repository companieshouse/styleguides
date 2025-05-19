# Shell (Bash) Coding Standards

This document outlines key practices for writing clean and efficient Bash code.

It is based on the [Google shell coding standard](https://google.github.io/styleguide/shell.xml)
with the **exception of using four spaces** (not two as
[specified in the standard](https://google.github.io/styleguide/shellguide.html#indentation)).

## General

- Use **Bash** (`#!/bin/bash`) for shell scripts. Avoid other shells unless necessary, unless required by legacy systems.
- Scripts should be **short and simple**; if a script exceeds 100 lines or involves complex logic, consider another language such as Python or Go.
- **Use `set -e`** to ensure scripts exit on error. Also, consider `set -u` to treat unset variables as errors and `set -o pipefail` to catch failures in pipelines.

  ```sh
  # Example usage of set options
  set -euo pipefail

  echo "This will exit on error, unset variable use, or pipeline failure."
  ```

- **Avoid `eval`** due to security risks, as it can lead to command injection vulnerabilities.

  ```sh
  # Dangerous example of eval
  user_input="rm -rf /"
  eval "$user_input"  # This can be catastrophic!
  ```

- **Use `ShellCheck`** to detect common script issues and ensure scripts are robust and maintainable.

  ```sh
  # Run ShellCheck on a script
  shellcheck my_script.sh
  ```

- Use comments where necessary but avoid excessive commenting. Code should be self-explanatory where possible.

## File Naming & Structure

- Executables should **omit the `.sh` extension** unless required for build systems or packaging.
- **Libraries must have a `.sh` extension** and should not be executable to prevent unintended execution.
- **Start scripts with a hashbang (`#!/bin/bash`) and avoid `#!/usr/bin/env bash`** to ensure consistency in script execution.
- **Organise scripts properly:**
  - Place constants and environment variables at the top.
  - Keep all functions together below constants, maintaining modularity and readability.
  - The `main` function should be at the bottom, with `main "$@"` as the last line.
- Ensure scripts can be executed from any location and do not rely on the current working directory.

  ```sh
  # Example of making a script location-independent
  SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  source ${SCRIPT_DIRECTORY}/common
  ```

## Formatting

- **Indentation:** Use **four spaces per level** to maintain readability and consistency.
- **Line length:** Keep lines **under 80 characters** where possible; wrap long commands using `\` for clarity.
- **Use blank lines** between logical blocks to improve readability.
- **Control structures (`if`, `for`, `while`) should use `; then` and `; do` on the same line.**

  ```sh
  # Example of correct control structure formatting
  if [[ -f "file.txt" ]]; then
      echo "File exists"
  else
      echo "File does not exist"
  fi
  ```

- Avoid trailing whitespace and ensure scripts end with a newline.

## Functions

- Use **snake_case function names** to maintain consistency.
- **Omit the `function` keyword** to align with standard Bash conventions.
- **Always use `local` for function-specific variables** to prevent global namespace pollution.

  ```sh
  # Example function with local variable
  my_function() {
      local name="Mark"
      echo "Hello, $name!"
  }
  ```

- Each function in a library must have a comment header describing:
  - **Purpose** of the function.
  - **Global variables used** and whether they are modified.
  - **Arguments taken** with details.
  - **Outputs and return values**, if applicable.
- Define all functions before they are used to ensure clarity.

- Variable initialisation inside functions is not required prior to use in loops. For example:

  ```sh
  get_configuration () {
      # This initialisation is not required
      configuration=""
  
      for definition in $(find ${PIPELINE_DEFINITIONS} -type f -name ${pipeline}); do
          local configuration=${definition}
      done

      echo ${configuration}  # Still accessible here
  }
  ```

## Variables

- **Use `local` for function-specific variables** to avoid unexpected behavior.
- **Use uppercase for constants and environment variables** for easy identification.

  ```sh
  # Example of defining a constant
  readonly MAX_RETRIES=5
  ```

- **Prefer `${var}` over `$var`** for clarity and to prevent issues with unintended variable expansion.
- **Always quote variables in expansions:** `"${var}"` to avoid unwanted word splitting.

  ```sh
  # Example showing why quoting is important
  file="My Documents"
  ls "$file"  # Correct
  ls $file    # Incorrect, will split into 'ls My Documents'
  ```

- Prefer using `readonly` for constants to prevent accidental modification.

## Command Execution

- **Use built-in commands over external ones** to improve script performance and avoid unnecessary dependencies.
- **Check return values** explicitly to catch and handle errors effectively:

  ```sh
  if ! mv "${file}" "${dest}"; then
      echo "Error moving file" >&2
      exit 1
  fi
  ```

- **Prefer `$(command)` over backticks (`) for command substitution** to enhance readability and avoid escaping issues.

  ```sh
  # Example of command substitution
  files=$(ls)
  ```

- **Use process substitution (`< <(...)`)** instead of pipelines to avoid unintended subshell behavior.

## Quoting & Expansion

- **Always quote variables** unless word splitting is explicitly desired.
- **Use `[[ ... ]]` instead of `[ ... ]`** for conditionals, as it provides safer string comparisons.
- **Use `-z` and `-n`** instead of checking for empty strings manually.
- **For numeric comparisons, use `(( ... ))` or `-lt`, `-gt`** instead of string comparisons to avoid unexpected behavior.

  ```sh
  # Example of numeric comparison
  if (( count > 10 )); then
      echo "Count is greater than 10"
  fi
  ```

- Prefer using arrays instead of space-separated lists to prevent issues with spaces in filenames.

## Arrays

- **Use arrays** instead of space-separated strings for lists to prevent issues with special characters and spaces.
- Expand arrays using `"${array[@]}"` to preserve elements correctly.
- Avoid `for var in $(command)`, as it can split incorrectly; use `while read -r` or `readarray` instead for robust handling.

  ```sh
  # Example of safe array iteration
  while read -r line; do
      echo "Line: $line"
  done < input.txt
  ```

- Use associative arrays (`declare -A`) for key-value pairs when necessary.

## Best Practices

- **Avoid aliases in scripts**; use functions instead to ensure consistent behavior.
- **Do not use SUID/SGID in shell scripts**; use `sudo` or dedicated privilege escalation methods if necessary.
- Ensure error messages are sent to `STDERR` for proper logging and debugging.
- **Use meaningful exit codes** (`exit 1` for general errors, `exit 2` for missing files, etc.).

- ✅ The preferred way to print new lines with echo is to use:

  ```sh
  echo -e 'Comment\n'
  ```

  ❌ Instead of using a blank `echo` call:

  ```sh
  echo 'Comment'
  echo
  ```

  This avoids unnecessary output inconsistencies.

## Consistency & Readability

- Follow existing style when modifying scripts to ensure uniformity.
- **Be consistent across the codebase** to improve maintainability.
- Use comments **only when necessary** to explain non-obvious code; avoid redundant or overly verbose comments.
- Consider using logging functions instead of plain `echo` to standardise output handling.
