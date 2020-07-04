
# GitLab CI runner

Implemented via conventional docker container.

* https://dockerswarm.rocks/gitlab-ci/
* https://docs.gitlab.com/runner/install/docker.html


### 1. Start docker container

https://docs.gitlab.com/runner/install/docker.html#option-2-use-docker-volumes-to-start-the-runner-container

```shell script
make create
```

### 2.a Register runner 

https://docs.gitlab.com/runner/register/index.html#one-line-registration-command

Copy `example.register.sh` to `register.sh` and replace `RUNNER_REGISTRATION_TOKEN` (and `url`, if not using gitlab.com).
Token can be retrieved from your repository/group settings: go to Settings > CI > Runners section.

```shell script
make register
```

### 2.b Register runner interactively

**NOTE**: doesn't work with docker socket yet.

https://docs.gitlab.com/runner/install/docker.html#option-2-use-docker-volumes-to-start-the-runner-container

```shell script
make iregister
```

Get URL and token from Visit your GitLab repository page, enter `Settings` -> `CI / CD` -> `Runners`.
Most values can be changed later from GitLab admin.

Tags like `build`, `test`, `stage`, `prod` are used to route jobs.
