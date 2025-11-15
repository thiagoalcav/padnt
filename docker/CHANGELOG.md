# Resumo das Implementações Docker

Este documento resume o processo de containerização e otimização da aplicação Padnt.

## 1. Containerização Inicial

- **Objetivo:** Permitir a execução da aplicação em um ambiente Docker.
- **Ações:**
  - Criação de um `Dockerfile` multi-stage para compilar e executar a aplicação.
  - Criação de um `docker-compose.yml` para orquestrar o container, mapear a porta `8080` e definir um volume para a persistência do banco de dados H2.
  - Criação de um `README.md` com instruções de uso.

## 2. Reorganização e Boas Práticas

- **Objetivo:** Organizar os arquivos e separar os processos de build e execução.
- **Ações:**
  - Todos os arquivos relacionados ao Docker foram movidos para um novo diretório `docker/`.
  - Foi criado um script `build-image.sh` para encapsular a lógica de construção da imagem Docker.
  - O `docker-compose.yml` foi ajustado para usar a imagem pré-construída, simplificando o processo de execução.
  - O `README.md` foi atualizado para refletir o novo fluxo de trabalho.

## 3. Otimização de Tamanho da Imagem

- **Objetivo:** Reduzir o tamanho da imagem Docker final, que inicialmente era de **~305MB**.
- **Ações:**
  - A imagem base do estágio final foi trocada de `eclipse-temurin:17-jre-jammy` para `gcr.io/distroless/java17-debian12`. As imagens "distroless" do Google são mínimas, mais seguras e oferecem um excelente equilíbrio entre tamanho e estabilidade.
  - Uma otimização mais avançada com `jlink` foi tentada, mas se mostrou excessivamente complexa devido às dependências dinâmicas (reflexão) do Spring Framework, resultando em instabilidade.
  - A abordagem com a imagem **Distroless** foi adotada como a solução final.

## Resultado Final

A imagem final, estável e segura, tem um tamanho de aproximadamente **270MB**. Esta solução representa uma redução significativa em relação ao tamanho original e é a abordagem recomendada por sua simplicidade e robustez e alinhamento com o processo de build original da aplicação.