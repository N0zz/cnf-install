# cnf-install

## Installation

### Dependencies

`cnf-install` major dependencies are `bash` and `which`.

Minor dependencies (`curl`, `xmllint`, `grep`, `awk`, `sort`, `basename`, `echo`, `column`) are handled by `cnf-install`, which provides installation instructions if you're missing them.

### Install

```bash
wget https://github.com/N0zz/cnf-install/releases/download/v0.1/cnf-install -O /usr/bin/cnf-install
chmod +x /usr/bin/cnf-install
```

## Usage

### Standard usage

```bash
Usage: cnf-install ${COMMAND} [-h -f -p -v]
  -h / --help            - prints help/usage
  -f / --force           - force command-not-found.com query to show installation methods even if package is already installed
  -p / --package_only    - show package names only in output - useful for automation
  -v / --version         - prints cnf-install version
  -i / --install         - perform actuall package installation (by default only prints installation command)
```

### Example usage within ansible

```yaml
- name: CNF Install example playbook
  hosts: all
  tasks:
    - name: Fetch CNF package
      ansible.builtin.command:
        cmd: cnf-install {{ item }} --package-only --force
      changed_when: true
      loop: "{{ cnf_commands }}"
      register: cnf_packages

    - name: Install packages
      ansible.builtin.package:
        name: "{{ item.stdout }}"
        state: present
      loop: "{{ cnf_packages.results }}"
      loop_control:
        label: "Command {{ item.item }} from package: {{ item.stdout }}"

  vars:
    cnf_commands: ["http", "ansible-playbook"]
```

## Examples

### Mac OS

```bash

$ cnf-install
Usage: cnf-install ${COMMAND} [-h -f -p -v -i]
  -h / --help            - prints help/usage
  -f / --force           - force command-not-found.com query to show installation methods even if package is already installed
  -p / --package_only    - show package names only in output - useful for automation
  -v / --version         - prints cnf-install version
  -i / --install         - perform actuall package installation (by default only prints installation command)

$ cnf-install -v
Version: v0.1 (https://github.com/N0zz/cnf-install/releases/tag/v0.1)

$ cnf-install -h
Usage: cnf-install ${COMMAND} [-h -f -p -v -i]
  -h / --help            - prints help/usage
  -f / --force           - force command-not-found.com query to show installation methods even if package is already installed
  -p / --package_only    - show package names only in output - useful for automation
  -v / --version         - prints cnf-install version
  -i / --install         - perform actuall package installation (by default only prints installation command)

$ cnf-install http
Found 5 installers, searching for one available on your system...
Skipping: apk
Skipping: apt-get
Installer: brew, Command: brew install httpie

$ brew install httpie | grep -A1 'Fetching\|Summary'
==> Fetching httpie
==> Downloading https://ghcr.io/v2/homebrew/core/httpie/manifests/3.2.2_1-1
--
==> Summary
🍺  /opt/homebrew/Cellar/httpie/3.2.2_1: 483 files, 2.9MB

$ cnf-install http
Command http already installed.
Use -f/--force to show installation instructions anyway.
File found: /opt/homebrew/bin/http

$ cnf-install http -f
Found 5 installers, searching for one available on your system...
Skipping: apk
Skipping: apt-get
Installer: brew, Command: brew install httpie

$ cnf-install ansible -f
Found 6 installers, searching for one available on your system...
Skipping: apk
Skipping: apt-get
Installer: brew, Command: brew install ansible

$ cnf-install ansible-playbook -f
Found 6 installers, searching for one available on your system...
Skipping: apk
Skipping: apt-get
Installer: brew, Command: brew install ansible

$ cnf-install ansible -f -p
ansible

$ cnf-install ansible-playbook -f -p
ansible

$ cnf-install non-existing-command
No installers found on https://command-not-found.com/non-existing-command
```

### Ubuntu

```bash
$ http --version
-bash: http: command not found

$ cnf_install 
Usage: cnf-install ${COMMAND} [-f -p]
  -f / --force - force command-not-found.com query to show installation methods even if package is already installed
  -p / --package_only - show package names only in output - useful for automation

$ cnf_install http
curl not installed. Check out https://command-not-found.com/curl for instructions.

$ apt-get install -y curl
...
The following NEW packages will be installed:
  curl
...

$ cnf_install http
Found 5 installers, searching for one installed on your system...
Skipping: apk
Installer: apt-get, Command: apt-get install httpie
```

### Alpine

```bash
$ cnf-install http
Found 5 installers, searching for one installed on your system...
Installer: apk, Command: apk add httpie

$ apk del curl
(1/7) Purging curl (8.2.1-r0)
...
OK: 14 MiB in 23 packages

$ cnf-install http
curl not installed. Check out https://command-not-found.com/curl for instructions.

$ cnf-install http
Found 5 installers, searching for one installed on your system...
Installer: apk, Command: apk add httpie
$ apk add httpie
...
OK: 102 MiB in 73 packages

$ cnf-install http
Command http already installed.
Use -f/--force to show installation instructions anyway.
File found: /usr/bin/http
```

### Fedora

```bash
$ cnf-install http
Found 5 installers, searching for one installed on your system...
Skipping: apk
Skipping: apt-get
Skipping: brew
Installer: dnf, Command: dnf install httpie
```

## Thanks

Thanks to [@lukaszlach](https://github.com/lukaszlach) for developing [command-not-found.com](https://command-not-found.com/) and [commando](https://github.com/lukaszlach/commando).

Inspired by: https://github.com/lukaszlach/commando/blob/master/builder/alpine/install.sh
