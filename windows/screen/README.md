## Monitor Command Parameters

This script sends a Windows monitor power command using `SendMessage`.

```powershell
[void]$mon::SendMessage(
    0xffff,
    0x0112,
    0xF170,
    2
)
```

### Parameters

| Parameter |    Value | Description                                        |
| --------- | -------: | -------------------------------------------------- |
| `hWnd`    | `0xffff` | Sends the command to all top-level windows.        |
| `hMsg`    | `0x0112` | Identifies this as a Windows system command.       |
| `wParam`  | `0xF170` | Identifies the command as a monitor power command. |
| `lParam`  |      `2` | Specifies the monitor power action to perform.     |

### Monitor power actions

The last parameter, `lParam`, controls what happens to the monitor.

| Value | Action                        |
| ----: | ----------------------------- |
|  `-1` | Turn monitor on               |
|   `1` | Put monitor in low-power mode |
|   `2` | Turn monitor off              |
