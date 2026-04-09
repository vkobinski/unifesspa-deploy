@echo off
chcp 65001 >nul
echo ============================================
echo    UNIFESSPA - Parando o sistema...
echo ============================================
echo.

docker compose down

echo.
echo Sistema parado com sucesso.
echo.
pause
