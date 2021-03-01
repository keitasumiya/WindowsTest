' How to use
' test2.vbs [processName] [processor number]
' test2.vbs notepad 1 -> notepad.exe CPU0 (01)
' test2.vbs notepad 2 -> notepad.exe CPU1 (10)
' test2.vbs notepad 3 -> notepad.exe CPU0,1 (11)

'====================================
' ps1の起動用スクリプト
'====================================
Option Explicit

'FSOオブジェクト、Shellオブジェクト
Dim objFSO
Dim objWshShell

'VBSパス、VBS格納フォルダ、PS1パス
Dim strVBSPath
Dim strVBSFolder
Dim strPS1Path

'オブジェクト参照
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objWshShell = WScript.CreateObject("WScript.Shell")

Dim ARGS
set ARGS=WScript.Arguments

'VBSパス、VBS格納フォルダ、PS1パス
strVBSPath = Wscript.ScriptFullName
strVBSFolder = objFSO.GetFile(StrVBSPath).ParentFolder
strPS1Path = strVBSFolder & "\" & "setProcessorAffinity.ps1"

' ps1を作成
Dim fso
Dim tso
Set fso = CreateObject("Scripting.FileSystemObject")
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Set tso = fso.OpenTextFile("setProcessorAffinity.ps1", ForWriting, true)
tso.Write("$Process = Get-Process " + ARGS.Item(0) + "; $Process.ProcessorAffinity=" + ARGS.Item(1))
tso.Close

'PS1起動オプション
Const OPT = "Powershell -ExecutionPolicy Unrestricted -NoExit "

'PS1起動
objWshShell.Run OPT & strPS1Path,0,false

'オブジェクト解放
Set objFSO = Nothing
Set objWshShell = Nothing

'終了
Wscript.Quit