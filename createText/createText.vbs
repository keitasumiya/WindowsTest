Set fso = CreateObject("Scripting.FileSystemObject")
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Set tso = fso.OpenTextFile("text1.txt", ForWriting, true)
tso.Write("foo")
tso.WriteLine("bar")
tso.WriteBlankLines(1)
tso.WriteLine("hoge")
tso.Write("hello" + vbCrLf + "world" + vbCrLf)
tso.Close