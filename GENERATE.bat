@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

REM Parametros recebidos: ID da voz, linguagem e nome do arquivo.
set "VOICE_ID=%~1"
set "LANG=%~2"
set "NAME=%~3"

if not defined VOICE_ID (
    echo Erro: ID da voz nao informado.
    goto fim
)
if not defined LANG (
    echo Erro: linguagem nao informada.
    goto fim
)
if not defined NAME (
    echo Erro: nome do arquivo nao informado.
    goto fim
)

REM Gerar timestamp atual (yyyyMMddHHmmss)
for /f "delims=" %%T in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMddHHmmss"') do set "TS=%%T"
if defined TS set "NAME=%NAME%-!TS!"

cd /d "%~dp0"

if not exist ".\outputs" mkdir ".\outputs"

REM Verificar TEXT.txt
if not exist "TEXT.txt" (
    echo Erro: TEXT.txt nao foi encontrado nesta pasta.
    goto fim
)

REM Ler todas as linhas do TXT
set "TEXT="

for /f "usebackq delims=" %%A in ("TEXT.txt") do (
    if defined TEXT (
        set "TEXT=!TEXT! %%A"
    ) else (
        set "TEXT=%%A"
    )
)

if not defined TEXT (
    echo Erro: TEXT.txt esta vazio.
    goto fim
)

REM Gerar audio temporario em WAV
.\ptts.exe --model ./models --lang "%LANG%" --quant q8 --voice "%VOICE_ID%" "!TEXT!" -o ".\outputs\%NAME%-tmp.wav"
if errorlevel 1 goto erro

REM Adicionar 1 segundo de silencio e gerar WAV intermediario
ffmpeg -y -i ".\outputs\%NAME%-tmp.wav" -af "apad=pad_dur=1" ".\outputs\%NAME%.wav"
if errorlevel 1 goto erro

REM Converter WAV para MP3
ffmpeg -y -i ".\outputs\%NAME%.wav" -codec:a libmp3lame -qscale:a 2 ".\outputs\%NAME%.mp3"
if errorlevel 1 goto erro

REM Excluir WAVs somente apos a conversao bem-sucedida
del ".\outputs\%NAME%-tmp.wav"
del ".\outputs\%NAME%.wav"

echo.
echo MP3 gerado com sucesso: .\outputs\%NAME%.mp3
goto fim

:erro
echo.
echo Ocorreu um erro. Os arquivos WAV foram mantidos para verificacao.

:fim
echo.
pause
endlocal
