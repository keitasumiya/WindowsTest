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

'VBSパス、VBS格納フォルダ、PS1パス
strVBSPath = Wscript.ScriptFullName
strVBSFolder = objFSO.GetFile(StrVBSPath).ParentFolder
strPS1Path = strVBSFolder & "\Script\test.ps1"

'PS1起動オプション
Const OPT = "Powershell -ExecutionPolicy Unrestricted -NoExit "

'PS1起動
objWshShell.Run OPT & strPS1Path,0,false

'オブジェクト解放
Set objFSO = Nothing
Set objWshShell = Nothing

'終了
Wscript.Quit