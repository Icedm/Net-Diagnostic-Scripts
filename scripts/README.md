# Network Diagnostic Scripts

These are small Windows batch scripts you can run when internet is unstable or a hop appears to be failing.

## Files

- `quick_net_check.bat` - checks gateway, public IP, hostname, and trace route
- `loop_trace.bat` - repeats traceroute several times to look for a pattern
- `loop_ping_public.bat` - pings 8.8.8.8 repeatedly to watch for packet loss

## Example usage

1. Open Command Prompt in the scripts folder.
2. Run one of the `.bat` files.
3. If the trace breaks at a hop beyond your home gateway, that suggests an upstream ISP or modem/router path problem.

## Typical interpretation

- Gateway ping fails: local Wi‑Fi, NIC, or home network issue.
- Public ping fails but gateway works: modem/router or ISP issue.
- Trace starts timing out at hop 4 or later: likely upstream problem.

## Repeat test example

```bat
for /L %i in (1,1,5) do @echo Testing %i && tracert -d -w 2000 -h 10 example.com
```

## Notes

- These scripts are for Windows.
- Use them with the same troubleshooting flow as the Net Diag Agent.
- If the same hop fails repeatedly, it is usually the best clue to the problem.
