#!/bin/bash

CERT_DIR="/certs"
DOMAIN="tree.klaus-fam.de"
VALIDITY_DAYS=3650  # 10 years in days

# Generate the self-signed certificate
#openssl req -newkey rsa:2048 -days $VALIDITY_DAYS -nodes -x509 \
#  -keyout "$CERT_DIR/tree.klaus-fam.de.key" \
#  -out "$CERT_DIR/tree.klaus-fam.de.crt" \
#  -subj "/C=US/ST=State/L=City/O=Organization/CN=$DOMAIN"

openssl req -newkey rsa:2048 -days $VALIDITY_DAYS -nodes -x509 \
  -keyout "$CERT_DIR/webtrees.key" \
  -out "$CERT_DIR/webtrees.crt" \
  -subj "/C=US/ST=State/L=City/O=Organization/CN=$DOMAIN"


# Set appropriate file permissions
chmod 600 "$CERT_DIR/webtrees.key"
chmod 644 "$CERT_DIR/webtrees.crt"
