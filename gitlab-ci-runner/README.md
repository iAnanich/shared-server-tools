
# GitLab CI runner

Implemented via conventional docker container.

* https://dockerswarm.rocks/gitlab-ci/
* https://docs.gitlab.com/runner/install/docker.html


### 1. Start docker container

https://docs.gitlab.com/runner/install/docker.html#option-2-use-docker-volumes-to-start-the-runner-container

```shell script
make create
```

### 2. Register runner

https://docs.gitlab.com/runner/install/docker.html#option-2-use-docker-volumes-to-start-the-runner-container

```shell script
make register
```

Get URL and token from Visit your GitLab repository page, enter `Settings` -> `CI / CD` -> `Runners`.
Most values can be changed later from GitLab admin.

Tags like `build`, `test`, `stage`, `prod` are used to route jobs.
