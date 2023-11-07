#!/bin/bash

# Function to encrypt a file
encrypt_file() {
    if [ $# -ne 3 ]; then
        echo "Usage: $0 encrypt <recipient_public_key> <input_file> <output_file>"
        exit 1
    fi

    recipient_public_key="$1"
    input_file="$2"
    output_file="$3"

    if [ ! -f "$recipient_public_key" ]; then
        echo "Error: Recipient's public key file '$recipient_public_key' does not exist."
        exit 1
    fi

    if [ ! -f "$input_file" ]; then
        echo "Error: Input file '$input_file' does not exist."
        exit 1
    fi

    openssl rsautl -encrypt -pubin -inkey "$recipient_public_key" -in "$input_file" -out "$output_file"
    echo "File '$input_file' encrypted with recipient's public key and saved as '$output_file'."
}

# Function to decrypt a file
decrypt_file() {
    if [ $# -ne 3 ]; then
        echo "Usage: $0 decrypt <recipient_private_key> <input_file> <output_file>"
        exit 1
    fi

    recipient_private_key="$1"
    input_file="$2"
    output_file="$3"

    if [ "$EUID" -ne 0 ]; then
        echo "Error: Permission denied. You must run this command as root."
        exit 1
    fi

    if [ ! -f "$recipient_private_key" ]; then
        echo "Error: Recipient's private key file '$recipient_private_key' does not exist."
        exit 1
    fi

    if [ ! -f "$input_file" ]; then
        echo "Error: Input file '$input_file' does not exist."
        exit 1
    fi

    openssl rsautl -decrypt -inkey "$recipient_private_key" -in "$input_file" -out "$output_file"
    echo "File '$input_file' decrypted with recipient's private key and saved as '$output_file'."
}

# Function to generate RSA key pair
generate_keys() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 generate <filename>"
        exit 1
    fi

    filename="$1"
    public_key_file="${filename}_pub.pem"
    private_key_file="${filename}_priv.pem"

    if [ -e "$public_key_file" ] || [ -e "$private_key_file" ]; then
        echo "Error: Key files already exist for '$filename'."
        exit 1
    fi

    openssl genpkey -algorithm RSA -out "$private_key_file"
    openssl rsa -pubout -in "$private_key_file" -out "$public_key_file"
    echo "RSA key pair generated and saved as '$public_key_file' and '$private_key_file'."
}

# Help function
print_help() {
    echo "Usage: $0 <command>"
    echo "Commands:"
    echo "  encrypt <recipient_public_key> <input_file> <output_file> - Encrypt a file."
    echo "  decrypt <recipient_private_key> <input_file> <output_file> - Decrypt a file."
    echo "  generate <filename> - Generate RSA key pair and save as 'filename_pub.pem' and 'filename_priv.pem'."
}

# Main script
if [ $# -eq 0 ]; then
    print_help
    exit 0
fi

case "$1" in
    encrypt)
        shift
        encrypt_file "$@"
        ;;
    decrypt)
        shift
        decrypt_file "$@"
        ;;
    generate)
        shift
        generate_keys "$@"
        ;;
    help)
        print_help
        exit 0
        ;;
    *)
        echo "Invalid command: $1"
        print_help
        exit 1
        ;;
esac

exit 0
