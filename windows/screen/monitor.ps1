param(
    [ValidateSet("On", "Sleep", "Off")]
    [string]$Action = "Off"
)

$powerValue = switch ($Action) {
    "On"    { -1 }
    "Sleep" { 1 }
    "Off"   { 2 }
}

$mon = Add-Type -MemberDefinition @"
[DllImport("user32.dll")]
public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);
"@ -Name "MonitorPower" -Namespace "Win32" -PassThru

[void]$mon::SendMessage(
    0xffff,
    0x0112,
    0xF170,
    $powerValue
)