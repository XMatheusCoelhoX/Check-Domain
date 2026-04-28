# 🌐 DNS Checker Pro

![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

Um script Bash automatizado e visual para verificar a resolução de nomes (DNS) de múltiplos domínios a partir de um arquivo de texto. Ideal para SysAdmins, profissionais de Red Team e engenheiros de rede.

## ✨ Funcionalidades

- 📄 **Leitura Dinâmica:** Processa listas de domínios via argumentos de arquivo `.txt`.
- 📊 **Painel Visual:** Interface limpa no terminal com cores e tabela formatada.
- 🧹 **Tratamento de Dados:** Ignora linhas vazias e comentários dentro do arquivo de lista.
- 📈 **Relatório Final:** Exibe um resumo total de sucessos e falhas após a execução.

## 🚀 Como Usar

### Pré-requisitos
Certifique-se de ter o `nslookup` instalado (pacote `dnsutils` ou `bind-utils` dependendo da sua distro).

### Instalação
1. Clone o repositório:
   ```bash
   git clone [https://github.com/SEU-USUARIO/dns-checker-pro.git](https://github.com/SEU-USUARIO/dns-checker-pro.git)
   cd dns-checker-pro
