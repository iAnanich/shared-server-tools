
# https://docs.gitlab.com/runner/register/index.html#one-line-registration-command

# Using Docker "gitlab-runner-config" volume.
# Common tags include: test, build, stag, prod
# Replace `RUNNER_REGISTRATION_TOKEN` with token from repo/group settings > CI > runners section

docker run --rm -v gitlab-runner-config:/etc/gitlab-runner \
  gitlab/gitlab-runner register \
  --non-interactive \
  --executor "docker" \
  --docker-image docker:latest \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock \
  --description "Docker runner" \
  --locked="false" \
  --access-level="not_protected" \
  --run-untagged="true" \
  --tag-list "docker" \
  --url "https://gitlab.com/" \
  --registration-token "RUNNER_REGISTRATION_TOKEN"
