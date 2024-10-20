FROM zauberzeug/nicegui:latest
LABEL org.opencontainers.image.authors="Zenon Skuza <zenon@skuza.net>"
# Set up the environment variable
ENV REQUIREMENTS_FILE=""

# Modify the entrypoint script to install Python modules from the requirements file
RUN sed -i '/^#!/a\
if [ -n "$REQUIREMENTS_FILE" ]; then \
    echo "Installing Python modules from $REQUIREMENTS_FILE"; \
    if ! pip install -r "$REQUIREMENTS_FILE"; then \
        echo "ERROR: Failed to install Python modules from $REQUIREMENTS_FILE" >&2; \
        exit 1; \
    fi; \
fi' /resources/docker-entrypoint.sh
