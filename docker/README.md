# Padnt com Docker

Este documento descreve como executar a aplicação Padnt utilizando Docker e Docker Compose.

## Pré-requisitos

- Docker
- Docker Compose

## Executando a Aplicação

Para executar a aplicação, navegue até o diretório `docker` e siga os seguintes passos:

1.  **Construa a imagem Docker:**

    A partir do diretório `docker`, execute o script de build para criar a imagem localmente:
    ```bash
    ./build-image.sh
    ```
    Este comando irá construir a imagem Docker `padnt:latest`.

2.  **Inicie o container:**

    Após a imagem ser construída, inicie o container com o Docker Compose:
    ```bash
    docker compose up
    ```
    O comando acima irá iniciar o container da aplicação utilizando a imagem `padnt:latest` construída no passo anterior.

3.  **Acesse a aplicação:**

    Após o container ser iniciado, a aplicação estará disponível no seguinte endereço:

    [http://localhost:8080](http://localhost:8080)

## Parando a Aplicação

Para parar a aplicação, pressione `Ctrl + C` no terminal onde o `docker compose up` está sendo executado, ou execute o seguinte comando (a partir do diretório `docker`) em outro terminal:

```bash
docker compose down
```

## Persistência de Dados

A aplicação utiliza o banco de dados H2 para persistir os dados. Os dados são armazenados no diretório `docker/padnt-data`, que é criado na primeira vez que o container é iniciado. Este diretório é mapeado para o container, garantindo que os dados não sejam perdidos, e está configurado para ser ignorado pelo Git através do arquivo `docker/.gitignore`.

**Nota:** O diretório `padnt-data` é criado dentro da pasta `docker`, no mesmo local do arquivo `docker-compose.yml`. Se você mover os arquivos de docker para outro local e quiser preservar os dados existentes, lembre-se de mover também o diretório `padnt-data`.