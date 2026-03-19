# Docker

Docker is an open-source virtualization/containerization tool (written in Go) to package, deploy & run applications, making them easily deployable/testable.
Docker essentially provides an isolated & portable environment as a minimal package, that is easily rebootable from scratch.
Unlike a virtual machine that virtualizes hardware (to install a real guest OS), Docker virtualizes OS kernels (to install real images).

Docker originated as a Linux technology, whose kernel is highly stable & backward compatible (stable syscall ABI), leading to very portable containers.
Docker uses resource isolation features of Linux kernel such as cgroups (ie what resources a process can use) & kernel namespaces (ie what a process can see), and a union-capable file system such as OverlayFS and others to allow independent containers to run within a single Linux instance
macOS and Windows use a Linux VM under Docker Desktop.
On Windows, container types are either cross-platform portable Linux (a Linux VM via _WSL 2_) or more niche Windows(Server)-only (eg _nanoserver_/_windowsservercore_ that have low compatibility even between Windows 10/11).

## Quick Tips

* In VS 2022+, right-click on solution then _Add > Orchestrator Support…_ to add a Dockerfile & _compose.yml_ file to a project
* Use `wsl --shutdown` to kill RAM-hungry _Vmmmwsl_ process (first stop Docker Desktop in system tray)
* Docker itself downloads base images, but not indirect dependencies (that is done via commands within Dockerfile eg `npm install`)
* Containers share host kernel, so they require a compatible OS (note that [all Linux distros share same Linux kernel](https://askubuntu.com/a/172932))
* Windows containers are niche & used primarily for legacy .NET Framework apps that must run on Windows (can't be used by Mac/Linux, can't be part of same Docker compose as Linux containers)
* (Base) images layers are only stored once then referenced many times (in a read-only fashion by containers, virtualized as if they belonged to their FS), and also get cached during build process to speed up subsequent builds
* [Docker Hub](https://hub.docker.com)
* [Get started](https://docs.docker.com/get-started)
  * [What is Docker?](https://docs.docker.com/get-started/docker-overview)
* [TechWorld with Nana: Docker Crash Course for Absolute Beginners [NEW]](https://www.youtube.com/watch?v=pg19Z8LL06w)

## [Glossary](https://docs.docker.com/reference/glossary)

* **Base Image** = a regular image designated in `FROM` directive in Dockerfile, defining starting point of build on which additional layers are added
  * Base images are pre-built (meaning we don't need to make them from a Dockerfile, they're tarballs, ie readymade filesystem layer archives artifacts) custom, community or vendor-made images
  * Base images provide userspaces but not OS kernels, as that is provided by host OS (or guest kernel in case of intermediary VM)
* **Bind Mounts** = mounts into container a specific file/directory path from host machine (addresses some workflows but create host directory structure dependency & security risks)
  * Especially useful during development by pointing to source code, so that every small code change can be reflected immediately live in container (without rebuilding an image if we had used `COPY` instead)
  * For production, we pack source code using dockerfile `COPY` instead so that image is self-contained & embeds everything it needs
* **Build Context** = folder path specified during build whose contents are accessible to Dockerfile instructions (eg `COPY`); paths in those instructions are relative to this context
* **Compose** = a higher-level client to run a multi-service application (consisting of a set of images ie containers eg backend + frontend) from a single declarative YAML file (ie infrastructure-as-code, shareable within devteam)
  * A single `docker compose` command is equivalent to running a bunch of `docker run` command to spawn several coordinated containers on host
  * Unlike Kubernetes, this is not scaling-oriented cluster-level orchestration, merely a declarative setup to run interacting services in parallel (à la Visual Studio Debug multiple projects)
  * Images are either pre-built (and will pull missing images), or build them on the spot (ie either runs full Dockerfile, or references one of its images)
  * Where referencing an entire Docker file (ie `build: context: . (dockerfile: Dockerfile)` with optional explicit Dockerfile name), uses its last stage as target
  * That compose YAML file is included in solution repo, so any dev can clone it then spin `docker compose up -d` at beginning of day and have all required dependencies running while they test their local code (via `F5`)
  * _docker-compose.yml_ should contain all base environment-agnostic configuration (eg which services with images & `depends_on` relationships)
  * _docker-compose.override.yml_ (usually for development) or similar file for production/staging/testing should contain environment-specific configuration, merged with base file content when launching `docker compose up`
* **Container** = runnable (running or stopped) stateless (ie volatile although a persistent disk can be mounted) instance of an image, isolated from one another but share host OS kernel
  * Containers are not a _copy_ of their parent image and its storage; rather they access that read-only storage where it sits in a virtualized fashion (thinking it is its own) while also having a separate writable storage area
  * Containers allocate resources (CPU, RAM) dynamically, take a few MBs, take seconds to start, reuse/share host kernel (which does not have to be restarted each time)
  * VMs take GBs, minutes, fixed resources, run full-blown guest OS with resources access through a hypervisor, provide more resources than most apps need, but do provide better isolation & can run non-compatible OSes
* **Docker CE** = Community Edition (as opposed to EE)
* **Docker Client** = client communicating with daemon (not necessarily on same system)
* **Docker Daemon** = heavy lifting heart of Docker, a service inside of which containers are built/run/distributed
* **Docker Desktop** = development tool for Windows/macOS/Linux for building/running/testing containers locally (includes Docker Engine/CLI/Compose & a Kubernetes cluster), replaces Docker Toolbox (based on Oracle VirtualBox)
* **Docker Engine** = Docker Daemon (`dockerd`) + REST API + Docker CLI client
* **Docker Host** = machine/VM that runs Docker (reachable from containers previously via virtual IP _10.0.75.1_ and now via hostname _host.docker.internal_ since WSL2)
* **Docker Hub** = public registry/repository/marketplace of existing images (à la .NET nuget.org) where Docker will look for images by default, also a private repository for custom images
* **Docker Swarm** = built-in Docker orchestrator (similar to Kubernetes, not as widely used), turning multiple hosts into a single cluster, has built-in secret management
* **Docker Toolbox** = legacy Windows/Mac solution for older systems that do not meet requirements (packs _Oracle VM VirtualBox_)
* **Docker Trusted Registry** (DTR) = official Docker registry service to be installed on-premises (for enterprises, included in Docker Datacenter product)
* **Dockerfile** = step-by-step text recipe/blueprint/script to **build** (build time only, not used when a container is run) a single final image, usually referencing a base image as its first statement
  * Each local source code project that needs to run as its own container (ie not class libraries) gets its own Dockerfile
  * **Multi-Stage Build** = a dockerfile that has multiple `FROM` statements (ie stages) that can use a different base
    * Any one stage can be built as resulting image, and each build produce a single image where only its dependency chain is built (ie those explicitly referenced in `FROM` or `COPY --from=` transitively)
    * Eg a typical scenario involves using a larger SDK image for compiling some code into resulting artifacts, and copying them to a lighter runtime-only final production image
    * Eg [Multi-stage builds](https://docs.docker.com/build/building/multi-stage) = provides Go source code inline & compile it, then execute that compiled result in a _scratch_ base image
* **Image** = platform-agnostic **read-only** versionable taggable template used to create containers, typically including a base OS & software packaged together using a Dockerfile, can be pushed/pulled to/from a registry
  * An image is a static representation of an app or service along with its configuration & dependencies (runtime, services, DBs, libraries) and act as a standard unit of deployment
  * Images are stored as layered filesystem snapshots (shareable between images) + metadata (ie environment variables, entrypoint, command, ports), and only necessitate storage for successive deltas from base image
  * Using a graphics editor analogy, a built Docker image is truly stored as separate layers and not the resulting composite graphical image (that is only achieved when running a container)
* **Image Layer** = read-only file system delta/diff from previous image layer that are either uncompressed (when created or manipulated during execution) or compressed (as a gzipped tag archive) when stored in a registry
  * When a container writes a new file, it is created in its writable layer, but when modifying an existing file (from an image layer), copy-on-write is performed granularly to obtain only a copy of that file in writable layer
* **Open Container Initiative** (OCI) = industry effort to standardize container format & execution
* **Registry** = Docker images hosted store service, can be public (eg **Docker Hub**) or private (on-premises or cloud eg Azure Container Registry or Docker Hub as well)
* **Repository** = named collection of images related to a particular application/microservice/project (eg include Linux/Windows variants under same repo name) in order to store/manage/share them publicliy or privately
* **Storage Driver** = manages images & containers layers storage, and metadata
* **Tag** = custom label used to identify specific platform (OS) and version (eg .NET version) of an image (eg when several of those are available, à la Git tags)
  * _latest_ = special tag that is used as default when none is explicitly specified
* **Tmpfs Mounts** = in-host-memory temporary storage (never written to filesystem, meant for fast non-persistent data)
* **Volumes** = preferered mechanism for persisting data: a mapped area of host filesystem where containers can write/persist information, abstracts away filesystem paths & host details, can be shared between containers
* **Windows Nano Server** = container-optimized minimal Windows user-mode subset for modern applications (eg uses Kestrel self-hosted web server) while excluding legacy components (no GUI/windows, no explorer shell)
* **Windows Server** = full Windows Server OS with complete Windows APIs, GUI, mangement tools & services, typically used for VMs or bare metal
* **Windows Server Core** = reduced Windows Server OS without GUI shell, with most Windows APIs & services (eg **IIS**) for compatibility with traditional server workloads
  * Required only to run older legacy .NET versions, Windows-specific APIs, COM interop (use Nano Server _aspnet:8.0-nanoserver-ltsc2022_ instead, or better yet .NET on Linux _aspnet:8.0_)
* **Writable Container Layer** = thin ephemeral runtime-only writable layer on top of read-only image layers (using copy-on-write when writing to existing files from image)

### (Docker Hub) Images

* **alpine** = minimal Linux distribution providing a small userland (musl libc, BusyBox) for lightweight containers/services without a kernel
* **hello-world** = official minimal image for learning/installation testing purposes (at <https://hub.docker.com/_/hello-world>)
* [dotnet](https://github.com/dotnet/dotnet-docker)
  * **microsoft/dotnet** = official images for .NET & ASP.NET Core (ie cross-platform, eg Windows Nano Server, includes Kestrel)
  * **microsoft/dotnet-framework** = official images for .NET Framework & Windows Communication Framework (eg Windows Server Core)
  * **microsoft/dotnet:2.2-sdk** = .NET Core image for development (>1GB), multi-architecture
  * **microsoft/dotnet:2.2-runtime** = runtime-only (~200 Mo), multi-architecture (Linux & Windows => depends on Docker host)
  * **microsoft/dotnet:2.2-aspnetcore-runtime** = runtime-only, multi-architecture for Linux & Windows
  * **microsoft/dotnet:2.2-aspnetcore-runtime-nanoserver-1803** = runtime-only, Windows Nano Server
* **node** = node & npm commands
* **scratch** = an explicitly empty Docker image with no userspace (no runtime/shell/libraries), used for containers that run single fully self-contained statically linked binary (eg Go/Rust) and rely solely on host kernel
* **treafik** = cloud native edge router

## API

* `cat <dockerfile_folder> | docker build -t <image_name>`
* `docker build (<options>) <dockerfile_folder>` = builds an image from a Dockerfile where specified folder (eg `.` for current) is used as _build context_ (ie will serve as relative path for instructions in Dockerfile)
  * `-f <dockerfile_name>dockerfile_path}` = explicit Dockerfile name (instead of default _Dockerfile_) or path
  * `-t(ag) <image>:tag)}`
* `docker compose`
  * `down (-v)` = stop everything (also delete volumes ie wiping DB data for a fresh start)
  * `run (<options>) <container> (<command>)` = run a one-off command on a service container, or run single container itself (using present docker compose file configuration)
  * `up` = start multi-container environement defined in _docker-compose.yml_
  * `-d(etach)` = runs in background (until taken down manually)
  * `-f(ile) <file>` = specify one or more compose (base or override) file explicitely (one `-f <file>` argument for each file, where order matters as latter ones overrides former ones)
* `docker exec <command>` = runs command inside already running container
* `docker image <command>` = manage images (`build`, `history`, `import`, `inspect`, `load`, `ls`, `prune`, `pull`, `push`, `rm` remove one or more, `save`, `tag` create a tag)
* `docker images` = lists existing local images (as seen in Docker Desktop)
  * `-a(ll)` = show all images (including intermediary images)
* `docker info` = display setup information (where images reside, etc.)
* `docker inspect <container>` = shows full configuration & state of a container (or image/network/volume/etc) in JSON format
  * `--format {{<specific_field>}}`  
* `docker logs <container_id|container_name>` = view logs of a container (especially useful for backgrounded ones since they are not displayed in terminal)
* `docker ps` = lists running containers (`-a` includes stopped containers)
* `docker pull <image(:tag)>` = download image from registry (_latest_ tag by default), implied when running a image not present locally
* `docker push <username>/<image>` = push to registry
* `docker rm <name|id>` = inversely, the following command deletes a container
* `docker run <image(:tag)> (<command>)` = creates a container based on a (local or remote eg Docker Hub) image, creating a new container from image each time
  * `-d(etach)` = run in background
  * `-e <ENV_VAR=value>` = define environment variables
  * `-i` = interactive mode
  * `-p(ublish) <host_port>:<container_port>` = binds host port & container port (exposes container to local network, usually same port both on host & container)
  * `-rm` = deletes container once program is finished (exited signal received)
  * `-t` = allocate a pseudo-TTY (plugs container to current terminal)
  * `--name <container_name>` = provide an explicit name for container in place of defaultly generated one (eg to use in `docker start/stop` commands)
  * Runtime parameters can be provided, so a same image can actually generate different containers
* `docker start <container_id|container_name>` = start an existing (stopped) container
* `docker stop <container_id|container_name>` = stop one (or more) running container
* `docker system prune` = deletes all resources — images, containers, volumes, and networks — that are dangling (not associated with a container)
  * `-a` = remove any stopped containers & all unused images (not just dangling images)

### Dockerfile

* `ADD` = COPY + can extract compressed archives (tar/gzip/etc) automatically and it can fetch files from URLs (don't use unless you need those extra features)
* `ARG <variable>` = introduces a runtime variable for build (eg `docker build --build-var koko=…` that can then eg be used with standard shell parameter expansion fallback `COPY ${koko:-obj/Docker/publish} .`)
* `CMD <command> (<parameter(s)>)` = defines a default command executed when container starts (only last one takes effect)
* `COPY (--from=<stage_index|stage_name>) <source(s)> <target>` = embeds some files/folders from a previous stage or a host local directory (relative to build context, eg source code) into a this new image layer's filesystem
  * Ignores files/folders mentioned in _.dockerignore_ file
* `ENTRYPOINT ["<command>"(, "<arg1>", "<arg2>")]` = defines command to run when container is started
* `ENV <variable> <value>` = define an environment variable
* `EXPOSE <port>` = documents which ports this container listens to (purely informational, use `docker run -p` to actually map a port between container & host, or equivalent docker compose file's _ports_ section)
* `FROM <base_image> (AS <multi_stage_alias>)` = first statement in the Dockerfile; indicate the a base image from the repository (which is _Docker Hub_ by default)
* `RUN <command>` = adds layer to initial parent image using commands provided by base image (eg `npm install` or `powershell -Command Add-WindowsFeature Web-Server`)
* `SHELL cmd|powershell` = specify which shell/CLI to use when using `RUN` command
* `WORKDIR <path>` = set working directory (for all following commands, à la `mkdir` & `cd`)

### Docker Compose

```yaml
version: <version> # (deprecated in newer Compose versions)
services:
  <service>
    build:
      context: <context eg .>
      dockerfile: <path>
    depends_on: # This service won't start until all its other services dependencies have been spun up
      - <service>
    entrypoint: ["<command>", "<args>"] # eg ["dotnet", "test", "--no-build"]
    environment: # Environment variables (ie container-local)
      - <var>=<value>
    expose: # Publishes a port only to other containers in internal/virtual Docker network.
      - "<port>"
    extra_hosts: # Adds entries to container's /etc/hosts file, letting you map hostnames to IP addresses.
      - "<hostname>:<ip>" # IP or special value _host-gateway_ resolving to host's internal IP (10.0.75.1 on older Docker version, or 172.17.0.1 on Linux (ie default bridge network gateway)).
      - "host.docker.internal:host-gateway" # Linux trick replicating Docker Desktop default behavior: maps built-in DNS name host.docker.internal (used by processes inside containers) to host machine's internal IP (ie localhost).
    image: <image>
    ports: # Maps container to (local)host ports to be reachable from outside (ie dev/debug direct access, in production go through API Gateways eg Ocelot).
      - "<host>:<container>"
    volumes: # Defines volumes for persistent storage
      - <volume>:<path> # Create a usable named volume linked to path inside container
      - <path> # Create an anonymous volume linked to path inside container (persistent but use less predictable random hash as name, not very useful in practice)
  volumes: # Explicitly configure (named) volume options (eg custom driver/labels)
    <volume>:
      driver: <driver> # Determines where/how data is stored (built-in _local_ by default, ie stores files on host machine's filesystem)
      labels: # Key-value metadata
        <key>: "<value>"
  networks: # Defines arbitrary names for segmenting network
```

* Variable placeholders can be defined with a (shell expansion fallback) value that can be overridden by environment variables or have default values defined in a gitignored _.env_ file (in folder where compose command is run):

```yaml
sqldata:
  image: mcr.microsoft.com/mssql/server
  environment:
    - SA_PASSWORD=${SQL_PASSWORD:-defaultPass123}
    - ACCEPT_EULA=Y
  ports:
    - "${SQL_PORT:-5434}:1433"
```

## Exensions

* **Portainer** = a web UI for Docker
* **Vagrant** (by _Hashicorp_) = (à la Docker)

## TODO

* [Build and push your first image](https://docs.docker.com/get-started/introduction/build-and-push-first-image)
