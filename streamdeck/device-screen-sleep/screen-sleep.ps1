Start-Sleep -Milliseconds 800

$signature = @'
[DllImport("user32.dll")]
public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);
'@

$mon = Add-Type -MemberDefinition $signature -Name Mon -Namespace Native -PassThru

[void]$mon::SendMessage(
    0xffff,
    0x0112,
    0xF170,
    2
)
