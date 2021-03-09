Private Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Private Declare Function SetWindowText Lib "user32" Alias "SetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String) As Long

Private Sub Command1_Click()

Dim hTargetWnd Long

Dim Ret As Long

hTargetWnd = WindowFromPoint(0, 0)

Ret = SetWindowText(hTargetWnd, "ハンドル取得成功！")

End Sub