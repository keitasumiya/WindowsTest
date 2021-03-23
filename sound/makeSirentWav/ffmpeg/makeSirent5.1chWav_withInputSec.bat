@REM 指定秒数の長さを持った5.1ch wav音源を作成するバッチ. 
@REM 第1引数が指定秒数. 
@REM コマンドプロンプトで実行すると, 5.1ch無音音源が作成される. 
@REM 例: makeSirent5.1chWav_withInputSec.bat 10.5
@REM 結果: sirent-5.1ch_10.5sec.wav というwavファイルができる. 

@echo off
ffmpeg -y -f lavfi -i "aevalsrc=0|0|0|0|0|0:c=5.1:s=48000:d="%1 "sirent-5.1ch_"%1"sec.wav"
