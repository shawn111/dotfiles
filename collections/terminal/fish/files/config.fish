if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish --disable-up-arrow | source
    zoxide init fish | source
end

export EDITOR=hx
#zellij setup --generate-completion fish
alias zr="zellij run --"
alias ze="zellij edit"
alias zrf="zellij run --floating --"
alias zef="zellij edit --floating"

if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end
