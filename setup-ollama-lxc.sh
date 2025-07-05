#!/bin/bash
set -e

echo "[1/7] Actualizando sistema..."
apt update && apt upgrade -y

echo "[2/7] Instalando dependencias básicas..."
apt install -y curl git build-essential libssl-dev unzip \
    python3 python3-pip python-is-python3

echo "[3/7] Instalando Ollama..."
curl -fsSL https://ollama.com/install.sh | sh
systemctl enable ollama
systemctl start ollama

echo "[4/7] Instalando Python libs..."
pip install --upgrade pip
pip install ollama langchain requests

echo "[5/7] Descargando modelo llama3..."
ollama pull llama3

echo "[6/7] Creando prueba en Python..."
cat <<EOF > /root/test_llama.py
from ollama import chat

response = chat(model='llama3', messages=[
  {'role': 'user', 'content': 'Hola, ¿qué sabes de Backstage de Spotify?'}
])

print(response['message']['content'])
EOF

echo "[7/7] Todo listo 🎉"
echo "Ejecuta: python3 /root/test_llama.py"
