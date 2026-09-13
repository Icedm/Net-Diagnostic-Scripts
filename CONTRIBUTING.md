# Contributing to Network Diagnostic Scripts

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing.

## How to Contribute

### Reporting Bugs
- Check if the issue already exists
- Provide clear reproduction steps
- Include your Windows version and which script failed
- Attach relevant output or logs

### Suggesting Improvements
- Describe the improvement and why it would be useful
- Provide examples if possible
- Consider compatibility with Windows 10/11 and Server 2016+

### Submitting Changes

1. **Fork** the repository
2. **Create a branch** for your feature:
   ```bash
   git checkout -b feature/my-improvement
   ```
3. **Make your changes** with clear, descriptive commit messages
4. **Test thoroughly** on Windows
5. **Push** to your fork
6. **Open a Pull Request** with a clear description of your changes

## Code Guidelines

- **Batch Scripts**: Keep scripts simple and well-commented
- **Naming**: Use descriptive names for functions and variables
- **Comments**: Add comments explaining complex logic
- **Compatibility**: Ensure scripts work on Windows 10/11 and Server 2016+
- **No dependencies**: Avoid requiring external tools or software

## Testing

Before submitting a PR:
- Test on at least one Windows 10/11 machine
- Run the script with and without admin privileges
- Verify error handling

## Testing Procedures

These procedures apply to Windows batch script changes. Follow them before opening a pull request.

### Supported Windows versions

Test on at least one of:

- Windows 10 (any edition)
- Windows 11 (any edition)
- Windows Server 2016 or later

State the exact version you tested on in the pull request (for example "Windows 11 23H2").

### Run from the scripts directory

The scripts resolve paths relative to the repository layout and are designed to be run from the `scripts` directory — `NetTools.bat` launches the other scripts by filename, so they will not work correctly when invoked from the repository root or another working directory. Run each script from `scripts` (or the directory stated in the script's header comment).

### Test with and without administrator privileges (optional)

Some diagnostics may behave differently when elevated, but elevation is not required by the current scripts. Run each changed script both ways and confirm it fails gracefully without elevation and produces the expected output with it:

1. In a normal (non-elevated) prompt — confirm a clear message instead of a crash.
2. In an elevated prompt (`Run as administrator`) — confirm the diagnostic output.

### Test default values

Run the script with no arguments and confirm the documented defaults are used.

### Test unexpected input

The current scripts do not strictly validate non-numeric or out-of-range values, so confirm how each script behaves rather than assuming it rejects bad input. For inputs that should be numeric, observe and document what happens with empty, non-numeric, or out-of-range values (the script may echo the value, ignore it, or fall back to a default). Report anything that looks like a crash or a silent wrong result.

### Test logging-enabled and logging-disabled behavior

If the script writes log files:

- With logging on, confirm the log file is created in the documented location.
- With logging off (or the default), confirm no unexpected log file is created.

### Confirm generated files are not committed

Log files, captures, or any generated artifacts from your test runs must not be committed. Check `git status` before staging and add the file to `.gitignore` if the script generates it in the repo directory.

### Report the Windows version

Include the Windows version and build (for example "Windows 11 Pro 23H2, build 22631") in the pull request description, especially when behaviour differs from what you expected.

### Include relevant command output

Paste the relevant console output (success and failure cases) into the pull request, not just a summary. If output is long, include the key sections and a note about the rest.

## Pull Request Checklist

- [ ] Tested on the Windows versions listed in the pull request
- [ ] Ran with and without administrator privileges (where relevant)
- [ ] Tested default values and unexpected input; documented observed behaviour
- [ ] Tested logging-enabled and logging-disabled behaviour (if applicable)
- [ ] No generated files (logs, captures) committed; `git status` is clean of artifacts
- [ ] Windows version and relevant command output included in the description


## AI-Assisted Contributions

AI coding tools are welcome. Contributors remain responsible for the pull request, including its code, claims, security, and compatibility.

When using AI assistance:
- Review every generated change before committing it
- Test the complete workflow on Windows 10/11 or Windows Server 2016+
- Do not include passwords, tokens, private network details, or other sensitive data in prompts, issues, logs, or commits
- Disclose substantial AI assistance in the pull request using the checklist
- Explain any behavior or design decisions that may not be obvious from the diff

An AI developer may be given a specific issue and this repository's `CONTRIBUTING.md`, but the final pull request must still be opened and reviewed by a human contributor.

## Commit Message Format

Use clear, descriptive messages:
```
feat: add new diagnostic check
fix: resolve timeout issue in loop_ping
docs: update README with new examples
```

## Questions?

Open a GitHub Issue to discuss ideas before investing time in development.

Thanks for contributing! 🙌
