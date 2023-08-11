#!/bin/bash

# Source the shunit2 framework
. shunit2

# Source your script to be tested
. cnf-install

# Define your tests using functions
testVersion() {
  assertEquals "Version: v0.1 (https://github.com/N0zz/cnf-install/releases/tag/v0.1)" "$(cnf-install -v)"
}

testHelp() {
  expected="Usage: cnf-install \${COMMAND} [-h -f -p -v -i]
  -h / --help            - prints help/usage
  -f / --force           - force command-not-found.com query to show installation methods even if package is already installed
  -p / --package_only    - show package names only in output - useful for automation
  -v / --version         - prints cnf-install version
  -i / --install         - perform actual package installation (by default only prints installation command)"
  
  assertEquals "$expected" "$(cnf-install -h)"
}

# Run the tests
. shunit2