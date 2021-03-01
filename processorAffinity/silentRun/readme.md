## How to use

### 文法

`setProcessorAffinity.vbs [processName] [processor number]`

[processName] : プロセス名. 基本的にはexeのファイル名に相当. (hoge.exeならhoge)

[processor number] : 使用するCPUの指定番号. 2進数にした際に1となるCPUが使用されるようになる. 

| 指定番号                      | 2進数表示    | 使われる用になるCPU        |
| ----------------------------- | ------------ | -------------------------- |
| 0                             | 0            | 変化なし. 無効.            |
| 1                             | 1            | 1                          |
| 2                             | 10           | 2                          |
| 3                             | 11           | 2,1                        |
| 4                             | 100          | 3                          |
| 5                             | 101          | 3,1                        |
| 6                             | 110          | 3,2                        |
| 7                             | 111          | 3,2,1                      |
| 8                             | 1000         | 4                          |
| :                             | :            | :                          |
| 4095                          | 111111111111 | 12,11,10,9,8,7,6,5,4,3,2,1 |
| 4294967295 (=2^32-1)          | 111...111    | 32,31,.....,2,1            |
| 18446744073709551616 (2^64-1) | 111...111    | 64,63,...,2,1              |

以降続く. 

### 例

setProcessorAffinity.vbs notepad 1

 -> notepad.exe CPU0 (01)



setProcessorAffinity.vbs notepad 2

 -> notepad.exe CPU1 (10)



setProcessorAffinity.vbs notepad 3

 -> notepad.exe CPU0,1 (11)



## ref

2の32乗と64乗を語呂合わせで覚える - セカイノカタチ
https://qtamaki.hatenablog.com/entry/2016/05/02/185541