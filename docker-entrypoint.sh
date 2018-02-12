#!/bin/sh
# ----------------------------------------------------------------------------
# entrypoint for certificate generator
# ----------------------------------------------------------------------------
set -e

openssl ecparam -name prime256v1 -out /ca-certificates/ec.param
openssl req -new -newkey ec:/ca-certificates/ec.param -days 1825 -nodes -x509 -sha384 \
    -config openssl.conf \
    -keyout /ca-certificates/cache-selfsigned.key \
    -out /ca-certificates/cache-selfsignedCA.crt \
    -subj "/O=Veidemann harvester/OU=Veidemann cache/CN=veidemann-harvester"
chmod -R 777 /ca-certificates
