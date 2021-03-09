Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Platform
{
    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr GetWindow(IntPtr hwnd, GetWindowType uCmd);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr GetDesktopWindow();

    [DllImport("kernel32.dll")]
    public static extern uint GetLastError();

    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool SetForegroundWindow(IntPtr hwnd);
}

public enum GetWindowType : uint
{
    First = 0,
    Last = 1,
    Next = 2,
    Prev = 3,
    Owner = 4,
    Child = 5,
    EnabledPopup = 6
}
"@
function EnumerateWindows
{
    $window = [Platform]::GetWindow([Platform]::GetDesktopWindow(), [GetWindowType]::Child)
    while ($window -ne [IntPtr]::Zero)
    {
        $window
        $window = [Platform]::GetWindow($window, [GetWindowType]::Next)
    }
}
$handles = @(Get-Process | Where-Object { $_.Name -eq 'Excel' } | Foreach-Object { $_.MainWindowHandle })
if ($handles -eq $null) {
    return
}
$handle = EnumerateWindows | Where-Object { $handles.Contains($_) } | Select-Object -First 1
$handle
[Platform]::SetForegroundWindow($handle)
