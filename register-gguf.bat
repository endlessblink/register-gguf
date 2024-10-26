@echo off
setlocal enabledelayedexpansion

cd "%USERPROFILE%\.ollama\models"
echo Scanning recursively for GGUF files in %cd% and all subfolders...

:: For each GGUF file in all subdirectories
for /r %%f in (*.part) do (
    echo Found partial download: %%f - skipping
)

for /r %%f in (*.gguf) do (
    :: Skip if it's a partial download
    if not "%%~xf"==".part" (
        :: Get the filename without extension to use as model name
        set "modelname=%%~nf"
        
        echo.
        echo Found GGUF file: %%f
        echo Creating model: !modelname!
        
        :: Create a Modelfile next to the GGUF
        echo FROM "%%f" > "%%~dpnf.Modelfile"
        
        :: Create the model in Ollama
        ollama create !modelname! -f "%%~dpnf.Modelfile"
        
        :: Clean up the temporary Modelfile
        del "%%~dpnf.Modelfile"
        
        echo -------------------
    )
)

echo.
echo All done! Run 'ollama list' to see your models.
echo.
pause