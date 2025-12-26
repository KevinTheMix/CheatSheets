# Docker

Docker is an open-source virtualization/containerization tool to package, deploy & run applications, making them easily deployable/testable.
Docker essentially provides an isolated & portable environment as a minimal package, that is easily rebootable from scratch.
Unlike a virtual machine that virtualizes hardware (to install a real OS), Docker virtualizes OS kernels (to install real images).

## Quick Tips

* [Docker Overview](https://docs.docker.com/get-started/overview)
* [Docker Crash Course for Absolute Beginners](https://www.youtube.com/watch?v=pg19Z8LL06w) (2023)

## Glossary

* **Base/Parent Image** = custom or vendor-made cross-platform pre-built image containing OS & software (eg Windows Nano Server with .NET Core image)
  * They only need to be stored once (not for each referencing image) in a local store, or in public registries (eg Docker Hub, GitHub Container Registry, AWS ECR, or a private custom server)
* **Bind Mounts** = map to any folder in the host filesystem (access to sensitive OS folder may create security risk)
* **Cluster** = collection of Docker hosts exposed as one. Used by orchestration for scaling
* **Compose** = a Docker client to work with applications consisting of a set of containers
  * Uses a single YAML file to define & run multi-container applications (from several Images)
  * A single (`docker compose`) command creates several containers on the Docker host
* **Container** = (running or stopped) stateless (ie volatile, though a persistent disk can be mounted ) instance of an Image
  * Containers share the kernel of the container host (which is the host machine itself if run natively) with other containers
  * Containers are configurable (via Dockerfile) & parameterized (by providing arguments to the `docker run` command) => 1 image can actually generate various containers
  * This scaling/orchestration ability from a single image makes even monolithic applications want to use Containers
  * A Windows container requires a Windows Server-based Docker host (_native_)
  * A Linux container requires a Linux-based Docker host (_native or VM_)
* **Containers vs VMs** = Containers have a smaller footprint (a few MBs, seconds to start) than actual VM images (a few GBs, minutes to start)
  * On a VM, resources (CPU, RAM) are fixed, while with Containers they are allocated dynamically
  * Docker reuses the kernel of its hosts, so it does not have to pack it up, let alone starting it up each time
  * By contrast, a virtual machine (VM) runs a full-blown guest OS with virtual access to host resources through a hypervisor
  * In general, VMs provide an environment with more resources than most applications need; on the other hand, they provide better isolation
* **Container Base OS** = base image containing an OS (eg Windows Nano Server, Windows Server Core, Linux Alpine), or not (using `FROM scratch`, only on Linux)
* **Container Host** = machine/VM that has the OS on which the Docker Daemon runs
* **Docker Client** = Docker uses a client-server architecture: the client talks to the daemon (not necessarily on the same system)
* **Docker Daemon/Runtime** = heart of Docker that does the heavy lifting: a service inside of which containers are built/run/disttributed
* **Docker Desktop** = Docker for Windows/Mac, using a HyperVisor Layer with a lightweight Linux distro to run Linux-based containers (ie what most of them are)
* **Docker Toolbox** = legacy Windows/Mac solution for older systems that do not meet the requirements (packs _Oracle VM VirtualBox_)
* **Dockerfile** = step-by-step recipe/blueprint of an Image, usually referencing a base image as first statement
* **Hyper-V** = hypervisor (available on Windows 8+) that can run other OS (required to run Linux Containers)
  * Hyper-V containers don't share the host OS kernel, they each run in its own separated (optimized) VM (kernel), providing better isolation
  * Hyper-V container require an additional parameter when the Container gets run
* **Image** = cross-platform package usually constructed from another image (notably a base image), including all dependencies (ie runtime, services, DBs, libraries), ready to be deployed (build once, run anywhere)
  * Note that dependencies can run in their own separate containers, yet interact with one another (à la microservices)
  * Images only necessitates storage for successive granular deltas from base image
  * Images act as a standard unit of deployment, even though they can package different codes & services and their dependencies
  * For reliability reasons, it's better to run different instances of the same image on different machines/VMs
  * Accepts runtime parameters when (docker) run
* **Multi-stage Build** = used to decrease the size of the final Image (eg full SDK base image is necessary for building & publishing, but a lighter runtime base image might suffice after that => re-package published result)
* **Open Container Initiative** (OCI) = industry effort to standardize container format & execution
* **Orchestrator** = manages the lifecycle and locations of various Containers, with error control & restart capabilities (eg Azure Fabric Service, Docker Swarm, Kubernetes, Mesosphere)
* **Registry** = Docker Hub & co. Contains repositories. Companies often have a private registry to manage their own custom Images (e.g. using Azure Container Registry)
* **Remote Storage** = external DB (SQL Server & co), Azure Cosmos DB (NoSQL), Azure SQL Database, Azure Storage
* **Repository** = collection of related Images under common Tag
* **Scratch** = special minimal OS-less image acting as a blank container (mainly for Rust/Go applications which don't require an OS)
* **Tag** = label used to identify the specific platform (OS) and version (e.g. .NET version) of an Image when several of those are available
* **Tmpfs Mounts** (Temp FS) = virtual folder stored in the host's memory (not persisted)
* **Volumes** = area of the host filesystem where containers can write/persist information, via mapping Container directories to the Host OS directories
  * The Container thinks it is access the FS, but it's a mapped directory
  * Only use Volumes for logs/temp files (not Business Data), because when using an Orchestrator, the Container might move
  * For Business storage, use the traditional data repositories, regardless of using containerization (see Remote)
* **Windows Server** = runtime with process & namespace isolation, but shared kernel with container host

* _Kubernetes_ = open-source production-grade orchestrating platform for placing & executing (not necessarily Docker) containers, enabling availability/flexility/scalability
* _minikube_ = quickly setup a local Kubernetes cluster on macOS/Linux/Windows

## API

Build an image

* `docker build -t {image_name} {dockerfile_folder}`
* `docker build -f {dockerfile_path}` = explicit path to the Dockerfile (that can be different from "Dockerfile" then)
* `cat {dockerfile_folder} | docker build -t {image_name}`

Creates a container based on the image, which can be local or remote (Docker Hub):

* `docker run {image}`
* `docker run {image} -d` = in the background (d for daemon)
* `docker run {image} -rm` = deletes the container once the program is finished ("exited" signal received)
* `docker run {image} -it` = standard input/output

A new container is created from the image every one time the command is run.

* `docker rm {name|id}` = inversely, the following command deletes a container
* `docker start` = start an existing (stopped) container
* `docker stop` = stop a running container
* `docker ps` = lists running containers
* `docker ps -a` = lists running and stopped containers
* `docker images -a` = lists all images
* `docker system prune` = deletes all resources — images, containers, volumes, and networks — that are dangling (not associated with a container)
* `docker system prune -a` = remove any stopped containers and all unused images (not just dangling images)
* `docker info` = display setup information (where images reside, etc.)

### Dockerfile

Script used to build a Docker image  

* `FROM {base_image}` = first statement in the Dockerfile; indicate the a base image from the repository (which is _Docker Hub_ by default)
* `WORKDIR {path}` = set the working directory
* `COPY {path_a} {path_b}` = Copy some files/folders
* `SHELL cmd|powershell` = Specify which shell/cli to use when using the RUN command
* `RUN {command}` = Adds layer to the initial parent image (i.e. installs stuff)
* `CMD {command}` = Defines a default command when none is provided
* `ENTRYPOINT` = Runs a container like an executable
* `EXEC {command}` = Runs a command inside a Container
* `EXPOSE {port}` = Expose a port to the world outside the container
* `ENV {variable} {value}` = Define an environment variable

## Extensions

* _Vagrant_ (by _Hashicorp_) = (à la Docker)
* _Portainer_ = a web UI for Docker
* **Docker Hub** = repository/Marketplace of (base) images (à la <https://nuget.org> for nugets)

### Docker Hub Images

* _microsoft/dotnet_ = .NET Core (Windows Nano Server, cross-platform, includes Kestrel) => optimized for .NET Core
* _microsoft/dotnet-framework_ = .NET Framework (Windows Server Core, includes IIS) => optimized for .NET Framework

Both exist as SDK (>1 Go even for Core), or as Runtime (~200 Mo) that can be used for multi-stage builds.

Note that it is possible to run .NET Core on the Windows Server Core, for exemple.
In that case, we need to create our own custom Image since it is an unusual (and not really optimal) configuration.

We can specify the OS we want by adding its tag as a suffix to the Image in the FROM statement of the Dockerfile.

* _microsoft/dotnet:2.2-sdk_ = .NET Core Image for development, Multi-architecture
* _microsoft/dotnet:2.2-runtime_ = Runtime-only & Multi-architecture (Linux & Windows => depends on the Docker host)
* _microsoft/dotnet:2.2-aspnetcore-runtime_ = Runtime-only, Multi-architecture for Linux & Windows
* _microsoft/dotnet:2.2-aspnetcore-runtime-nanoserver-1803_ = Runtime-only & Windows Nano Server
