#!/bin/bash
set -e

# Navega para o diretório raiz do projeto para que o contexto do build seja correto
cd "$(dirname "$0")/.."

IMAGE_TAG="padnt:latest"

echo "Removendo imagem antiga '$IMAGE_TAG' (se existir)..."
docker rmi -f $IMAGE_TAG 2>/dev/null || true

echo "Construindo a imagem Docker: $IMAGE_TAG"
# O comando de build é executado a partir da raiz do projeto
docker build -t $IMAGE_TAG -f docker/Dockerfile .

echo ""
echo "--- Build Concluído ---"
echo "Imagem final:"
docker images $IMAGE_TAG
