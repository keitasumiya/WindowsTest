# Window Z Order

## メモ

2021/03/09 18:55

一応, EnumWindowによってWindow Z Orderを取得はできる. 

これはC#内でWin32をDLLImportすることでも使用可能. 

ただし, GetWindowText等によりアンマネージなメモリがでてしまい, メモリリークが発生してしまう. 

現時点でこの問題をまだ解決できていないので, さらなる修正, 調査が必要である. 



## ref

### 1回目の調査リンク集

command prompt > ショートカットを実行できるようだ - Qiita

https://qiita.com/7of9/items/4681cc9271228ae83034

 

【Unity】Find関数の使い分け(オブジェクトを見つける時) - 徒然エンジニアブログ

https://turedureengineer.hatenablog.com/entry/2018/11/17/205537

 

【Unity】C#の基本構文『while』

http://kimama-up.net/unity-while/

 

Time-realtimeSinceStartup - Unity スクリプトリファレンス

https://docs.unity3d.com/ja/current/ScriptReference/Time-realtimeSinceStartup.html

 

Windows で実行中のプロセス（タスク）を終了 (kill) する (taskkill) | まくまくWindowsノート

https://maku77.github.io/windows/admin/taskkill.html

 

「取得したハンドルでウィンドウを閉じたいのですが。。」（1） Insider.NET － ＠IT

https://www.atmarkit.co.jp/bbs/phpBB/viewtopic.php?topic=12906&forum=7

 

外部アプリケーションの終了

https://www.tokovalue.jp/FindWindow_U.htm

 

Windows API/ウィンドウメッセージ - WisdomSoft

http://www.wisdomsoft.jp/425.html

 

他のEXEのハンドルを取得しVBから終了する(VB6.0) - VBレスキュー(花ちゃん)

http://hanatyan.sakura.ne.jp/vb6/application05.htm

 

windows api プロセス 終了 - Google 検索

[https://www.google.com/search?sxsrf=ALeKk01tuDnn-_1faTt903kuyMH8-6eTGg%3A1614824821094&ei=dUVAYI-EBar2hwOFsaNY&q=windows+api+%E3%83%97%E3%83%AD%E3%82%BB%E3%82%B9+%E7%B5%82%E4%BA%86&oq=windows+api++%E7%B5%82%E4%BA%86&gs_lcp=Cgdnd3Mtd2l6EAMYADIGCAAQBxAeMgYIABAHEB4yBAgAEB4yBAgAEB46CAgAELADEM0CUMwlWMwlYIo_aAFwAHgAgAFUiAGnAZIBATKYAQCgAQGqAQdnd3Mtd2l6yAECwAEB&sclient=gws-wiz](https://www.google.com/search?sxsrf=ALeKk01tuDnn-_1faTt903kuyMH8-6eTGg%3A1614824821094&ei=dUVAYI-EBar2hwOFsaNY&q=windows+api+プロセス+終了&oq=windows+api++終了&gs_lcp=Cgdnd3Mtd2l6EAMYADIGCAAQBxAeMgYIABAHEB4yBAgAEB4yBAgAEB46CAgAELADEM0CUMwlWMwlYIo_aAFwAHgAgAFUiAGnAZIBATKYAQCgAQGqAQdnd3Mtd2l6yAECwAEB&sclient=gws-wiz)

 

Hex 関数｜VBScript関数リファレンス

https://www.kanaya440.com/contents/script/vbs/function/num/hex.html

 

[C#]各種データ型と16進数文字列の変換方法

http://nanoappli.com/blog/archives/4836

 

ウィンドウのタイトルからプロセスを探す - .NET Tips (VB.NET,C#...)

https://dobon.net/vb/dotnet/process/getprocessesbywindowtitle.html

 

Windows で実行中のプロセス（タスク）を終了 (kill) する (taskkill) | まくまくWindowsノート

https://maku77.github.io/windows/admin/taskkill.html

 

プラットフォーム依存コンパイル - Unity マニュアル

https://docs.unity3d.com/ja/2018.4/Manual/PlatformDependentCompilation.html

 

Unityでプラットフォームの判別処理はスクリプトから簡単にできる！

http://bumpy-game.jp/live/unity_platform_script/

 

 

 

 

別プロセスウィンドウの位置・サイズを変える

https://www.tokovalue.jp/SetWindowPos3_U.htm

 

Control.ControlCollection.GetChildIndex メソッド (System.Windows.Forms) | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/api/system.windows.forms.control.controlcollection.getchildindex?view=net-5.0

 

C# - 別プロセスのそれぞれのメインウィンドウのZオーダーを比較したい｜teratail

https://teratail.com/questions/152953

 

ウィンドウを列挙したときのZオーダー

https://social.msdn.microsoft.com/Forums/vstudio/ja-JP/79efebe6-eb1a-4dd7-8eb5-ad3051dbc8c3/12454124511253112489124541243421015253691237512383123921236512?forum=vcgeneralja

 

ウィンドウの列挙

http://wisdom.sakura.ne.jp/system/winapi/win32/win142.html

 

画面上のすべてのウィンドウとそのタイトルを列挙する - .NET Tips (VB.NET,C#...)

https://dobon.net/vb/dotnet/process/enumwindows.html

 

グラフィカルインターフェイスがあるプロセスを探す - .NET Tips (VB.NET,C#...)

https://dobon.net/vb/dotnet/process/finduiprocess.html

 

PowerShellでもっといい条件文の書き方５選 - Qiita

https://qiita.com/nimzo6689/items/6c6443a7494674e44949

 

PowerShellにおける"戻り値"と"Return"について - しばたテックブログ

https://blog.shibata.tech/entry/2015/07/05/114903

 

PowerShellらしい関数の書き方 [PS Advent Calendar '12] - PowerShell Scripting Weblog

http://winscript.jp/powershell/253

 

PowerShellの演算子

https://www.vwnet.jp/Windows/PowerShell/Ope/OpeListg.htm

 

これでサンプルコードが読めるようになる、PowerShellでの記号の意味（4ページ目） | 日経クロステック（xTECH）

https://xtech.nikkei.com/it/atcl/column/16/101300227/102200002/?P=4

 

Select-Object コマンドレットを復習 - Qiita

https://qiita.com/miyamiya/items/059430d5499f0fe336ff

 

Select-Object (Microsoft.PowerShell.Utility) - PowerShell | Microsoft Docs

https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object?view=powershell-7.1&viewFallbackFrom=powershell-6

 

API 関数解説

https://www.tokovalue.jp/function/GetWindow.htm

 

ウィンドウハンドルの検索

http://yamatyuu.net/computer/program/sdk/win/findwindow/index.html

 

コンソール ウィンドウ ハンドルを取得する - Windows Server | Microsoft Docs

https://docs.microsoft.com/ja-jp/troubleshoot/windows-server/performance/obtain-console-window-handle

 

ウィンドウのハンドル - Google 検索

[https://www.google.com/search?q=%E3%82%A6%E3%82%A3%E3%83%B3%E3%83%89%E3%82%A6%E3%81%AE%E3%83%8F%E3%83%B3%E3%83%89%E3%83%AB&oq=%E3%82%A6%E3%82%A3%E3%83%B3%E3%83%89%E3%82%A6%E3%81%AE%E3%83%8F%E3%83%B3%E3%83%89%E3%83%AB&aqs=chrome..69i57j0l4.2632j0j7&sourceid=chrome&ie=UTF-8](https://www.google.com/search?q=ウィンドウのハンドル&oq=ウィンドウのハンドル&aqs=chrome..69i57j0l4.2632j0j7&sourceid=chrome&ie=UTF-8)

 

Visual Basic 図解 基礎解説

http://rucio.o.oo7.jp/main/kiso/Version.htm

 

デスクトップ画面を取得してみる

http://chokuto.ifdef.jp/urawaza/dispcopy.html

 

デスクトップウィンドウマネージャー(dwm.exe)が重い時の対処法 – Windows10

https://itojisan.xyz/trouble/13868/

 

IntPtr.Zero フィールド (System) | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/api/system.intptr.zero?view=net-5.0

 

[C/C++][Win32] プロセスID、実行ファイル名からウインドウハンドルを取得

https://uguisu.skr.jp/Windows/c_getwindowhandle.html

 

windows ハンドル プロセス - Google 検索

[https://www.google.com/search?q=windows+%E3%83%8F%E3%83%B3%E3%83%89%E3%83%AB+%E3%83%97%E3%83%AD%E3%82%BB%E3%82%B9&sxsrf=ALeKk02fywyPiZUdTJ_O6VWgeVi4CtUAsA:1614581678389&ei=ro88YN6lF9Dn-QaWwIiACw&start=20&sa=N&ved=2ahUKEwjetJq7wY7vAhXQc94KHRYgArA4ChDw0wN6BAgIEE0&biw=1748&bih=1288](https://www.google.com/search?q=windows+ハンドル+プロセス&sxsrf=ALeKk02fywyPiZUdTJ_O6VWgeVi4CtUAsA:1614581678389&ei=ro88YN6lF9Dn-QaWwIiACw&start=20&sa=N&ved=2ahUKEwjetJq7wY7vAhXQc94KHRYgArA4ChDw0wN6BAgIEE0&biw=1748&bih=1288)

 

EnumWindowsを使って別プロセスのExcelを取得してみた - えくせるちゅんちゅん

https://www.excel-chunchun.com/entry/enumwindows-excel-vba

 

Zオーダーのウインドウを取得 - プログラミングのメモ帳(C/C++/HSP)

https://blog.goo.ne.jp/masaki_goo_2006/e/7421fd026d0aa6b375fbbd8dedeea881

 

【C#入門】Add、RemoveでListの要素を追加、削除する方法 | 侍エンジニアブログ

https://www.sejuku.net/blog/41093

 

【C#入門】Listの要素を検索する方法総まとめ(Find/IndexOf/Contains) | 侍エンジニアブログ

https://www.sejuku.net/blog/45381

 

Unity C# メソッド呼び出し方法による速度の違い - WonderPlanet Developers’ Blog

https://developers.wonderpla.net/entry/2015/08/25/190151

 

【Unity】LINQについてかるくまとめてみた - はなちるのマイノート

https://www.hanachiru-blog.com/entry/2019/03/27/213020

 

 

### 2回目 メモリリークを改善しようと色々調査

#### main

画面上のすべてのウィンドウとそのタイトルを列挙する - .NET Tips (VB.NET,C#...)

https://dobon.net/vb/dotnet/process/enumwindows.html

 

GCHandle Struct (System.Runtime.InteropServices) | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/api/system.runtime.interopservices.gchandle?view=net-5.0

 

TextWriter Class (System.IO) | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/api/system.io.textwriter?view=net-5.0

 

 



#### sub

ほぼC#だけのぶろぐ

http://csharp.maeyan.net/Blog/Details/48

 

アプリケーション定義の値 - Google 検索

[https://www.google.com/search?q=%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E5%AE%9A%E7%BE%A9%E3%81%AE%E5%80%A4&oq=%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E5%AE%9A%E7%BE%A9%E3%81%AE%E5%80%A4&aqs=chrome..69i57&sourceid=chrome&ie=UTF-8](https://www.google.com/search?q=アプリケーション定義の値&oq=アプリケーション定義の値&aqs=chrome..69i57&sourceid=chrome&ie=UTF-8)

 

コールバック メソッドとしてのデリゲートのマーシャ リング | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/framework/interop/marshaling-a-delegate-as-a-callback-method?redirectedfrom=MSDN

 

GCHandle のサンプル | Microsoft Docs

https://docs.microsoft.com/ja-jp/previous-versions/dotnet/netframework-4.0/44ey4b32(v=vs.100)

 

ウィンドウのタイトルからプロセスを探す - .NET Tips (VB.NET,C#...)

https://dobon.net/vb/dotnet/process/getprocessesbywindowtitle.html

 

.net - Win32API causes memory leak - Stack Overflow

https://stackoverflow.com/questions/19915182/win32api-causes-memory-leak

 

 

 

 

そろそろ本気で『落ちないアプリ』を作ろうぜ - Atuweb 開発 Log

https://atuweb.net/201508_we-must-create-no-crush-application/

 

【Unity】Unityでメモリリークを分析するための5つの方法 - LIGHT11

https://light11.hatenadiary.com/entry/2019/11/12/222321

 

【Unity】Memory Profilerでメモリにロードされているオブジェクトを可視化する - LIGHT11

https://light11.hatenadiary.com/entry/2019/09/09/003901

 

Memory プロファイラー - Unity マニュアル

https://docs.unity3d.com/ja/2018.4/Manual/ProfilerMemory.html

 

enumWindows gch free - Google 検索

https://www.google.com/search?q=enumWindows+gch+free&oq=enumWindows+gch+free&aqs=chrome..69i57.10920j0j7&sourceid=chrome&ie=UTF-8

 

C#備忘録 - Windowハンドル関連の逆引きリファレンス的なやつ（主にWin32API） - Qiita

https://qiita.com/kob58im/items/34724e36603351d78596

 

やりがちなアンマネージドメモリのリークと対処方法 - Qiita

https://qiita.com/Nuits/items/9ce6a205a50bf8e3dbeb

 

制約された実行領域 | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/framework/performance/constrained-execution-regions?redirectedfrom=MSDN

 

[C#][.NET] ガベージコレクタ/ガベージコレクション(GC)に関するまとめ - Qiita

https://qiita.com/koara-local/items/d961511469795660cd61

 

AllocHGlobalとAllocCoTaskMem　どちらを使うべきか？ - Qiita

https://qiita.com/Nuits/items/9dc67cb12e2dcf8d09bd

 

.NETによる画像処理の高速化Tips：unsafe編（改稿：2015/11/08） - Qiita

https://qiita.com/Nuits/items/da8c11e5b284ad6cb90a

 

[C#] 構造体のポインタを引数にとるWindows APIの呼び出し

https://www.ipentec.com/document/csharp-call-api-with-structure

 

『Visual C#実践講座』　1章 その10 連続したメモリ領域に配列内容を格納する - C#にハマってみる日記

https://csh-2.hatenadiary.org/entry/20100317/1268832843

 

GCHandle Struct (System.Runtime.InteropServices) | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/api/system.runtime.interopservices.gchandle?view=net-5.0

 

GetWindowText and memory leak - Unity Forum

https://forum.unity.com/threads/getwindowtext-and-memory-leak.572386/

 

int から IntPtrへ変換する - C#プログラミング

https://www.ipentec.com/document/csharp-int-to-intptr-conversion

 

IntPtr Struct (System) | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/api/system.intptr?view=net-5.0

 

GCHandle value belongs to a different domain - Google 検索

https://www.google.com/search?q=GCHandle+value+belongs+to+a+different+domain&oq=GCHandle+value+belongs+to+a+different+domain&aqs=chrome..69i57j0i5i19i30.469j0j7&sourceid=chrome&ie=UTF-8

 

SafeHandleクラスを使ってライブラリのハンドルをラップする (C#) - .NET サンプルコード - 総武ソフトウェア推進所

https://smdn.jp/programming/dotnet-samplecodes/disposing/fb0558080bc911eb97288f27619b2bb2/

 

 

 

 

 

 

 

【C#入門】String.Splitで文字列を分割(複数文字、文字数でも分割) | 侍エンジニアブログ

https://www.sejuku.net/blog/44242

 

【Unity】はじめてのコルーチン!これさえ読めば基礎はカンペキ | 侍エンジニアブログ

https://www.sejuku.net/blog/83712

 

Taskkill - DOS コマンド一覧 - Programming Field

https://www.pg-fl.jp/program/dos/doscmd/taskkill.htm

 

 

 

 

 

C#からDLL関数の呼び出し | TomoSoft

https://tomosoft.jp/design/?p=4607

 

C#からWindows API(Win32API)を使いたいときに参考になるサイト集 - Qiita

https://qiita.com/kob58im/items/e40081491a75204ccb6e

 

【Windows/C#】なるべく丁寧にDllImportを使う - Qiita

https://qiita.com/mitsu_at3/items/94807ee0b3bf34ffb6b2

 

microsoft/CsWin32: A source generator to add a user-defined set of Win32 P/Invoke methods and supporting types to a C# project.

https://github.com/microsoft/cswin32

 

dotnet/pinvoke: A library containing all P/Invoke code so you don't have to import it every time. Maintained and updated to support the latest Windows OS.

https://github.com/dotnet/pinvoke

 

記事が散らかってきたので自己の記事のリンク集を作る - Qiita

https://qiita.com/kob58im/items/5537de5f7971e9a70e23

 

【Windows/C#】なるべく丁寧にDllImportを使う - Qiita

https://qiita.com/mitsu_at3/items/94807ee0b3bf34ffb6b2

 

extern 修飾子 - C# リファレンス | Microsoft Docs

https://docs.microsoft.com/ja-jp/dotnet/csharp/language-reference/keywords/extern

 

StringBuilderの内容をクリアする - .NET Tips (VB.NET,C#...)

https://dobon.net/vb/dotnet/string/stringbuilderclear.html

 

getwindowtext メモリ解放 - Google 検索

[https://www.google.com/search?sxsrf=ALeKk0007C656DGXwEAi5Kfxp6I2bdbRiA%3A1615092343087&ei=d1pEYN72BIHrwQOq4bCIBA&q=getwindowtext+%E3%83%A1%E3%83%A2%E3%83%AA%E8%A7%A3%E6%94%BE&oq=getwindowtext+%E3%83%A1%E3%83%A2%E3%83%AA%E8%A7%A3%E6%94%BE&gs_lcp=Cgdnd3Mtd2l6EAM6BwgjELADECc6BAgjECc6BQgAEM0CUO0rWMc5YMtAaAFwAHgAgAGCAYgB9QiSAQM1LjaYAQCgAQGqAQdnd3Mtd2l6yAEBwAEB&sclient=gws-wiz&ved=0ahUKEwiejo7rr53vAhWBdXAKHaowDEEQ4dUDCA4&uact=5](https://www.google.com/search?sxsrf=ALeKk0007C656DGXwEAi5Kfxp6I2bdbRiA%3A1615092343087&ei=d1pEYN72BIHrwQOq4bCIBA&q=getwindowtext+メモリ解放&oq=getwindowtext+メモリ解放&gs_lcp=Cgdnd3Mtd2l6EAM6BwgjELADECc6BAgjECc6BQgAEM0CUO0rWMc5YMtAaAFwAHgAgAGCAYgB9QiSAQM1LjaYAQCgAQGqAQdnd3Mtd2l6yAEBwAEB&sclient=gws-wiz&ved=0ahUKEwiejo7rr53vAhWBdXAKHaowDEEQ4dUDCA4&uact=5)

 

 