FROM zauberzeug/nicegui
LABEL org.opencontainers.image.authors="Zenon Skuza <zenon@skuza.net>"
ARG PYTHON_MODULES
RUN /bin/bash -c 'if [ -n "$PYTHON_MODULES" ]; then \
        IFS="|" read -ra MODULES <<< "$PYTHON_MODULES"; \
        for module in "${MODULES[@]}"; do \
            pip install --no-cache-dir "$module"; \
        done; \
    fi'
