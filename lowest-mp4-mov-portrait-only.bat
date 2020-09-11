if NOT EXIST "portrait\" MKDIR "portrait\"

REM max compress crf 28 scale 720p
FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO ffmpeg -i "%%G" -c:v libx264 -c:a copy -crf 28 -vf scale=720:-1 -map_metadata 0 "portrait\%%~nG.mp4"
REM change video metadata for ascending results
FOR /F "tokens=*" %%G IN ('dir /b portrait\*.mp4') DO exiftool "-filemodifydate<createdate" -api "QuickTimeUTC" -overwrite_original "portrait\%%G"
FOR /F "tokens=*" %%G IN ('dir /b portrait\*.mp4') DO exiftool "-filecreatedate<createdate" -api "QuickTimeUTC" -overwrite_original "portrait\%%G"

REM max compress crf 28 scale 720p
FOR /F "tokens=*" %%G IN ('dir /b *.mov') DO ffmpeg -i "%%G" -c:v libx264 -c:a copy -crf 28 -vf scale=720:-1 -map_metadata 0 "portrait\%%~nG.mov"
REM change video metadata for ascending results
FOR /F "tokens=*" %%G IN ('dir /b portrait\*.mov') DO exiftool "-filemodifydate<createdate" -api "QuickTimeUTC" -overwrite_original "portrait\%%G"
FOR /F "tokens=*" %%G IN ('dir /b portrait\*.mov') DO exiftool "-filecreatedate<createdate" -api "QuickTimeUTC" -overwrite_original "portrait\%%G"