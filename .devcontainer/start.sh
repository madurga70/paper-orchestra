#!/usr/bin/env bash
# Arranque idempotente de Streamlit desde Codespaces.
set -Eeuo pipefail
cd "$(dirname "$0")/.."

if curl --silent --show-error --fail --max-time 3 http://127.0.0.1:8501/_stcore/health >/dev/null 2>&1; then
  echo "PaperOrchestra ya está funcionando en el puerto 8501."
  exit 0
fi

if [ ! -x .venv/bin/python ]; then
  echo "ERROR: El entorno Python no existe. Revisa la instalación inicial de Codespaces."
  exit 1
fi

echo "Iniciando PaperOrchestra en el puerto 8501..."
nohup .venv/bin/python -m streamlit run frontend/app.py \
  --server.address 0.0.0.0 \
  --server.port 8501 \
  --server.headless true \
  --server.enableCORS true \
  > /tmp/paper-orchestra-streamlit.log 2>&1 < /dev/null &

echo "Interfaz iniciada. En Codespaces, abre la pestaña Puertos (Ports) y selecciona 8501."
echo "Diagnóstico, si fuese necesario: tail -n 100 /tmp/paper-orchestra-streamlit.log"
