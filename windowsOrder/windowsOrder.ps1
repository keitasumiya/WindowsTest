Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Platform
{
    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr GetWindow(IntPtr hwnd, GetWindowType uCmd);

    [DllImport("user32.dll", SetLastError = true)]
    public static extern IntPtr GetDesktopWindow();
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
$window = [Platform]::GetWindow([Platform]::GetDesktopWindow(), [GetWindowType]::Child)
while ($window -ne [IntPtr]::Zero)
{
    $window
    $window = [Platform]::GetWindow($window, [GetWindowType]::Next)
}