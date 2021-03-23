@REM 指定秒数の長さを持った5.1ch wav音源を作成するバッチ. 
@REM バッチファイル名の_で囲まれた部分が指定秒数の箇所. 
@REM このバッチファイルをダブルクリック等で実行すると, 5.1ch無音音源が作成される. 
@REM 例: makeSirent5.1chWavOF_10.5_sec.bat をダブルクリック
@REM 結果: sirent-5.1ch_10.5sec.wav というwavファイルができる. 

@echo off
echo %0
for /f %%i in ('echo %0') do set batFilename=%%~ni

for /f "tokens=1-2 delims=_" %%a in ("%batFilename%") do (
  echo %%b
  ffmpeg -y -f lavfi -i "aevalsrc=0|0|0|0|0|0:c=5.1:s=48000:d="%%b "sirent-5.1ch_"%%b"sec.wav"
)
