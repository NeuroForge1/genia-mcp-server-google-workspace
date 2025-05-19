FROM rust:1.70-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos del repositorio (que Render ya clonó)
COPY . .

# Verificar la estructura de directorios
RUN ls -la

# Compilar la aplicación simplificada
RUN cargo build --release

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio (usando el nombre correcto del binario según Cargo.toml)
CMD ["./target/release/mcp-google"]
