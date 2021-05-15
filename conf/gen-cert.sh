echo "
BR
Brazil
Sao_Paulo
Company
Company



" | openssl req -new -newkey rsa:4096 -nodes -keyout domain.key -out domain.csr
openssl x509 -req -sha256 -days 365 -in domain.csr -signkey domain.key -out domain.pem
openssl x509 -req -days 365 -in domain.csr -signkey domain.key -out domain.crt

echo "# GENERATED
domain.key - Private key
domain.csr - Certificate Signing Request
domain.pem - Base64 encoded DER certificate is enclosed between the lines —–BEGIN CERTIFICATE—– and —–END CERTIFICATE—–
domain.crt - Base64-encoded or DER-encoded binary X.509 Certificate"