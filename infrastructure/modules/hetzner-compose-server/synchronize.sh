#!/bin/bash
set -euo pipefail

# Templated variables
REPOSITORY_ADDRESS=${repo_address}
BRANCH=${branch}
COMPOSE_PATH=${compose_file}
APPLICATION_PATH=${application_directory}

# Do all action inside the application directory
cd $APPLICATION_PATH

# Global variables
old_commit=""
new_comit=""

# --- Utility Functions ---

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

abort() {
  echo "ERROR: $1" >&2
  exit 1
}

# --- Step Functions ---

# Sanity check
sanity_check() {
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    abort "Error: Current directory is not a Git repository. Aborting setup." >&2
  fi
}

sync_with_source() {
  old_commit=$(git rev-parse HEAD)
  log "Fetching latest changes from remote"
  git fetch origin "$BRANCH"
  git checkout "$BRANCH"
  git pull origin "$BRANCH"
  new_commit=$(git rev-parse HEAD)
}

compare_manifests() {
  log "Comparing manifests"

  local old_hash = $(git show $old_commit:$COMPOSE_PATH | sha256sum)
  local new_hash = $(cat $COMPOSE_PATH | sha256sum)

  if [[ "$old_hash" == "$new_hash" ]]; then
    return 1
  else
    return 0
  fi
}

rollout() {
  log "Rolling out changes"

  log "Deploying new services"
  docker compose --file "$COMPOSE_PATH" pull
  docker compose --file "$COMPOSE_PATH" up --detach --remove-orphans

  log "Removing old resource"
  docker image prune -f
  docker container prune -f

  log "Rollout successful"
}

# --- Main Orchestration ---

main() {
  sanity_check
  sync_with_source
  
  if compare_manifests; then
    rollout
  else
    log "No rollout necessary"
  fi
}

main "$@"