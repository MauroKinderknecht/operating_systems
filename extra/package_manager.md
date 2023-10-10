# APT Package Manager

## What is APT?

APT (Advanced Package Tool) is a package management system used by Debian and 
its derivatives (like Ubuntu). It provides command-line tools for searching and
managing as well as facilitating the process of installing, upgrading, and 
removing software packages in Linux.

APT retrieves packages from repositories set up in the system and handles 
dependencies to ensure that a package is installed with all packages it 
depends on.

## Basic APT Commands

### 1. Update Package Index

```bash
sudo apt update
```

This command fetches the package listings from the repositories and "updates" 
them to get information on the newest versions of packages and their 
dependencies.

### 2. Upgrade Packages

```bash
sudo apt upgrade
```

This command upgrades all the installed packages on the system. It will always
install the highest possible version of a package.

### 3. Add/Remove Software Repositories

To add a repository:

```bash
sudo add-apt-repository [repository]
```

To remove a repository:

```bash
sudo add-apt-repository --remove [repository]
```

### 4. Install a Package

```bash
sudo apt install [package_name]
```

This command installs a package by its name.

### 5. Remove a Package

```bash
sudo apt remove [package_name]
```

This command removes a package but keeps configuration files.

```bash
sudo apt purge [package_name]
```

This command removes a package and its configuration files.

### 6. Search for a Package

```bash
apt search [package_name]
```

This command searches for a package by its name.

### 7. Show Package Details

```bash
apt show [package_name]
```

This command shows detailed information about a package.

### 8. List Installed Packages

```bash
apt list --installed
```

This command lists all installed packages.

### 9. Autoremove Packages

```bash
sudo apt autoremove
```

This command removes packages that were installed by other packages and are no
longer used.

### 10. Full Upgrade

```bash
sudo apt full-upgrade
```

This command performs an upgrade, and it will remove currently installed 
packages if this is needed to upgrade the system as a whole.

### 11. Download a Package Source

```bash
apt source [package_name]
```

This command fetches the source code for a package.

### 12. Check for Broken Dependencies

```bash
sudo apt check
```

This command is a diagnostic tool and it checks that all dependencies are OK.

## APT Configuration Files

- **/etc/apt/sources.list**: This file contains information about the 
    repositories from which packages will be fetched.
  
- **/etc/apt/apt.conf.d/**: This directory contains configuration files for APT.

- **/etc/apt/preferences**: This file is where you would specify "pinning" 
    information, to lock a package to a specific version or to prefer packages
    from a particular release.

## APT Caching

APT maintains a package cache in `/var/cache/apt/archives`. The packages 
    downloaded are stored here.

- To clean the cache and remove all cached packages, you can use:

```bash
sudo apt clean
```

- To remove all packages from the cache except the latest versions, use:

```bash
sudo apt autoclean
```

## APT Log Files

- **/var/log/apt/history.log**: This log file keeps a record of all apt 
    activities, such as installations or upgrades, for the system.

- **/var/log/apt/term.log**: This log file keeps a record of all terminal
    outputs of apt activities.

## APT Security

APT ensures authenticity and integrity by using GPG keys. Repositories 
should be signed with a GPG key to make sure that packages are securely
received from the correct source.

- To add a GPG key, you can use:

```bash
sudo apt-key adv --keyserver [keyserver_url] --recv-keys [key_id]
```
