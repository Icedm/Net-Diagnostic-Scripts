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
