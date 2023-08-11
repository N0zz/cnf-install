#!/usr/bin/env bash
OLD_PATH=$PATH
export PATH=$PATH:./

GEN_CMDS=(
"cnf-install"
"cnf-install --version"
"cnf-install --help"
"cnf-install http"
"brew install httpie | grep -A1 'Fetching\|Summary'"
"cnf-install http"
"cnf-install http --force"
"cnf-install ansible --force"
"cnf-install ansible-playbook --force"
"cnf-install ansible --force --package-only"
"cnf-install ansible-playbook --force --package-only"
"cnf-install non-existing-command"
)


brew remove httpie &>/dev/null

for cmd in "${GEN_CMDS[@]}"; do
  echo
  set -v
  eval ${cmd}
  set +x
done

export PATH=$OLD_PATH