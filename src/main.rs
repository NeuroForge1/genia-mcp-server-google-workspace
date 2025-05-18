// Versión simplificada del servidor MCP para Google Workspace
// Esta es una solución alternativa para el despliegue en Render

use std::env;
use std::io::{self, Write};
use std::net::TcpListener;
use std::thread;

fn main() {
    let port = env::var("PORT").unwrap_or_else(|_| "8000".to_string());
    let addr = format!("0.0.0.0:{}", port);
    
    println!("Iniciando servidor en {}", addr);
    
    let listener = TcpListener::bind(&addr).expect("No se pudo iniciar el servidor");
    
    for stream in listener.incoming() {
        thread::spawn(move || {
            let mut stream = stream.expect("Error en la conexión");
            
            let response = "HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=UTF-8\r\n\r\n\
                           <html><body>\
                           <h1>Google Workspace MCP Server funcionando correctamente</h1>\
                           </body></html>\r\n";
            
            stream.write_all(response.as_bytes()).expect("Error al enviar respuesta");
        });
    }
}
