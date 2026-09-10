@echo off
rem Sirve el desglose AI-DLC en http://localhost:8080
cd /d "%~dp0"
echo Abre http://localhost:8080 en tu navegador
python -m http.server 8080
pause
