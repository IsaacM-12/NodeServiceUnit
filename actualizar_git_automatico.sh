#!/bin/bash

# Ruta del directorio de tu aplicación Node.js
APP_DIRECTORY="/home/isaacmelendez/helloNode"

# Rama del repositorio que deseas verificar
BRANCH="Deployment"

# Ruta del repositorio en GitHub
GITHUB_REPO="https://github.com/IsaacM-12/NodeServiceUnit.git"

# Cambia al directorio de la aplicación
cd "$APP_DIRECTORY"

# Comprobar si hay cambios en la rama específica del repositorio remoto
if git fetch origin "$BRANCH" && [ "$(git rev-list HEAD...origin/"$BRANCH" --count)" -gt 0 ]; then
    echo "Se han detectado cambios en la rama $BRANCH."

    # Actualizar la rama local con los cambios remotos
    git pull origin "$BRANCH"

    # Reiniciar la aplicación Node.js
    pm2 restart node.js

    echo "La aplicación ha sido actualizada correctamente."
else
    echo "No se han detectado cambios en la rama $BRANCH."
fi
