FROM zauberzeug/nicegui
LABEL org.opencontainers.image.authors="Zenon Skuza <zenon@skuza.net>"
ENV PYTHON_MODULES
RUN /bin/bash -c 'if [ -n "$PYTHON_MODULES" ]; then \
        IFS="|" read -ra MODULES <<< "$PYTHON_MODULES"; \
        for module in "${MODULES[@]}"; do \
            echo "Installing $module"; \
            if ! pip install --no-cache-dir "$module"; then \
                echo "ERROR: Failed to install $module" >&2; \
            fi; \
        done; \
    fi'
