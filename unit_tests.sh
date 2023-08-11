#!/usr/bin/env bash

testVersion() {
  assertEquals "Version: v0.1 (https://github.com/N0zz/cnf-install/releases/tag/v0.1)" "$(./cnf-install -v)"
}

testHelp() {
  expected="Usage: cnf-install ${COMMAND} [-h -f -p -v -i]
  -h / --help            - prints help/usage
  -f / --force           - force command-not-found.com query to show installation methods even if package is already installed
  -p / --package-only    - show package names only in output - useful for automation
  -v / --version         - prints cnf-install version
  -i / --install         - perform actuall package installation (by default only prints installation command)"
  
  assertEquals "$expected" "$(./cnf-install -h)"
}

testSearch() {
  assertContains "Found" "$(./cnf-install http)"
}

. ./shunit2
