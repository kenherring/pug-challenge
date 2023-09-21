# PUG Challenge 2023 [![CircleCI](https://dl.circleci.com/status-badge/img/gh/kenherring/pug-challenge/tree/main.svg?style=svg&circle-token=83b51698a6242b3f079aad6c2a78500eff4e4483)](https://dl.circleci.com/status-badge/redirect/gh/kenherring/pug-challenge/tree/main)

This repo was put together for a presentation at 2023 PUG Challenge EU.

## Using this Repo

### Compile

```bash
ant compile
```

### Unit Test (ABLUnit)

```bash
ant test
```

### Sonar Scan

This will scan locally if you are running a docker container at https://localhost:9000.

```bash
mvn sonar:sonar
```

## Docker

### Build/Test Container

The build pipeline container can be built with the following command.

```bash
.docker/docker-build.sh
```

### Dev Container

To launch with a dev container you can either build the image with the prior command, or pull the image with the next command.

```bash
docker pull kherring/oedb:latest
```

Then launch as a dev container with the `Dev Containers: Reopen in Container` VSCode command.


## Other Repo Information

### Tools

* [CircleCI - kenherring/pug-challenge](https://app.circleci.com/pipelines/github/kenherring/pug-challenge)
* [DockerHub - kherring/oedb](https://hub.docker.com/r/kherring/oedb)
* [SonarSource - kenherring/pug-challenge](https://sonarcloud.io/project/overview?id=kenherring_pug-challenge)

### Links

* [PUG Challenge EU](https://pugchallenge.eu/)
* [Progress OpenEdge Developers Kit: Classroom Edition](Progress OpenEdge Developers Kit: Classroom Edition)
* [vscode-abl/vscode-abl](https://github.com/vscode-abl/vscode-abl)
* https://github.com/Riverside-Software/rules-plugin-template/blob/main/pom.xml
* https://github.com/Riverside-Software/sonar-openedge
* https://code.visualstudio.com/docs
* https://hub.docker.com/u/progresssoftware
  * https://hub.docker.com/r/progresssoftware/prgs-oedb
  * https://hub.docker.com/r/progresssoftware/prgs-pasoe
  * https://docs.progress.com/bundle/pas-for-openedge-docker-containers-122/page/Learn-about-PAS-for-OpenEdge-in-a-Docker-container.html
