#!/usr/bin/env bash
# Instalacion automatica para GitHub Codespaces (Ubuntu/Debian).
set -Eeuo pipefail
cd "$(dirname "$0")/.."

echo "==> Preparando entorno Python..."
python3 -m venv .venv
.venv/bin/python -m pip install --disable-pip-version-check --upgrade pip
.venv/bin/python -m pip install --disable-pip-version-check -r requirements.txt

echo "==> Instalando bibliotecas OpenCV y herramientas para PDF (LaTeX/BibTeX)..."
# Algunos contenedores traen fuentes de terceros (p. ej., Yarn) cuya clave GPG puede caducar.
# No deshabilitamos la verificación de firmas: si falla una fuente externa,
# actualizamos únicamente desde la lista oficial Debian, cuando esté disponible.
if ! sudo apt-get update; then
    if [ -f /etc/apt/sources.list.d/debian.sources ]; then
        echo "Aviso: el índice de un repositorio externo no es válido. Actualizando solo Debian."
        sudo apt-get update \
            -o Dir::Etc::sourcelist="sources.list.d/debian.sources" \
            -o Dir::Etc::sourceparts="-"
    else
        echo "Aviso: actualización APT incompleta. Se intentará instalar con los índices existentes."
    fi
fi
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-bibtex-extra

echo "==> Entorno preparado. La interfaz se inicia automaticamente al arrancar Codespaces."
