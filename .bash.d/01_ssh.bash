#!/usr/bin/env bash
#  vim: set ts=4 sw=4 tw=80 syntax=sh :
#

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable and start ssh-agent
if [[ -f "${SSH_ENV}" ]]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# add all private keys
ssh_files=$(find -E ~/.ssh -type f)
for k in ${ssh_files}; do
    if grep -q "PRIVATE KEY" "$k"; then
        ssh-add "${k}" > /dev/null 2>&1
    fi
done
