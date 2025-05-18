# Google Workspace MCP Server para GENIA

Un servidor MCP (Model Context Protocol) para Google Workspace que permite a GENIA interactuar con Google Drive, Gmail y otros servicios de Google Workspace.

## Características

- Autenticación OAuth 2.0 completa
- Operaciones sobre archivos en Google Drive
- Gestión de correos electrónicos en Gmail
- Integración con el orquestador MCP de GENIA
- Soporte para autenticación por usuario

## Requisitos

- Docker o Rust
- Credenciales OAuth 2.0 de Google (client_id, client_secret, refresh_token)

## Instalación

### Usando Docker

```bash
docker pull ghcr.io/neuroforge1/genia-mcp-server-google-workspace:latest
```

### Ejecución

```bash
docker run -i --rm \
  -e GOOGLE_CLIENT_ID=your_client_id \
  -e GOOGLE_CLIENT_SECRET=your_client_secret \
  -e GOOGLE_REFRESH_TOKEN=your_refresh_token \
  ghcr.io/neuroforge1/genia-mcp-server-google-workspace
```

## Operaciones Soportadas

### Google Drive

- `list_files`: Lista archivos en Google Drive
- `get_file`: Obtiene información de un archivo específico
- `create_file`: Crea un nuevo archivo
- `update_file`: Actualiza el contenido de un archivo
- `delete_file`: Elimina un archivo
- `share_file`: Comparte un archivo con otros usuarios

### Gmail

- `list_messages`: Lista correos electrónicos
- `get_message`: Obtiene un correo electrónico específico
- `send_message`: Envía un correo electrónico
- `draft_message`: Crea un borrador de correo electrónico
- `delete_message`: Elimina un correo electrónico

## Integración con GENIA

Este servidor MCP está diseñado para integrarse con el orquestador MCP de GENIA, permitiendo que los usuarios conecten sus propias cuentas de Google Workspace y ejecuten operaciones a través de la interfaz unificada de GENIA.

### Ejemplo de Configuración en el Orquestador

```python
orchestrator.register_server(
    name="google_workspace",
    command=["docker", "run", "-i", "--rm", 
             "-e", "GOOGLE_CLIENT_ID", 
             "-e", "GOOGLE_CLIENT_SECRET", 
             "-e", "GOOGLE_REFRESH_TOKEN", 
             "ghcr.io/neuroforge1/genia-mcp-server-google-workspace"],
    env_vars={
        "GOOGLE_CLIENT_ID": "${GOOGLE_CLIENT_ID}",
        "GOOGLE_CLIENT_SECRET": "${GOOGLE_CLIENT_SECRET}",
        "GOOGLE_REFRESH_TOKEN": "${GOOGLE_REFRESH_TOKEN}"
    }
)
```

## Manejo de Errores

El servidor incluye manejo robusto de errores para:

- Tokens inválidos o expirados (con renovación automática)
- Permisos insuficientes
- Límites de API excedidos
- Recursos no encontrados
- Errores de formato en solicitudes

Cada error incluye un código específico y un mensaje descriptivo para facilitar la depuración.

## Verificación de Dependencias

El servidor verifica automáticamente todas las dependencias necesarias al iniciar:

- Validez de las credenciales OAuth
- Permisos de acceso a los servicios requeridos
- Conectividad con las APIs de Google

Si alguna dependencia falta o es incompatible, el servidor proporcionará instrucciones claras para resolverlo.

## Desarrollo

### Requisitos

- Rust 1.60+
- Cargo

### Instalación de Dependencias

```bash
cargo build
```

### Compilación

```bash
cargo build --release
```

### Pruebas

```bash
cargo test
```

## Licencia

MIT

## Autor

GENIA Team
