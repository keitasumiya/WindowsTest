@REM mergeWithInput.bat data/FL.wav data/FR.wav data/FC.wav data/LFE.wav data/BL.wav data/BR.wav output.wav
@REM mergeWithInput.bat "data/FL.wav" "data/FR.wav" "data/FC.wav" "data/LFE.wav" "data/BL.wav" "data/BR.wav" "output.wav"
@echo off
cd %~dp0
set FL=%1
set FR=%2
set FC=%3
set LFE=%4
set BL=%5
set BR=%6
set out=%7
ffmpeg -y -i %FL% -i %FR% -i %FC% -i %LFE% -i %BL% -i %BR% -filter_complex "[0:a][1:a][2:a][3:a][4:a][5:a]join=inputs=6:channel_layout=5.1:map=0.0-FL|1.0-FR|2.0-FC|3.0-LFE|4.0-BL|5.0-BR[a]" -map "[a]" %out%