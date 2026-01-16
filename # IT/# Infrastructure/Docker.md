# Docker

Docker is an open-source virtualization/containerization tool (written in Go) to package, deploy & run applications, making them easily deployable/testable.
Docker essentially provides an isolated & portable environment as a minimal package, that is easily rebootable from scratch.
Unlike a virtual machine that virtualizes hardware (to install a real guest OS), Docker virtualizes OS kernels (to install real images).

Docker originated as a Linux technology, whose kernel is highly stable & backward compatible (stable syscall ABI), leading to very portable containers.
On Windows, two types of containers are possible: Linux containers (via a Linux VM ie _WSL 2_, cross-platform portable) & Windows containers (eg _nanoserver_/_windowsservercore_, low compatibility even between Windows 10/11)

## Quick Tips

* Use `wsl --shutdown` to kill RAM-hungry _Vmmmwsl_ process
* Docker itself downloads base images, but not all other dependencies (that is done via commands within Dockerfile eg `npm install`)
* Containers share host kernel, so they require a compatible OS (note that [all Linux distros share same Linux kernel](https://askubuntu.com/a/172932))
* Base images and image layers are only stored once and can get referenced many times, and also get cached during build process to speed up subsequent builds
* [Docker Hub](https://hub.docker.com)
* [Get started](https://docs.docker.com/get-started)
  * [What is Docker?](https://docs.docker.com/get-started/docker-overview)
* [TechWorld with Nana: Docker Crash Course for Absolute Beginners [NEW]](https://www.youtube.com/watch?v=pg19Z8LL06w)

## Glossary

* **Base Image** = a regular image designated in `FROM` directive in Dockerfile, defining starting point of build on which additional layers are added
  * Base images are pre-built (meaning we don't need to make them from a Dockerfile, they're tarballs, ie readymade filesystem layer archives artifacts) custom, community or vendor-made images
  * Base images provide userspaces but not OS kernels, as that is provided by host OS (or guest kernel in case of intermediary VM)
* **Bind Mounts** = mount host filesystem path directly into a container, managed outside Docker, implemented via host OS filesystem (access to sensitive OS folder may create security risk)
* **Compose** = a higher-level client to run a multi-service application (consisting of a set of images ie containers eg a backend & a frontend) from a single declarative YAML file
  * A single (`docker compose`) command creates/coordinates several containers on host
  * Unlike Kubernetes, this is not scaling-oriented cluster-level orchestration, merely a declarative setup to run interacting services in parallel (à la Visual Studio Debug multiple projects)
  * Images are either pre-built (and will pull missing images), or build them on the spot (ie either runs full Dockerfile, or references one of its images)
  * Where referencing an entire Docker file (ie `build: context: . (dockerfile: Dockerfile)` with optional explicit Dockerfile name), uses its last stage as target
* **Container** = runnable (running or stopped) stateless (ie volatile although a persistent disk can be mounted) instance of an image, isolated from one another but share host OS kernel
  * Containers allocate resources (CPU, RAM) dynamically, take a few MBs, take seconds to start, reuse/share host kernel (which does not have to be restarted each time)
  * VMs take GBs, minutes, fixed resources, run full-blown guest OS with resources access through a hypervisor, provide more resources than most apps need, but do provide better isolation & can runr non-compatible OSes
* **Docker Client** = client communicating with daemon (not necessarily on same system)
* **Docker Daemon** = heavy lifting heart of Docker, a service inside of which containers are built/run/distributed
* **Docker Desktop** = Windows/macOS/Linux application including Docker Engine, Docker CLI, Docker Compose, a Kubernetes cluster
* **Docker Engine** = Docker Daemon (`dockerd`) + REST API + Docker CLI client
* **Docker Hub** = public registry/repository/marketplace of existing images (à la .NET nuget.org) where Docker will look for images by default, and also a private repository for personal images
* **Docker Toolbox** = legacy Windows/Mac solution for older systems that do not meet requirements (packs _Oracle VM VirtualBox_)
* **Dockerfile** = step-by-step text recipe/blueprint/script to **build** a single final image, usually referencing a base image as its first statement
  * **Multi-Stage Build** = a dockerfile that has multiple stages, only one of which can be chosen as final image during a build (others are discarded, no two independent images from a single build)
    * Only stages in dependency chain of target stage are built (ie those explicitly referenced in `FROM`, or `COPY --from=` of currently built stage or its recursive ancestors)
    * That decreases size of final image (eg defines full SDK base image for building & publishing, but a lighter runtime base image for later deployments)
* **Image** = platform-agnostic read-only versionable taggable template used to create containers, typically including a base OS & software packaged together using a Dockerfile, can be pushed/pulled to/from a registry
  * Images act as a standard unit of deployment and include all dependencies (runtime, services, DBs, libraries), which can also be run in their own separate containers (for an architecture à la microservices)
  * Images are stored as layered filesystem snapshots (shareable between images) + metadata (ie environment variables, entrypoint, command, ports), and only necessitate storage for successive deltas from base image
* **Open Container Initiative** (OCI) = industry effort to standardize container format & execution
* **Registry** = Docker images hosted store service, can be private (on-premises or cloud eg Azure Container Registry) or public (eg **Docker Hub**)
* **Repository** = named collection of images related to a particular application/microservice/project in order to store/manage/share them publicliy or privately (à la Git repository)
* **Tag** = custom label used to identify specific platform (OS) and version (eg .NET version) of an image (eg when several of those are available, à la Git tags)
  * _latest_ = special tag that is used as default when none is explicitly specified
* **Volumes** = abstracts away filesystem paths & host details, an mapped area of host filesystem where containers can write/persist information

### (Docker Hub) Images

* **alpine** = minimal Linux distribution providing a small userland (musl libc, BusyBox) for lightweight containers/services without a kernel
* **microsoft/dotnet** = official images for .NET & ASP.NET Core (ie cross-platform, eg Windows Nano Server, includes Kestrel)
* **microsoft/dotnet-framework** = official images for .NET Framework & Windows Communication Framework (eg Windows Server Core)
* **microsoft/dotnet:2.2-sdk** = .NET Core image for development (>1GB), multi-architecture
* **microsoft/dotnet:2.2-runtime** = runtime-only (~200 Mo), multi-architecture (Linux & Windows => depends on Docker host)
* **microsoft/dotnet:2.2-aspnetcore-runtime** = runtime-only, multi-architecture for Linux & Windows
* **microsoft/dotnet:2.2-aspnetcore-runtime-nanoserver-1803** = runtime-only, Windows Nano Server
* **node** = node & npm commands
* **scratch** = an explicitly empty Docker image with no userspace, used for containers that run a single statically linked binary (eg Go/Rust) and rely solely on host kernel
* **treafik** = cloud native edge router
* Servers
  * **Windows Nano Server** = container-optimized minimal Windows user-mode subset for modern applications excluding legacy components (no GUI/windows, no explorer shell, etc)
  * **Windows Server** = full Windows Server OS with complete Windows APIs, GUI, mangement tools & services, typically used for VMs or bare metal
  * **Windows Server Core** = reduced Windows Server OS without GUI shell, with most Windows APIs & services for compatibility with traditional server workloads

## API

* `cat {dockerfile_folder} | docker build -t {image_name}`
* `docker build ({options}) {dockerfile_folder}` = builds an image from Dockerfile
  * `-f {dockerfile_name}` = explicit Dockerfile name (instead of default _Dockerfile_)
  * `-t(ag) {image(:tag)}`
* `docker image {command}` = manage images (`build`, `history`, `import`, `inspect`, `load`, `ls`, `prune`, `pull`, `push`, `rm` remove one or more, `save`, `tag` create a tag)
* `docker images` = lists local images (`-a` includes intermediary images)
* `docker info` = display setup information (where images reside, etc.)
* `docker logs {container_id|container_name}` = view logs of a container (especially useful for backgrounded ones since they are not displayed in terminal)
* `docker ps` = lists running containers (`-a` includes stopped containers)
* `docker pull {image(:tag)}` = download image from registry (_latest_ tag by default), implied when running a image not present locally
* `docker push {username}/{image}` = push to registry
* `docker run {image(:tag)} ({command})` = creates a container based on a (local or remote eg Docker Hub) image, creating a new container from image each time
  * `-d(etach)` = run in background
  * `-i` = interactive mode
  * `-p {host_port}:{container_port}` = binds host port & container port (exposes container to local network, usually same port both on host & container)
  * `-rm` = deletes container once program is finished (exited signal received)
  * `-t` = allocate a pseudo-TTY (plugs container to current terminal)
  * `--name {container_name}` = provide an explicit name for container (in place of defaultly generated one)
  * Runtime parameters can be provided, so a same image can actually generate different containers
* `docker rm {name|id}` = inversely, the following command deletes a container
* `docker start` = start an existing (stopped) container
* `docker stop {container_id|container_name}` = stop one (or more) running container
* `docker system prune` = deletes all resources — images, containers, volumes, and networks — that are dangling (not associated with a container)
  * `-a` = remove any stopped containers & all unused images (not just dangling images)

### Dockerfile

* `FROM {base_image}` = first statement in the Dockerfile; indicate the a base image from the repository (which is _Docker Hub_ by default)
* `WORKDIR {path}` = set working directory (for all following commands, à la `cd`)
* `COPY (--from=previous_stage) {source(s)} {target}` = copy some files/folders into this stage's filesystem
* `SHELL cmd|powershell` = specify which shell/CLI to use when using the RUN command
* `RUN {command}` = adds layer to initial parent image (ie installs stuff eg `npm install`)
* `CMD {command} ({parameter(s)})` = defines a default command executed when container starts (there can only be one in whole Dockerfile)
* `ENTRYPOINT` = runs a container like an executable
* `EXEC {command}` = runs a command inside a container
* `EXPOSE {port}` = expose a port to the world outside the container
* `ENV {variable} {value}` = define an environment variable

## Exensions

* **Portainer** = a web UI for Docker
* **Vagrant** (by _Hashicorp_) = (à la Docker)
