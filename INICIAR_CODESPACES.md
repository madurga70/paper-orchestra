# Usar PaperOrchestra desde el navegador (sin instalar nada en Windows)

Esta copia incluye una configuración para **GitHub Codespaces**. Es un ordenador virtual de desarrollo gestionado por GitHub. No hace falta instalar Python, Linux ni Docker en el equipo personal.

## 1. Crear una clave para el modelo de IA

1. Abre https://aistudio.google.com/apikey y crea una clave API para Gemini.
2. La clave puede estar sujeta a cuotas y costes. Revisa las condiciones de Google antes de realizar generaciones largas.
3. **No pegues la clave en el código, en un archivo del repositorio, en un issue ni en un chat.**

## 2. Guardar la clave de manera segura en GitHub

1. Accede a https://github.com/settings/codespaces
2. En **Codespaces secrets**, pulsa **New secret**.
3. Nombre: `GEMINI_API_KEY`.
4. Valor: la clave que acabas de crear.
5. Concede acceso **solo** al repositorio `madurga70/paper-orchestra` y guarda.
6. Si ya tenías un Codespace abierto antes de introducir el secreto, detenlo y vuelve a iniciarlo para que reciba el valor.

La configuración del proyecto también recomienda esta clave cuando se crea un Codespace con opciones avanzadas.

## 3. Abrir PaperOrchestra

1. Abre https://github.com/madurga70/paper-orchestra
2. Pulsa **Code** > **Codespaces** > **Create codespace on main**. También puedes usar https://github.com/codespaces/new?repo=1463101392 .
3. El sistema prepara automáticamente Python 3.11, las dependencias de PaperOrchestra y las herramientas de LaTeX necesarias para generar PDF. **La primera instalación puede ser lenta**.
4. Tras el arranque, el puerto **8501** debe aparecer en la pestaña **Ports / Puertos**. Selecciona el icono del globo para **Open in Browser**; la configuración también puede abrirlo automáticamente.
5. **Mantén la visibilidad del puerto como Private (Privado)**. No publiques la URL de la aplicación, especialmente si introduces contenidos inéditos o datos de investigación.

## 4. Realizar una prueba

- En la barra lateral de la aplicación, selecciona **Load CVPR Example**.
- Comprueba el modelo disponible y la plantilla.
- El formulario original solicita un correo electrónico; su notificación por correo solo funcionará si configuras por separado las credenciales SMTP. Para la primera prueba, utiliza un correo propio y revisa los resultados dentro de la aplicación.
- Confirma los datos y ejecuta el proceso cuando desees consumir la API. **No es gratuito por defecto**.
- Revisa las referencias y los resultados científicos generados antes de reutilizarlos. Un borrador automático no acredita resultados ni bibliografía.

## 5. Cerrar o volver a abrir

- Para detener la máquina virtual cuando termines, entra en https://github.com/codespaces y pulsa **Stop codespace** en el menú del entorno.
- Para continuar, abre de nuevo el Codespace desde la misma página; Streamlit volverá a arrancar automáticamente.
- Si no se abre el puerto 8501, consulta **Terminal** y ejecuta `bash .devcontainer/start.sh`. Para ver errores, ejecuta `tail -n 100 /tmp/paper-orchestra-streamlit.log`.
- Si se interrumpió la instalación, utiliza el comando de VS Code **Codespaces: Rebuild Container**.

## Consideraciones

- GitHub puede aplicar cuotas o costes de Codespaces, independientemente del coste de los modelos de IA.
- El puerto privado protege el acceso, pero los datos proporcionados a modelos externos quedan sometidos a sus propias condiciones de tratamiento.
- El repositorio original es público y esta copia también lo es. No subas datos de investigación confidenciales o inéditos al repositorio. Utiliza la interfaz y revisa el tratamiento de datos antes de introducirlos.
- Los archivos se generan dentro del Codespace; **descarga los resultados que quieras conservar** antes de eliminar ese entorno.
- La interfaz original de PaperOrchestra se mantiene sin modificaciones. Si sus desarrolladores cambian modelos, APIs o dependencias, podría ser necesario actualizar la configuración.

Proyecto original: https://github.com/google-research/paper-orchestra
