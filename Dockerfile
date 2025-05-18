FROM ghcr.io/neuroforge1/genia-mcp-server-google-workspace:latest

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["./google-workspace-mcp-server"]
