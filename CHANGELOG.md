# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-08-17

### Added
- **quick_net_check.bat** - Comprehensive network diagnostic snapshot
  - Gateway connectivity check
  - Public IP and hostname resolution
  - DNS validation
  - Traceroute diagnostics
  
- **loop_trace.bat** - Repeating traceroute utility
  - Multiple traceroute runs to identify patterns
  - Helps detect intermittent hop failures
  - Perfect for ISP troubleshooting

- **loop_ping_public.bat** - Continuous ping monitor
  - Pings 8.8.8.8 (Google DNS) repeatedly
  - Monitors packet loss over time
  - Great for establishing connection baselines

- **NetTools.bat** - Interactive network toolkit
  - Menu-driven interface for multiple checks
  - Easy access to common diagnostics

- Professional documentation
  - Comprehensive README with badges
  - Detailed troubleshooting guide (3+ scenarios)
  - Contributing guidelines
  - MIT License

### Features
- ✅ Zero dependencies — runs on vanilla Windows
- ✅ Compatible with Windows 10/11 and Server 2016+
- ✅ No installation required — just run the scripts
- ✅ Clear, actionable output for network diagnostics
- ✅ Built-in guidance for common ISP issues (Cox, etc.)

### Documentation
- Complete README with platform badges
- Detailed usage instructions for each script
- Troubleshooting guide for common scenarios:
  - Gateway ping failures
  - Public IP connectivity issues
  - Traceroute hop failures
- Example workflows for Cox cable internet

---

## Release Notes for v1.0.0

### Overview
Network Diagnostic Scripts v1.0.0 is the initial release of a lightweight, no-dependency network diagnostic toolkit for Windows. Designed for quick troubleshooting of home and ISP connectivity issues.

### What's Included
- 4 batch scripts covering gateway checks, traceroute analysis, and ping monitoring
- Professional GitHub repository with badges and documentation
- MIT License for open-source use
- Contributing guidelines for community involvement

### Getting Started
1. Clone or download the repository
2. Navigate to the `scripts/` folder
3. Run `quick_net_check.bat` for a full diagnostic snapshot
4. Compare results against the troubleshooting guide in README.md

### Known Limitations
- Windows only (batch scripts)
- Requires command prompt or PowerShell
- Some ISPs may filter ICMP (affecting ping/traceroute)

### Support
- Report issues via GitHub Issues
- Suggest improvements via GitHub Discussions
- See CONTRIBUTING.md for development guidelines

---

For more details, visit: https://github.com/Icedm/Net-Diagnostic-Scripts
