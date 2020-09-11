if NOT EXIST "compressed\" MKDIR "compressed\"

REM duplicate image
FOR /F "tokens=*" %%G IN ('dir /b *.jpg') DO copy "%%G" "compressed\"

REM change image metadata for ascending results
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.jpg') DO exiftool "-filemodifydate<datetimeoriginal" -overwrite_original "compressed\%%G"
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.jpg') DO exiftool "-filecreatedate<datetimeoriginal" -overwrite_original "compressed\%%G"

REM duplicate image
FOR /F "tokens=*" %%G IN ('dir /b *.jpeg') DO copy "%%G" "compressed\"

REM change image metadata for ascending results
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.jpeg') DO exiftool "-filemodifydate<datetimeoriginal" -overwrite_original "compressed\%%G"
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.jpeg') DO exiftool "-filecreatedate<datetimeoriginal" -overwrite_original "compressed\%%G"

REM max compress crf 28 scale 720p
FOR /F "tokens=*" %%G IN ('dir /b *.mp4') DO ffmpeg -i "%%G" -c:v libx264 -c:a copy -crf 28 -vf scale=-1:720 -map_metadata 0 "compressed\%%~nG.mp4"

REM change video metadata for ascending results
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.mp4') DO exiftool "-filemodifydate<createdate" -api "QuickTimeUTC" -overwrite_original "compressed\%%G"
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.mp4') DO exiftool "-filecreatedate<createdate" -api "QuickTimeUTC" -overwrite_original "compressed\%%G"

REM max compress crf 28 scale 720p
FOR /F "tokens=*" %%G IN ('dir /b *.mov') DO ffmpeg -i "%%G" -c:v libx264 -c:a copy -crf 28 -vf scale=-1:720 -map_metadata 0 "compressed\%%~nG.mov"

REM change video metadata for ascending results
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.mov') DO exiftool "-filemodifydate<createdate" -api "QuickTimeUTC" -overwrite_original "compressed\%%G"
FOR /F "tokens=*" %%G IN ('dir /b compressed\*.mov') DO exiftool "-filecreatedate<createdate" -api "QuickTimeUTC" -overwrite_original "compressed\%%G"