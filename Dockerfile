FROM golang:1.19-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Clonar el repositorio
RUN apk add --no-cache git && \
    git clone https://github.com/NeuroForge1/genia-mcp-server-google-workspace.git . && \
    apk del git

# Compilar la aplicación
RUN go mod download && \
    go build -o google-workspace-mcp-server

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["./google-workspace-mcp-server"]
