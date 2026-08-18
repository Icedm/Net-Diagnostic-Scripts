---
name: Home Internet Diagnostics
description: Diagnose home internet problems by checking modem status, local gateway health, packet loss, and upstream hop behavior using quick Windows commands.
---

# Home Internet Diagnostics

Use this skill when the issue is home internet service and you need to decide whether the problem is local, modem-related, router-related, or upstream.

## Quick checklist

1. Confirm the device can reach the local gateway.
2. Confirm the gateway can reach public IPs like 8.8.8.8.
3. Check whether packet loss starts before or after the home gateway.
4. Review the trace route for timeouts or jumps at hop 3-5.
5. Check Wi‑Fi vs Ethernet and modem lights.

## Preferred commands

```bat
ping -n 5 192.168.1.1
ping -n 5 8.8.8.8
ping -n 5 example.com
tracert -d -w 2000 -h 10 example.com
pathping -n -p 1000 -q 1 example.com
ipconfig /all
```

## Interpret the results

### Local issue

Symptoms:
- The PC cannot ping the gateway.
- Wi‑Fi signal is weak or unstable.
- Only one device is affected.

Likely cause:
- Device NIC issue, weak Wi‑Fi signal, DHCP problem, or local router issue.

### Modem/router issue

Symptoms:
- Gateway responds, but public IPs fail.
- The cable modem or gateway shows offline or unstable status.
- Trace route times out near the home gateway or first external hop.

Likely cause:
- Failing modem, bad line, modem losing sync, or router misbehaving.

### ISP upstream issue

Symptoms:
- Gateway is healthy, but packet loss or timeouts begin at hop 4 or beyond.
- Public IPs fail intermittently but local links look okay.
- Multiple devices are affected simultaneously.

Likely cause:
- ISP-side routing, congestion, or failing external equipment.

## Recommended next steps

- Reboot the modem and router in the correct order.
- Test with a hardwired Ethernet connection if possible.
- Check the modem status lights and signal levels.
- Use `tracert` repeatedly to look for a pattern rather than a single failure.
- If the issue persists at the same external hop, report it to the ISP as a suspected upstream fault.

## Useful loop for a bad hop

```bat
for /L %i in (1,1,5) do @echo Testing %i && tracert -d -w 2000 -h 10 example.com
```

This helps reveal whether a problem is intermittent or consistent at the same trace step.

## Quick summary to give the user

> The issue is likely not isolated to one PC if multiple devices fail to reach 8.8.8.8. If the trace breaks at a hop beyond the home gateway, that points to the ISP or the modem/router connection rather than the local machine.
