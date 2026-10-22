# Programación de convivencia escolar — Colegio Saint George Angol

Esta es una aplicación web estática (HTML, CSS y JavaScript) que puedes abrir y editar en Visual Studio Code.

## Requisitos
- Visual Studio Code
- Un navegador moderno (Chrome, Edge o Safari)

## Abrir el proyecto
1. Descomprime `nexus_project_vscode.zip`.
2. Abre Visual Studio Code.
3. Selecciona **File > Open Folder...** (Archivo > Abrir carpeta).
4. Selecciona la carpeta `nexus_project_vscode`.
5. Abre `index.html`.

## Ejecutar
**Opción sencilla:** abre `index.html` en tu navegador.

**Opción recomendada en VS Code:** instala la extensión **Live Server**:
1. Abre la sección Extensions (Extensiones).
2. Busca `Live Server` y pulsa Install.
3. Haz clic derecho sobre `index.html`.
4. Selecciona **Open with Live Server**.

Se abrirá una dirección local similar a `http://127.0.0.1:5500`.

## Archivos
- `index.html`: aplicación completa; contiene HTML, CSS y JavaScript.
- `README.md`: estas instrucciones.

## Sincronización entre computadores con Supabase

La aplicación ya puede iniciar sesión con Supabase y guardar los datos en una tabla compartida. Para activarlo:

1. Crea un proyecto en [Supabase](https://supabase.com/) y abre **SQL Editor**.
2. Copia y ejecuta el contenido de `supabase-setup.sql`.
3. En **Authentication > Users**, crea un usuario con correo y contraseña para cada persona que usará la aplicación.
4. En **Project Settings > API**, copia el **Project URL** y la **Publishable key** (o la clave pública `anon` si tu proyecto aún muestra las claves antiguas).
5. En `index.html`, reemplaza `PEGA_AQUI_TU_PROJECT_URL` y `PEGA_AQUI_TU_PUBLISHABLE_KEY` por esos valores.
6. Sube los cambios a GitHub y abre el sitio de GitHub Pages. Inicia sesión; el primer inicio en un proyecto vacío copiará los datos guardados en ese navegador. Los demás equipos cargarán esa copia compartida.

La clave pública puede estar en el HTML si la tabla tiene RLS y las políticas del SQL anterior. **Nunca pongas una `service_role` ni una `secret key` en el HTML.** Todos los usuarios creados en este proyecto Supabase comparten los mismos datos escolares.

## Datos y limitaciones actuales
- La aplicación parte vacía para que registres tus propias personas, proyectos, tareas e hitos.
- Sin configurar Supabase, los datos se guardan en el almacenamiento local de este navegador.
- Con Supabase configurado, los usuarios autenticados comparten los datos del proyecto.
- El asistente Project Agent usa reglas locales de demostración; no está conectado a un modelo de IA.
- Esta versión no requiere Node.js, Python, base de datos ni instalación de dependencias.

## Siguiente evolución sugerida
Separar HTML, CSS y JavaScript en archivos independientes y añadir backend, base de datos, autenticación y conexión segura con un modelo de IA.
