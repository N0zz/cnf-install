# cnf-install

## Installation

### Dependencies

`cnf-install` major dependencies are `bash` and `which`.

Minor dependencies (`curl`, `xmllint`, `grep`, `awk`, `sort`, `basename`, `echo`) are handled by `cnf-install`, which provides installation instructions if you're missing them.

### Install

```bash
CNF_RELEASE="v0.2-alfa"
wget https://github.com/N0zz/cnf-install/releases/download/${CNF_RELEASE}/cnf-install -O /usr/bin/cnf-install
chmod +x /usr/bin/cnf-install
unset CNF_RELEASE
```

## Usage

```bash
Usage: cnf-install ${COMMAND} [-f/--force]
```

## Examples

### Mac OS

```bash
$ http --version
bash: http: command not found

$ cnf-install 
Usage: cnf-install ${COMMAND} [-f/--force]

$ cnf-install thtp
No installers found on https://command-not-found.com/thtp

$ cnf-install http
Found 5 installers, searching for one installed on your system...
Skipping: apk
Skipping: apt-get
Installer: brew, Command: brew install httpie

$ brew install httpie
==> Fetching httpie
...
==> Summary
🍺  /opt/homebrew/Cellar/httpie/3.2.2: 1,232 files, 13MB

$ cnf-install http
Command http already installed.
Use -f/--force to show installation instructions anyway.
File found: /opt/homebrew/bin/http

$ cnf-install http -f
Found 5 installers, searching for one installed on your system...
Skipping: apk
Skipping: apt-get
Installer: brew, Command: brew install httpie

$ cnf-install ansible
Found 6 installers, searching for one installed on your system...
Skipping: apk
Installer: apt-get, Command: apt-get install ansible

$ cnf-install ansible-playbook
Found 6 installers, searching for one installed on your system...
Skipping: apk
Installer: apt-get, Command: apt-get install ansible
```

### Ubuntu

```bash
$ http --version
-bash: http: command not found

$ cnf_install 
Usage: cnf-install ${COMMAND} [-f/--force]

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
