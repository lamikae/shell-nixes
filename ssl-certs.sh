# This will create a new key pair. You now have created the two files: “server.cert.csr“ and “privkey.pem“. The first contains the Request-Certificate, the second one is the Private-Key.
openssl req -new > server.cert.csr

# While creating the Certificate you needed to type in a password. This password can now be extracted because normally you don’t want to have a password question while creating the https-connection.
openssl rsa -in privkey.pem -out key.pem

# Now you need to transform the Request-Certificate into a Signed Certificate by typing:
openssl x509 -in server.cert.csr -out cert.pem -req -signkey key.pem -days 365

# Now server.cert.csr is redundant and privkey.pem should be kept private.
# cert.pem and key.pem should be published to clients.
