# ⚽ FUTEBOLADA — Sistema CRUD em PHP

Projeto desenvolvido para **estudo do conceito CRUD (Create, Read, Update, Delete)** utilizando **PHP e MySQL**.  
O sistema simula o gerenciamento de **clubes de futebol** e **tabelas de partidas**, servindo como prática para aprendizado de programação web e banco de dados.

---

## 🎯 Objetivo do Projeto

Este projeto tem como principal finalidade **aprender e praticar o desenvolvimento de sistemas CRUD**.  
Cada módulo do sistema (clubes e tabelas) permite:
- Criar registros (Create)
- Visualizar registros (Read)
- Atualizar registros (Update)
- Excluir registros (Delete)

---

## 📁 Estrutura do Projeto

14642_FUTEBOLADA/\
├── clubes/\
│ ├── clube_create.php # Formulário de criação de clube\
│ ├── clube_create_ok.php # Processa o cadastro no banco\
│ ├── clube_read.php # Lista os clubes\
│ ├── clube_update.php # Atualiza informações de um clube\
│ ├── clube_delete.php # Exclui um clube\
│\
├── tabelas/\
│ ├── tabela_create.php\
│ ├── tabela_create_ok.php\
│ ├── tabela_read.php\
│ ├── tabela_update.php\
│ ├── tabela_delete.php\
│\
├── inc/\
│ ├── config.php # Configuração do banco de dados\
│ ├── functions.php # Funções auxiliares PHP\
│\
├── css/\
│ └── style.css # Estilos da interface\
│\
└── index.php # Página inicial

---

## ⚙️ Tecnologias Utilizadas

- **PHP** — Lógica do sistema e conexão com o banco de dados  
- **MySQL** — Armazenamento das informações  
- **HTML / CSS** — Estrutura e aparência das páginas  
- **XAMPP** — Servidor local para execução  

---

## 🚀 Como Executar o Projeto

1. **Clonar o repositório:**
Mover para a pasta do servidor local:\

Exemplo (XAMPP): C:\xampp\htdocs\14642_futebolada

Configurar o banco de dados:

Criar um banco no phpMyAdmin chamado futebolada

Importar o script SQL (caso exista)

Configurar o arquivo inc/config.php:

## php
Copiar código:\

$host = "localhost";\
$user = "root";\
$pass = "";\
$db   = "2025_2p_futebolada";\

Acessar no navegador:

---

🧩 Funcionamento do CRUD
Ação	Arquivo	Descrição
Create	clube_create.php, tabela_create.php	- Formulário para inserir novos dados
Read	clube_read.php, tabela_read.php -	Exibe todos os registros cadastrados
Update	clube_update.php, tabela_update.php	- Permite editar registros existentes
Delete	clube_delete.php, tabela_delete.php	- Remove registros do banco

Cada uma dessas operações é feita através de requisições PHP conectadas ao MySQL, mostrando de forma prática como funciona o CRUD completo.

---

🧠 Aprendizados Envolvidos
Conexão entre PHP e MySQL

Estrutura de CRUD

Manipulação de formulários e dados via POST/GET

Separação de código em módulos (clubes, tabelas, inc)

Organização de diretórios em um projeto web

📅 Status do Projeto
🚧 Em desenvolvimento — Projeto em fase de testes e aprimoramento para fins educacionais.

👨‍💻 Autor
Aluno: [Renan Straquicini]
Ano: 2025

📜 Licença
Este projeto é de uso educacional.


