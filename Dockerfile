FROM rust:1.70-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos del repositorio (que Render ya clonó)
COPY . .

# Compilar la aplicación
RUN cargo build --release

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["./target/release/mcp-google-workspace"]
