@echo off
chcp 65001 >nul
echo ============================================
echo    UNIFESSPA - Sistema de Avaliações
echo ============================================
echo.

REM Verifica se o Docker está rodando
docker info >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Docker não está em execução.
    echo Por favor, abra o Docker Desktop e aguarde ele iniciar.
    echo Depois, execute este arquivo novamente.
    pause
    exit /b 1
)

echo [1/4] Baixando o código do frontend...
if not exist "front" (
    git clone https://github.com/vkobinski/front.git front
) else (
    echo      Frontend já existe, atualizando...
    pushd front && git pull & popd
)
if not exist "front\package.json" (
    echo [ERRO] Falha ao baixar o frontend. Verifique sua conexão com a internet e o Git.
    pause
    exit /b 1
)

echo [2/4] Baixando o código do backend...
if not exist "back" (
    git clone https://github.com/vkobinski/back.git back
) else (
    echo      Backend já existe, atualizando...
    pushd back && git pull & popd
)
if not exist "back\package.json" (
    echo [ERRO] Falha ao baixar o backend. Verifique sua conexão com a internet e o Git.
    pause
    exit /b 1
)

echo [3/4] Copiando arquivos de configuração...
copy /Y Dockerfile.backend back\Dockerfile >nul
copy /Y Dockerfile.frontend front\Dockerfile >nul
copy /Y nginx.conf front\nginx.conf >nul

echo [4/4] Iniciando os serviços com Docker...
echo      Isso pode demorar alguns minutos na primeira vez.
echo.
docker compose up --build -d

if errorlevel 1 (
    echo.
    echo [ERRO] Falha ao iniciar os serviços.
    echo Verifique se o Docker Desktop está funcionando corretamente.
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
