#!/bin/bash

echo "Обновление пакетов..."
sudo apt update && sudo apt upgrade -y

echo "Установка пакетов..."
sudo apt install curl iptables build-essential git wget lz4 jq make gcc nano automake autoconf tmux htop nvme-cli pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev -y

echo "Установка protobuf-compiler..."
sudo apt install -y protobuf-compiler

echo "Установка cargo..."
sudo apt install -y cargo

echo "Установка Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs/ | sh -s -- -y

echo "Добавление cargo в PATH..."
source "$HOME/.cargo/env"
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

echo "Обновление Rust..."
rustup update

echo "Запуск screen сессии..."
screen -S nexus

echo "Скачивание и установка Nexus..."
curl -o -y nexus_install.sh https://cli.nexus.xyz/ && chmod +x nexus_install.sh && ./nexus_install.sh -y
