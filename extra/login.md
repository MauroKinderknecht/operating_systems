# Login and User Management in Linux

## Overview

Managing users and user permissions is a fundamental part of Linux administration. This guide will cover user management, the `sudo` command, and related topics.

## User Management

### Adding Users

To add a new user, you can use the `adduser` command:

```bash
sudo adduser [username]
```

### Deleting Users

To delete a user and their home directory:

```bash
sudo deluser --remove-home [username]
```

### Modifying Users

To modify an existing user, you can use the `usermod` command:

```bash
sudo usermod [options] [username]
```

### Changing Passwords

To change a user's password, use the `passwd` command:

```bash
sudo passwd [username]
```

## Groups Management

### Adding Groups

To add a new group:

```bash
sudo addgroup [groupname]
```

### Deleting Groups

To delete a group:

```bash
sudo delgroup [groupname]
```

### Adding Users to a Group

To add a user to a group:

```bash
sudo adduser [username] [groupname]
```

### Removing Users from a Group

To remove a user from a group:

```bash
sudo deluser [username] [groupname]
```

## `sudo` Command

The `sudo` command allows a permitted user to execute a command as the superuser or another user, as specified by the security policy configured in `/etc/sudoers`.

### Basic Usage

To run a command as the superuser:

```bash
sudo [command]
```

### Running Commands as Different Users

To run a command as a different user:

```bash
sudo -u [username] [command]
```

### Switching Users

To switch to the superuser account:

```bash
sudo su
```

To switch to another user account:

```bash
sudo su - [username]
```

## `/etc/sudoers` File

The `/etc/sudoers` file controls who can run what commands as whom on the system. It should always be edited with the `visudo` command, which locks the file and uses syntax highlighting to prevent syntax errors.

### Basic Syntax

The basic syntax of the `/etc/sudoers` file is as follows:

```plaintext
user host = (run_as) commands
```

- **user**: The username.
- **host**: The hostname.
- **run_as**: The user the command will run as.
- **commands**: The commands that can be run.

### Example Entries

To allow a user to run all commands as any user:

```plaintext
username ALL=(ALL:ALL) ALL
```

To allow a user to run specific commands as a specific user:

```plaintext
username hostname=(run_as) /path/to/command, /path/to/another/command
```

### Groups in `/etc/sudoers`

To allow all users in a group to run all commands:

```plaintext
%groupname ALL=(ALL:ALL) ALL
```

### NOPASSWD Directive

To allow a user to run commands without being prompted for a password:

```plaintext
username ALL=(ALL:ALL) NOPASSWD: ALL
```
