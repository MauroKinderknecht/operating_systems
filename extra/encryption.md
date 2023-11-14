# Encryption with OpenSSL

## Overview

OpenSSL is a robust, full-featured toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols.
It also serves as a general-purpose cryptography library. This guide will focus on RSA encryption using OpenSSL commands like `rsautl`, `rsa`, and `genpkey`.

## RSA Encryption with OpenSSL

### 1. Generating RSA Private Key

To generate an RSA private key:

```bash
openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048
```

This command generates a 2048-bit RSA private key.

### 2. Extracting the Public Key from Private Key

To extract a public key from the private key:

```bash
openssl rsa -pubout -in private_key.pem -out public_key.pem
```

This command extracts the public key from the given private key file.

### 3. Encrypting Data with Public Key

To encrypt data using the public key:

```bash
openssl rsautl -encrypt -pubin -inkey public_key.pem -in plaintext.txt -out encrypted.txt
```

This command encrypts the `plaintext.txt` file using the `public_key.pem` and outputs the encrypted data to `encrypted.txt`.

### 4. Decrypting Data with Private Key

To decrypt data using the private key:

```bash
openssl rsautl -decrypt -inkey private_key.pem -in encrypted.txt -out decrypted.txt
```

This command decrypts the `encrypted.txt` file using the `private_key.pem` and outputs the decrypted data to `decrypted.txt`.

## Additional OpenSSL Commands

### Creating a Self-Signed Certificate

To create a self-signed certificate:

```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
```

This command creates a new 4096-bit RSA key and a self-signed certificate valid for 365 days.

### Verifying a Certificate

To verify a certificate:

```
openssl verify -CAfile cacert.pem cert.pem
```

This command verifies the `cert.pem` certificate against the CA certificate `cacert.pem`.

### Viewing Certificate Information

To view the details of a certificate:

```
openssl x509 -text -noout -in cert.pem
```

This command displays detailed information about the `cert.pem` certificate.
