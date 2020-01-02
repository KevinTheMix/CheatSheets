# Docker

Docker is open-source, automating portable & self-sufficient apps deployment.
Docker Toolbox is an older version of Docker that only runs on Linux => it installs on Windows with the (Oracle) VirtualBox hypervisor and runs inside it.

## Components

### Container Host OS

The operating system of the machine/VM on which the Docker Engine runs.

### Docker Engine

Docker Daemon & Docker Client

#### Docker Daemon (aka Container Host)

The Heart of Docker: a service inside of which containers run.

### Container Base OS

The base image, that contains an OS such as Windows Nano Server, Windows Server Core, Linux Alpine, or not (using FROM scratch, only on Linux).

### Image

Cross-platform self-contained immutable package including all dependencies, ready to be deployed & run.
A single image can be be run on different platforms, as they contain all they need to run, including the Base OS => build once, run anywhere.
An image contains a union of layered filesystems (the successively run commands that installed something) stacked on top of each other.
An image is configured by the instructions Dockerfile, but accepts command parameters when run (see CMD parameters overrident by docker run parameters).

They are stored in the host (=> in the Linux VM filesystem when using Docker Tools on Windows).
The storage required for an image only consists of the Delta from its Base image => base images arent' stored for each image they appear in, but only once!

Docker Images act as a standard unit of deployment, even though they can package different codes & services and their dependencies.
They are intended to facilitate deployment & testing.
For reliability reasons, it's better to run different instances of the same image on different machines/VMs.

#### Base/Parent Image

Existing Image made by vendors (or custom) that contains some platform & framework (e.g. there is an image packing Windows Nano Server with .NET Core).

### Container

Instance of an image, running or stopped.
Docker containers run on the same Docker host.
Containers share the kernel of the container host (which is the host machine itself if run natively) with other containers.
Development machines run only one Docker host (Linux or Windows) => related containers will need to run on the same platform.
It is configurable by the parameters provided to the run command => 1 image can actually generate different containers.

Windows Server Containers = Runtime with process & namespace isolation but shared kernel with container host.
A Windows container requires a Windows Server-based Docker host (native).
A Linux container requires a Linux-based Docker host (native or VM).

#### Hyper-V Container

Technology available on Windows 10.
Offers a hypervisor that can run other OS. It is required to run Linux Containers.
The kernel of the host OS is no longer shared; instead each container has its own (VM) kernel.
Runtime that runs each container in separated (optimized) VMs, to provide better isolation.
Their image is created the same way as regular Containers; they just require an additional parameter when the Container gets run.

#### Container vs VM

Containers have a smaller footprint than actual VM images.

A coontainer runs a discrete process, taking no more memory than any other executable, making it lightweight.
By contrast, a virtual machine (VM) runs a full-blown “guest” operating system with virtual access to host resources through a hypervisor.
In general, VMs provide an environment with more resources than most applications need.

Not only are Containers smaller and faster to start/stop than VMs, they also are configurable, via the Dockerfile & execution parameters.
Indeed, containers can be parameterized by providing arguments to the ***docker run*** command, thereby enabling orchesttration and instanciation of various containers from a single image.
This scaling (and orchestration) ability makes even monolithic applications want to use Containers.

On the other hand, VMs provide better isolation.

### Dockerfile

The name of the base image on the repository (which is Dockerhub by default).

  `FROM {parent_image}`

Set the working directory.

  WORKDIR {path}

Copy some files/folders.

  COPY {path_a} {path_b}

Specify which shell/cli to use when using the RUN command.

  SHELL cmd|powershell
  
Adds layer to the initial parent image (i.e. installs stuff).

  RUN {command}

Defines a default command when none is provided.

  CMD {command}

Runs a container like an executable.

  ENTRYPOINT

Runs a command inside a Container

  EXEC {command}

Expose a port to the world outside the container.

  EXPOSE {port}
  
Define an environment variable

  ENV {variable} {value}

### Storage

#### Volumes

Area of the host filesystem where containers can write/persist information, via mapping Containter directories to the Host OS directories.

The Container thinks it is access the FS, but it's a mapped directory.

When using an Orchestrator, the Container might move, so it isn't suggested to use Volumes for Business Data => only use for temp files & logs.
For Business storage, use the traditional data repositories, regardless of using containerization (see Remote below).

#### Bind Mounts

Map to any folder in the host filesystem (access to sensitive OS folder may create security risk).

#### Tmpfs Mounts (Temp FS)

virtual folder stored in the host's memory (not persisted).

#### Remote

* External DB (SQL Server & co)
* Azure Cosmos DB (NoSQL)
* Azure SQL Dataabase
* Azure Storage

### Misc

* Multi-stage Build = used to decrease the size of the final Image. E.g. full SDK base image is necessary for building & publishing, but a lighter runtime base image might suffice after that => re-package published result.
* Registry = Docker Hub & co. Contains repositories. Companies often have a private registry to manage their own custom Images (e.g. using Azure Container Registry).
* Repository = collection of related Images under common Tag.
* Tag = label used to identify the specific platform (OS) and version (e.g. .NET version) of an Image when several of those are available.
* Compose = CLI tool using YAML for defining & running multi-container applications (from several Images) => a single command (***docker compose***) creates several containers on the Docker host.
* Cluster = collection of Docker hosts exposed as one. Used by orchestration for scaling (see Kubernetes, Azure Fabric Service, Docker Swarm, Mesosphere).
* Orchestrator = manages the lifecycle and locations of various Containers, with error control & restart capabilities.

## Docker Commands

Build an image

  docker build -t {image_name} {dockerfile_folder}
  docker build -f {dockerfile_path} # Explicit path to the Dockerfile (that can be different from "Dockerfile" then)
  cat {dockerfile_folder} | docker build -t {image_name}

Creates a container based on the image, which can be local or remote (Docker Hub):

  docker run {image}
  docker run {image} -d # in the background (d for daemon)
  docker run {image} -rm # Deletes the container once the program is finished ("exited" signal received)
  docker run {image} -it # Standard input/output

A new container is created from the image every one time the command is run.
Inversely, the following command deletes a container

  docker rm {name|id}

Start an existing (stopped) container

  docker start

Stop a running container

  docker stop

Lists running containers

  docker ps

Lists running and stopped containers

  docker ps -a

Lists all images

  docker images -a

Deletes all resources — images, containers, volumes, and networks — that are dangling (not associated with a container)

  docker system prune

Remove any stopped containers and all unused images (not just dangling images)

  docker system prune -a

Display setup information (where images reside, etc.)

  docker info

## Docker Hub

Repository/Marketplace of (base) images. Not unlike nuget.org for NuGets.

### Docker Hub Images

* microsoft/dotnet = .NET Core (Windows Nano Server, cross-platform, includes Kestrel) => optimized for .NET Core
* microsoft/dotnet-framework = .NET Framework (Windows Server Core, includes IIS) => optimized for .NET Framework

Both exist as SDK (>1 Go even for Core), or as Runtime (~200 Mo) that can be used for multi-stage builds.

Note that it is possible to run .NET Core on the Windows Server Core, for exemple.
In that case, we need to create our own custom Image since it is an unusual (and not really optimal) configuration.

We can specify the OS we want by adding its tag as a suffix to the Image in the FROM statement of the Dockerfile.

  microsoft/dotnet:2.2-sdk # .NET Core Image for development, Multi-architecture
  microsoft/dotnet:2.2-runtime # Runtime-only & Multi-architecture (Linux & Windows => depends on the Docker host)
  microsoft/dotnet:2.2-aspnetcore-runtime # Runtime-only, Multi-architecture for Linux & Windows
  microsoft/dotnet:2.2-aspnetcore-runtime-nanoserver-1803 # Runtime-only & Windows Nano Server

## Questions

Compile the source code before or after building an Image? Is it like CI where source is automatically retrieved from repo & built?