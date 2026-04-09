@echo off
chcp 65001 >nul
echo ============================================
echo    UNIFESSPA - Sistema de Avaliacoes
echo ============================================
echo.

REM Verifica se o Docker esta rodando
docker info >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Docker nao esta em execucao.
    echo Por favor, abra o Docker Desktop e aguarde ele iniciar.
    echo Depois, execute este arquivo novamente.
    pause
    exit /b 1
)

echo [1/4] Baixando o codigo do frontend...
if not exist "front\" (
    git clone https://github.com/vkobinski/front.git front
) else (
    echo      Frontend ja existe, atualizando...
    cd front
    git pull
    cd ..
)
if not exist "front\package.json" (
    echo [ERRO] Falha ao baixar o frontend. Verifique sua conexao com a internet e o Git.
    pause
    exit /b 1
)

echo [2/4] Baixando o codigo do backend...
if not exist "back\" (
    git clone https://github.com/vkobinski/back.git back
) else (
    echo      Backend ja existe, atualizando...
    cd back
    git pull
    cd ..
)
if not exist "back\package.json" (
    echo [ERRO] Falha ao baixar o backend. Verifique sua conexao com a internet e o Git.
    pause
    exit /b 1
)

echo [3/4] Copiando arquivos de configuracao...
copy /Y Dockerfile.backend back\Dockerfile >nul
copy /Y Dockerfile.frontend front\Dockerfile >nul
copy /Y nginx.conf front\nginx.conf >nul
copy /Y back\schemas\unifesspa\schema.graphql front\schema.graphql >nul

echo [4/4] Iniciando os servicos com Docker...
echo      Isso pode demorar alguns minutos na primeira vez.
echo.
docker compose up --build -d

if errorlevel 1 (
    echo.
    echo [ERRO] Falha ao iniciar os servicos.
    echo Verifique se o Docker Desktop esta funcionando corretamente.
    pause
    exit /b 1
)

echo.
echo ============================================
echo    Sistema iniciado com sucesso!
echo ============================================
echo.
echo    Acesse no navegador:
echo    http://localhost:3000
echo.
echo    Para parar o sistema, execute: parar.bat
echo ============================================
echo.
pause
