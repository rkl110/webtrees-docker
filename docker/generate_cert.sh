#!/bin/bash

# Extract domain from BASE_URL
DOMAIN=$(echo $BASE_URL | sed 's/^https\?:\/\///' | sed 's/\/$//')

CERT_DIR="/certs"
CERT_KEY="$CERT_DIR/webtrees.key"
CERT_CRT="$CERT_DIR/webtrees.crt"
VALIDITY_DAYS=3650  # 10 years in days

# Check if the certificate and key already exist
if [ -f "$CERT_KEY" ] && [ -f "$CERT_CRT" ]; then
  echo "Certificate already exists. Skipping creation."
else
  # Generate the self-signed certificate if it doesn't exist
  echo "Generating self-signed certificate for $DOMAIN..."
  openssl req -newkey rsa:2048 -days $VALIDITY_DAYS -nodes -x509 \
    -keyout "$CERT_KEY" -out "$CERT_CRT" \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=$DOMAIN"

  # Set appropriate file permissions
  chmod 600 "$CERT_KEY"
  chmod 644 "$CERT_CRT"
  echo "Certificate generated and stored in $CERT_DIR."
fi


