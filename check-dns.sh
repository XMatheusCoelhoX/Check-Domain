#!/bin/bash

# ==============================================================================
# SCRIPT: DNS Checker Pro
# DESCRIÇÃO: Verifica resolução de nomes a partir de um arquivo .txt
# ==============================================================================

# --- Definição de Cores e Estilos ---
VERDE='\033[0;32m'
VERMELHO='\033[0;31m'
AZUL='\033[0;34m'
AMARELO='\033[1;33m'
RESET='\033[0m'
NEGRITO='\033[1m'
SUBR='\033[4m'

# --- Verificação de Argumentos ---
# Verifica se o usuário passou o arquivo como primeiro argumento ($1)
if [ -z "$1" ]; then
    echo -e "${VERMELHO}${NEGRITO}ERRO:${RESET} Nenhum arquivo foi fornecido."
    echo -e "${AMARELO}Uso:${RESET} $0 lista_dominios.txt"
    exit 1
fi

ARQUIVO_DOMINIOS="$1"

# Verifica se o arquivo informado realmente existe no diretório
if [ ! -f "$ARQUIVO_DOMINIOS" ]; then
    echo -e "${VERMELHO}${NEGRITO}ERRO:${RESET} O arquivo '${ARQUIVO_DOMINIOS}' não foi encontrado."
    exit 1
fi

# --- Inicialização de Contadores ---
sucesso=0
falha=0
total=0

# --- Limpeza de Tela e Cabeçalho ---
clear
echo -e "${AZUL}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${AZUL}║${RESET} ${NEGRITO}          SISTEMA DE VERIFICAÇÃO DE DOMÍNIOS          ${RESET} ${AZUL}║${RESET}"
echo -e "${AZUL}╠══════════════════════════════════════════════════════════╣${RESET}"
echo -e "${AZUL}║${RESET} ${AMARELO}ARQUIVO:${RESET} $(printf '%-41s' "$ARQUIVO_DOMINIOS")  ${AZUL}║${RESET}"
echo -e "${AZUL}║${RESET} ${AMARELO}DATA:${RESET}    $(printf '%-41s' "$(date '+%d/%m/%Y %H:%M:%S')")  ${AZUL}║${RESET}"
echo -e "${AZUL}╚══════════════════════════════════════════════════════════╝${RESET}"
echo ""

# --- Cabeçalho da Tabela ---
printf "  ${NEGRITO}%-40s | %-15s${RESET}\n" "DOMÍNIO" "STATUS"
echo "  ------------------------------------------------------------"

# --- Processamento do Arquivo ---
while IFS= read -r linha || [[ -n "$linha" ]]; do
    # Limpa espaços em branco e ignora linhas vazias ou comentários
    dominio=$(echo "$linha" | xargs)
    [[ -z "$dominio" || "$dominio" == \#* ]] && continue

    ((total++))
    printf "  %-40s | " "$dominio"

    # Executa o nslookup silenciosamente
    if nslookup "$dominio" >/dev/null 2>&1; then
        echo -e "${VERDE}${NEGRITO}RESOLVE ✅${RESET}"
        ((sucesso++))
    else
        echo -e "${VERMELHO}${NEGRITO}FALHA ❌${RESET}"
        ((falha++))
    fi
done < "$ARQUIVO_DOMINIOS"

# --- Rodapé e Resumo ---
echo "  ------------------------------------------------------------"
echo -e "\n${NEGRITO}  RESUMO DO TESTE:${RESET}"
echo -e "  📊 Total Processado: $total"
echo -e "  ✅ Sucessos:         ${VERDE}$sucesso${RESET}"
echo -e "  ❌ Falhas:           ${VERMELHO}$falha${RESET}"
echo ""
echo -e "${AZUL}  [ Concluído ]${RESET}"
echo ""
