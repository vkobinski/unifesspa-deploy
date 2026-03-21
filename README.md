# Unifesspa - Sistema de Avaliações

Sistema web para criação e gerenciamento de avaliações acadêmicas.

## Pré-requisitos

Antes de executar o sistema, é necessário instalar os seguintes programas:

### 1. Docker Desktop

O Docker é o programa que vai rodar todo o sistema automaticamente.

1. Acesse: https://www.docker.com/products/docker-desktop/
2. Clique em **"Download for Windows"**
3. Execute o instalador e siga as instruções na tela
4. **Reinicie o computador** quando solicitado
5. Após reiniciar, abra o **Docker Desktop** e aguarde até que ele mostre **"Engine running"** (ícone verde na barra inferior do programa)

### 2. Git

O Git é necessário para baixar o código do sistema.

1. Acesse: https://git-scm.com/download/win
2. Clique em **"Click here to download"**
3. Execute o instalador — pode manter todas as opções padrão clicando em **"Next"** até o final

## Como executar o sistema

1. **Abra o Docker Desktop** e aguarde ele iniciar completamente (ícone verde)
2. **Clique duas vezes** no arquivo `iniciar.bat`
3. Aguarde o processo terminar (na primeira vez pode levar de 3 a 10 minutos)
4. Quando aparecer a mensagem **"Sistema iniciado com sucesso!"**, abra o navegador e acesse:

   **http://localhost:3000**

## Como parar o sistema

1. **Clique duas vezes** no arquivo `parar.bat`
2. Aguarde a mensagem **"Sistema parado com sucesso."**

## Como usar o sistema

1. Ao acessar http://localhost:3000, você verá a tela de login
2. Clique em **"Cadastrar"** para criar uma nova conta
3. Após o cadastro, faça login com seu e-mail e senha
4. No menu lateral, você poderá:
   - **Avaliações** — visualizar avaliações criadas
   - **Cadastrar Avaliação** — criar uma nova avaliação
   - **Questões** — gerenciar banco de questões
   - **Cadastrar Questões** — adicionar novas questões

## Solução de problemas

| Problema | Solução |
|----------|---------|
| `iniciar.bat` mostra erro de Docker | Abra o Docker Desktop e aguarde o ícone ficar verde antes de executar |
| A página não carrega no navegador | Aguarde 1-2 minutos após o `iniciar.bat` terminar e tente novamente |
| Erro ao baixar o código (git clone) | Verifique se o Git está instalado e se há conexão com a internet |
| Erro de porta já em uso | Feche outros programas que possam estar usando as portas 3000 ou 4000 |
| O sistema está lento na primeira vez | Normal — o Docker precisa baixar as imagens e compilar o código. As próximas vezes serão mais rápidas |

## Informações técnicas

- **Frontend:** React com TypeScript (porta 3000)
- **Backend:** Node.js com Express e GraphQL (porta 4000)
- **Banco de dados:** MongoDB (porta 27017)
- Todos os serviços rodam em containers Docker isolados
