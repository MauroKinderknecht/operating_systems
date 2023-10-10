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
