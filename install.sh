#!/bin/bash

echo "Iniciando o processo de instalação do scrcpy..."

echo "Atualizando pacotes e instalando dependências necessárias..."
sudo apt install -y ffmpeg libsdl2-2.0-0 adb wget gcc git pkg-config meson ninja-build libsdl2-dev libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev libswresample-dev libusb-1.0-0 libusb-1.0-0-dev
if [ $? -eq 0 ]; then
    echo "Instalação das dependências concluída com sucesso."
else
    echo "Erro ao instalar dependências. Verifique sua conexão e tente novamente."
    exit 1
fi

echo "Clonando repositório do scrcpy..."
git clone https://github.com/Genymobile/scrcpy
if [ $? -eq 0 ]; then
    echo "Repositório clonado com sucesso."
else
    echo "Erro ao clonar repositório. Verifique sua conexão e tente novamente."
    exit 1
fi

echo "Entrando na pasta do scrcpy..."
cd scrcpy || { echo "Erro ao acessar a pasta do scrcpy"; exit 1; }

echo "Iniciando o script de instalação do scrcpy..."
./install_release.sh
if [ $? -eq 0 ]; then
    echo "scrcpy instalado com sucesso!"
else
    echo "Erro ao instalar o scrcpy. Verifique as mensagens de erro acima."
    exit 1
fi

echo "Processo de instalação concluído!"
