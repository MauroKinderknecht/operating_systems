# Scripting exercises

## Exercise 1: User Management

### Challenge Description

You are tasked with creating a script that manages users on a Linux system. The script should be able to:

- Add a user
- Delete a user
- Add a user to a group
- Remove a user from a group
- Change a user's password

### Requirements

- Ensure that the script checks for the necessary permissions before trying to make changes.
- Implement error handling to manage potential issues, like trying to add a user that already exists, etc.
- Ensure that the script provides feedback to the user about what it's doing and any errors that it encounters.
- Ensure that the script can handle command-line arguments to determine what action(s) to take.
- Allow the script to take a file with multiple actions

### Example usage

```bash
./user_management.sh --add-user username
./user_management.sh --user username --delete-user
./user_management.sh --user username --add-to-group groupname
./user_management.sh --user username --remove-from-group groupname
./user_management.sh --user username --change-password # this should prompt to input a password without printing it to the terminal
./user_management.sh --user username --add-to-group groupname --change-password  --remove-from-group groupname2 # these can be concatenated
./user_management.sh --from-file ./users.csv
```

An example of `./users.csv`
```csv
alice;add-to-group;developers
bob;add-to-group;developers
charlie;add-to-group;testers
bob;remove-from-group;developers
bob;change-password
dave;delete-user
```

## Exercise 2: APT requirements.txt

You are tasked with creating a script that manages dependencies on a Linux system, similar to pip. The script should be able to:

- Take a file with dependencies
- Verify that a dependency is met
- Install/Update when a dependency is not met
- Add new dependencies

### Requirements

- Ensure that the script checks for the necessary permissions before trying to make changes.
- Implement error handling to manage potential issues, like trying to install a package that doesn't exists, etc.
- Ensure that the script provides feedback to the user about what it's doing and any errors that it encounters.
- Ensure that the script can handle command-line arguments to determine what action(s) to take.
- By default it should search for a `requirements.txt` file in the current directory

### Example usage

```bash
./req.sh install # it should find the requirements.txt file and install the missing dependencies
./req.sh verify # it should only check that dependencies are met and output the ones that are not
./req.sh add <dependency> # it should add a dependency to the requirements.txt and install it
./req.sh remove <dependency> # it should remove the dependency from the requirements.txt file
./req.sh install --file ./req.txt # it should be able to override the dependency file on every command
./req.sh install -f  ./req.txt # it should be able to override the dependency file on every command
./req.sh help # it should print the available commands
```

An example of `requirements.txt`
```
nginx
docker.io
python3
```

# Scripting Exercise 3: Virtual Filesystem and Mount

## Challenge Description

You are tasked with creating a script that creates a virtual filesystem and mounts it to a directory on a Linux system. The script should be able to:

- Create a virtual filesystem image file.
- Format the image file with a filesystem (e.g., ext4).
- Mount the virtual filesystem to a specified directory.
- Unmount the virtual filesystem when no longer needed.
- Provide error handling for potential issues.

### Requirements

- Ensure that the script checks for the necessary permissions before trying to create or mount the virtual filesystem.
- Implement error handling to manage potential issues, such as incorrect file format or insufficient disk space.
- Ensure that the script provides feedback to the user about what it's doing and any errors that it encounters.
- Allow the script to take command-line arguments to determine the actions to take (create, format, mount, unmount).

### Example Usage

```bash
# Create a virtual filesystem image file
./virtualfs.sh create myfs.img 100M

# Format the virtual filesystem image with ext4
./virtualfs.sh format myfs.img

# Mount the virtual filesystem to a directory
./virtualfs.sh mount myfs.img /mnt/myfs

# Unmount the virtual filesystem
./virtualfs.sh unmount /mnt/myfs
```

# Scripting Exercise 4: File and Directory Access Management

## Challenge Description

You are tasked with creating a script that manages read and write access for files and directories on a Linux system. The script should be able to:

- Grant read or write access to a specific user or group for a file or directory.
- Revoke read or write access from a specific user or group for a file or directory.
- List the current access permissions for a file or directory.
- Implement error handling to manage potential issues, such as invalid file paths or user/group names.
- Ensure that the script provides feedback to the user about what it's doing and any errors that it encounters.

### Requirements

- Ensure that the script checks for the necessary permissions before trying to modify access permissions.
- Allow the script to take command-line arguments to determine the actions to take (grant access, revoke access, list permissions).
- Use Linux file permission mechanisms (e.g., chmod) to manage access.

### Example Usage

```bash
# Grant read access to a specific user for a file
./access_management.sh grant-read user1 /path/to/file.txt

# Grant write access to a specific group for a directory
./access_management.sh grant-write group1 /path/to/directory

# Revoke read access from a specific user for a file
./access_management.sh revoke-read user1 /path/to/file.txt

# List access permissions for a file
./access_management.sh list-permissions /path/to/file.txt

# List access permissions for a directory
./access_management.sh list-permissions /path/to/directory
```

# Scripting Exercise 5: File Encryption and Decryption with RSA

## Challenge Description

You are tasked with creating a script that can encrypt and decrypt files using RSA encryption on a Linux system. The script should be able to:

- Encrypt a file with a recipient's public key.
- Decrypt a file with the recipient's private key.
- Implement error handling to manage potential issues, such as missing keys or incorrect file paths.
- Ensure that the script provides feedback to the user about what it's doing and any errors that it encounters.

### Requirements

- Ensure that the script checks for the necessary permissions before trying to encrypt or decrypt files.
- Allow the script to take command-line arguments to determine the actions to take (encrypt or decrypt).
- Use RSA encryption libraries (e.g., OpenSSL) to perform encryption and decryption.

### Example Usage

```bash
# Encrypt a file with a recipient's public key
./encrypt_decrypt.sh encrypt recipient_public_key.pem input_file.txt encrypted_file.enc

# Decrypt a file with the recipient's private key
./encrypt_decrypt.sh decrypt recipient_private_key.pem encrypted_file.enc decrypted_file.txt
```

