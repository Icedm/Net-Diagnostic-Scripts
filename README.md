# Network Diagnostic Scripts

<div align="center">

![Windows](https://img.shields.io/badge/Platform-Windows-0078D4?style=for-the-badge&logo=windows)
![Batch](https://img.shields.io/badge/Language-Batch-FFD700?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)

**Fast, lightweight network diagnostics for Windows** • Identify connectivity issues at a glance • Perfect for troubleshooting home networks

[Quick Start](#quick-start) • [Scripts](#scripts) • [Troubleshooting Guide](#troubleshooting-guide) • [Contributing](#contributing)

</div>

---

## Overview

These are small, efficient Windows batch scripts designed to help you quickly diagnose and troubleshoot internet connectivity issues. Perfect for identifying whether a problem lies with your local network, modem/router, ISP, or a specific upstream hop.

### Key Features

✅ **Lightweight** — No dependencies or installation required  
✅ **Fast** — Get results in seconds  
✅ **Simple** — Easy-to-understand output  
✅ **Effective** — Pinpoint connection issues quickly  

---

## Table of Contents

- [Scripts](#scripts)
- [Quick Start](#quick-start)
- [Detailed Usage](#detailed-usage)
- [Troubleshooting Guide](#troubleshooting-guide)
- [Example Scenarios](#example-scenarios)
- [Contributing](#contributing)
- [License](#license)

---

## Scripts

| Script | Purpose | Use When |
|--------|---------|----------|
| **quick_net_check.bat** | Comprehensive network snapshot | You need a quick overall health check |
| **loop_trace.bat** | Repeating traceroute | You want to identify patterns in hop failures |
| **loop_ping_public.bat** | Continuous ping to 8.8.8.8 | Monitoring for packet loss over time |
| **NetTools.bat** | Interactive network toolkit | You need multiple checks without switching scripts |

---

## Quick Start

### Prerequisites
- **Windows 10/11** or Windows Server 2016+
- Command Prompt or PowerShell
- Administrator privileges (recommended for best results)

### Usage

1. **Clone or download** this repository
2. **Open Command Prompt** (`cmd`) and navigate to the `scripts` folder
3. **Run a script:**
   ```cmd
   quick_net_check.bat
   ```
4. **Review the output** and compare against the [Troubleshooting Guide](#troubleshooting-guide)

---

## Detailed Usage

### quick_net_check.bat
Performs a complete network diagnostic snapshot:
- Gateway connectivity (default gateway IP)
- Public IP address and hostname
- DNS resolution test
- Traceroute to common destinations

**Run it first** when experiencing connectivity issues.

```cmd
quick_net_check.bat
```

### loop_trace.bat
Runs traceroute multiple times to identify intermittent hop failures:

```cmd
loop_trace.bat
```

Best for detecting patterns—if hop 5 fails consistently, you've found the culprit.

### loop_ping_public.bat
Continuously pings Google's public DNS (8.8.8.8) to monitor packet loss. The script asks how many pings to send, how many seconds to wait between pings, and whether to create a log file. The defaults are 10 pings and 1 second:

```cmd
loop_ping_public.bat
```

When logging is enabled, each ping's normal output and an explicit `RESULT: SUCCESS` or `RESULT: FAILURE` line are appended to the filename you provide. The default filename is `ping_log.txt` in the current folder. Let this run for 1-2 minutes to establish a baseline, or longer when collecting evidence for your ISP. Stop with `Ctrl+C` if needed; the log is written as the test runs.

---

## Troubleshooting Guide

### Scenario 1: Gateway Ping Fails ❌

**Problem:** Can't reach your home gateway (usually 192.168.x.x)

**Likely Cause:**
- Local Wi-Fi or ethernet disconnection
- Network interface card (NIC) failure
- Router not responding

**Next Steps:**
- Check physical connections (ethernet cable, Wi-Fi enabled)
- Restart your router
- Check Device Manager for NIC issues
- Run `ipconfig /all` to verify your IP configuration

---

### Scenario 2: Gateway Works, Public Ping Fails ⚠️

**Problem:** Can reach gateway but can't ping 8.8.8.8

**Likely Cause:**
- Modem issue
- Router configuration issue
- ISP blocking ICMP (less common)

**Next Steps:**
- Restart your modem and router (modem first, wait 2 min, then router)
- Check modem status lights (consult your modem's manual)
- Verify DNS is resolving with `nslookup google.com`
- Contact your ISP if the issue persists

---

### Scenario 3: Traceroute Hangs or Times Out Beyond Hop 4 🔍

**Problem:** Trace route fails or times out after your home gateway

**Likely Cause:**
- Upstream ISP routing issue
- Modem routing to wrong path
- ISP filtering ICMP

**Next Steps:**
- Run `loop_trace.bat` multiple times to confirm the pattern
- Note the hop number where it fails
- Check your modem's logs (usually accessible via web interface at 192.168.100.1)
- Contact your ISP with specific hop failure information

---

## Example Scenarios

### Troubleshooting Home Internet Connectivity

```cmd
:: Check gateway
quick_net_check.bat

:: If gateway works but public ping fails, restart modem:
:: 1. Unplug modem for 30 seconds
:: 2. Plug back in, wait 2-3 minutes
:: 3. Run again

:: If trace fails beyond the local gateway, likely ISP or upstream path issue:
loop_trace.bat
```

---

## Contributing

Found an issue? Have a suggestion? Contributions are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Make your changes
4. Commit with a clear message (`git commit -m 'Add feature'`)
5. Push to your fork (`git push origin feature/improvement`)
6. Open a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

---

## License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## Support & Feedback

- 📧 Report issues via [GitHub Issues](https://github.com/Icedm/Net-Diagnostic-Scripts/issues)
- 💡 Have suggestions? Open a [Discussion](https://github.com/Icedm/Net-Diagnostic-Scripts/discussions)
- ⭐ Found this helpful? Please star the repo!

---

**Last Updated:** 2026-08-22 | **Maintained by:** [@Icedm](https://github.com/Icedm)
