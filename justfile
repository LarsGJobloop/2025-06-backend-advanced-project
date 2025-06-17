# Lists the available tasks, in source order
default:
    @just --list --unsorted

_with_secrets environment command:
    sops exec-env secrets/project-secrets.{{environment}}.env '{{command}}'
_infra environment action:
    just _with_secrets {{environment}} 'terraform -chdir=infrastructure/environments/{{environment}} {{action}}'

# Initialize the development system
[group("development")]
init:
    @echo "Initialzing development system"
    just _infra development init
# Update the development system
[group("development")]
apply:
    @echo "Applying development configuration"
    just _infra development apply
# Destroy the development system
[group("development")]
destroy:
    @echo "Destroying development configuration"
    just _infra development destroy
