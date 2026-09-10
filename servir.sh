#!/usr/bin/env bash
# Sirve el desglose AI-DLC en http://localhost:8080
cd "$(dirname "$0")"
echo "Abre http://localhost:8080 en tu navegador"
python3 -m http.server 8080
