Option Explicit

Dim oClassSet, oClass, oLocator, oService
Dim szMsg

Set oLocator = WScript.CreateObject("WbemScripting.SWbemLocator")
Set oService = oLocator.ConnectServer
Set oClassSet = oService.ExecQuery("SELECT * FROM Win32_Processor")
For Each oClass In oClassSet
  MsgBox "CPU Name: " & oClass.Name & vbCrLF & _
         "CPU Usage[%]: " & oClass.LoadPercentage & vbCrLf & _
         "CPU Clock : " & oClass.CurrentClockSpeed
Next

Set oClassSet = Nothing
Set oClass = Nothing
Set oService = Nothing
Set oLocator = Nothing