#!/usr/bin/env bash
# Instalacion automatica para GitHub Codespaces (Ubuntu/Debian).
set -Eeuo pipefail
cd "$(dirname "$0")/.."

echo "==> Preparando entorno Python..."
python3 -m venv .venv
.venv/bin/python -m pip install --disable-pip-version-check --upgrade pip
.venv/bin/python -m pip install --disable-pip-version-check -r requirements.txt

echo "==> Instalando herramientas para generar PDF (LaTeX/BibTeX)..."
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-bibtex-extra

echo "==> Entorno preparado. La interfaz se inicia automaticamente al arrancar Codespaces."
