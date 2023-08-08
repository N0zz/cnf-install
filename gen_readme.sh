#!/usr/bin/env bash
OLD_PATH=$PATH
export PATH=$PATH:./

GEN_CMDS=(
"cnf-install"
"cnf-install -v"
"cnf-install -h"
"cnf-install http"
"brew install httpie | grep -A1 'Fetching\|Summary'"
"cnf-install http"
"cnf-install http -f"
"cnf-install ansible -f"
"cnf-install ansible-playbook -f"
"cnf-install ansible -f -p"
"cnf-install ansible-playbook -f -p"
"cnf-install non-existing-command"
)


brew remove httpie &>/dev/null

echo "### Mac OS"
echo
echo "\`\`\`bash"
for cmd in "${GEN_CMDS[@]}"; do
  echo
  echo "$ ${cmd}" 
  eval ${cmd}
done
echo "\`\`\`"

export PATH=$OLD_PATH