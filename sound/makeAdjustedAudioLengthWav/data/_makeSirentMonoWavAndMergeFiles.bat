@REM ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=0.044" sirent-monoral.wav

ffmpeg -y -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=0.044" "back left_sirent-monoral.wav"
ffmpeg -y -i "back left.mp3" -i "back left_sirent-monoral.wav" -filter_complex "concat=n=2:v=0:a=1" "back left_adjusted.wav"
ffmpeg -y -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=0.064" "back right_sirent-monoral.wav"
ffmpeg -y -i "back right.mp3" -i "back right_sirent-monoral.wav" -filter_complex "concat=n=2:v=0:a=1" "back right_adjusted.wav"
ffmpeg -y -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=0.232" "right_sirent-monoral.wav"
ffmpeg -y -i "right.mp3" -i "right_sirent-monoral.wav" -filter_complex "concat=n=2:v=0:a=1" "right_adjusted.wav"
ffmpeg -y -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=0.184" "left_sirent-monoral.wav"
ffmpeg -y -i "left.mp3" -i "left_sirent-monoral.wav" -filter_complex "concat=n=2:v=0:a=1" "left_adjusted.wav"
ffmpeg -y -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=0.064" "center_sirent-monoral.wav"
ffmpeg -y -i "center.mp3" -i "center_sirent-monoral.wav" -filter_complex "concat=n=2:v=0:a=1" "center_adjusted.wav"

ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=1" sirent-monoral-1sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=2" sirent-monoral-2sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=2.1" sirent-monoral-2.1sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=3" sirent-monoral-3sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=3.1" sirent-monoral-3.1sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=4" sirent-monoral-4sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=4.1" sirent-monoral-4.1sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=5" sirent-monoral-5sec.wav
ffmpeg -f lavfi -i "aevalsrc=0:c=mono:s=48000:d=5.1" sirent-monoral-5.1sec.wav

ffmpeg -y -i "left_adjusted.wav" -i "sirent-monoral-5.1sec.wav" -filter_complex "concat=n=2:v=0:a=1" "left_adjusted_6.1sec.wav"
ffmpeg -y -i "sirent-monoral-1sec.wav" -i "right_adjusted.wav" -i "sirent-monoral-4.1sec.wav" -filter_complex "concat=n=3:v=0:a=1" "right_adjusted_6.1sec.wav"
ffmpeg -y -i "sirent-monoral-2sec.wav" -i "center_adjusted.wav" -i "sirent-monoral-3.1sec.wav" -filter_complex "concat=n=3:v=0:a=1" "center_adjusted_6.1sec.wav"
ffmpeg -y -i "sirent-monoral-3sec.wav" -i "wave100_1sec.wav" -i "sirent-monoral-2.1sec.wav" -filter_complex "concat=n=3:v=0:a=1" "woofer_adjusted_6.1sec.wav"
ffmpeg -y -i "sirent-monoral-4sec.wav" -i "back left_adjusted.wav" -i "sirent-monoral-1sec.wav" -filter_complex "concat=n=3:v=0:a=1" "back left_adjusted_6.1sec.wav"
ffmpeg -y -i "sirent-monoral-5.1sec.wav" -i "back right_adjusted.wav" -filter_complex "concat=n=2:v=0:a=1" "back right_adjusted_6.1sec.wav"

