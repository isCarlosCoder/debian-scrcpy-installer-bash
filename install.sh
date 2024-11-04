#!/bin/bash

# Cores para facilitar a leitura
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
RESET='\033[0m' # Reseta a cor

echo -e "${CYAN}Iniciando o processo de instalação do scrcpy...${RESET}"

echo -e "${YELLOW}Atualizando pacotes e instalando dependências necessárias...${RESET}"
sudo apt install -y ffmpeg libsdl2-2.0-0 adb wget gcc git pkg-config meson ninja-build libsdl2-dev libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev libswresample-dev libusb-1.0-0 libusb-1.0-0-dev
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Instalação das dependências concluída com sucesso.${RESET}"
else
    echo -e "${RED}Erro ao instalar dependências. Verifique sua conexão e tente novamente.${RESET}"
    exit 1
fi

echo -e "${CYAN}Clonando repositório do scrcpy...${RESET}"
git clone https://github.com/Genymobile/scrcpy
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Repositório clonado com sucesso.${RESET}"
else
    echo -e "${RED}Erro ao clonar repositório. Verifique sua conexão e tente novamente.${RESET}"
    exit 1
fi

echo -e "${CYAN}Entrando na pasta do scrcpy...${RESET}"
cd scrcpy || { echo -e "${RED}Erro ao acessar a pasta do scrcpy${RESET}"; exit 1; }

echo -e "${YELLOW}Iniciando o script de instalação do scrcpy...${RESET}"
./install_release.sh
if [ $? -eq 0 ]; then
    echo -e "${GREEN}scrcpy instalado com sucesso!${RESET}"
else
    echo -e "${RED}Erro ao instalar o scrcpy. Verifique as mensagens de erro acima.${RESET}"
    exit 1
fi

echo -e "${CYAN}Processo de instalação concluído!${RESET}"
