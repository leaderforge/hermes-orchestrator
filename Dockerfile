FROM python:3.11

WORKDIR /app

# Instalar Hermes
RUN curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash

# Copiar configuración
COPY .env .hermes/.env
COPY config.yaml .hermes/config.yaml

# Iniciar gateway
CMD ["hermes", "gateway"]
