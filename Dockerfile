FROM python:3.11

WORKDIR /app

# Instalar Hermes
RUN curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash

# Copiar configuración
# NOTA: .env NO se copia — las variables se inyectan como env vars en Railway
COPY config.yaml .hermes/config.yaml

# Volumen para persistir estado entre deploys
VOLUME /root/.hermes

# Iniciar gateway
CMD ["hermes", "gateway"]
