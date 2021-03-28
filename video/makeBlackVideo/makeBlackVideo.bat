@REM ffmpeg -f lavfi -i color=c=black:s=7680x4320:r=60:d=5 a.mp4
@REM ffmpeg -f lavfi -i color=c=black:s=7680x4320:r=60:d=5 -vcodec hap -format hap -r 60 -chunks 64 a.mov
@REM ffmpeg -f lavfi -i color=c=black:s=7680x4320:r=60:d=1 -vcodec hap -format hap -r 60 -chunks 64 black_1sec.mov
ffmpeg -f lavfi -i color=c=black:s=960x540:r=60:d=1 -vcodec hap -format hap -r 60 -chunks 64 black_1sec.mov
