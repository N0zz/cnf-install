# cnf-install

## Installation

```bash
CNF_RELEASE="v0.1-alfa"
wget https://github.com/N0zz/cnf-install/releases/download/${CNF_RELEASE}/cnf-install -O /usr/bin/cnf-install
chmod +x /usr/bin/cnf-install
unset CNF_RELEASE
```

## Usage

```bash
cnf-install ${COMMAND}
```

## Examples

### Mac OS

```bash
$ http --version
bash: http: command not found

$ cnf-install 
Usage: cnf-install ${COMMAND}

$ cnf-install thtp
No installers available found on https://command-not-found.com/thtp

$ cnf-install http
Found 5 installers, searching for one installed on your system...
Skipping: apk
Skipping: apt-get
Installer: brew, Command: brew install httpie
```

### Ubuntu

```bash
$ http --version
-bash: http: command not found

$ cnf_install 
Usage: cnf_install ${COMMAND}

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
/usr/bin/http
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
