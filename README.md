# cnf-install

## Usage

```bash
cnf-install ${COMMAND}
```

## Examples

### Mac OS

```bash
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
