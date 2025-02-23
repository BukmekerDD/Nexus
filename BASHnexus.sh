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
source ~/.bashrc

echo "Обновление Rust..."
rustup update

# Новые команды после rustup update
echo "Удаление старого protobuf-compiler..."
sudo apt remove -y protobuf-compiler

echo "Скачивание и установка protobuf..."
curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v25.2/protoc-25.2-linux-x86_64.zip

echo "Распаковка protobuf..."
unzip protoc-25.2-linux-x86_64.zip -d "$HOME/.local"

echo "Удаление архива..."
rm protoc-25.2-linux-x86_64.zip

echo "Добавление protoc в PATH..."
export PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

echo "Проверка версии protoc..."
protoc --version

echo "Скачивание и установка Nexus..."
curl -o nexus_install.sh https://cli.nexus.xyz/ && chmod +x nexus_install.sh && ./nexus_install.sh
