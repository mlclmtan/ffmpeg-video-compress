FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO ffmpeg -i "%%G" -c:v libx264 -c:a copy -crf 28 -vf scale=-1:720 "output\%%~nG.mp4"

FOR /F "tokens=*" %%G IN ('dir /b *.mov') DO ffmpeg -i "%%G" -c:v libx264 -c:a copy -crf 28 -vf scale=-1:720 "output\%%~nG.mov"