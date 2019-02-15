# Docker

Docker is open-source, automating portable & self-sufficient apps deployment.

Docker containers run on the same Docker host
  => smaller footprint than actual VM images
  => a single image can be be run on different platforms in the sense that they all use the same Linux VM
  => no need for multiple base images (one for each platform)
  => build once, run anywhere

Docker Images act as a standard unit of deployment, even though they can package different codes & services and their dependencies.
They are intended to facilitate deployment & testing.

For reliability reasons, it's better to run different instances of the same image on different machines/VMs.

A container runs natively on Linux and shares the kernel of the host machine with other containers.
It runs a discrete process, taking no more memory than any other executable, making it lightweight.
By contrast, a virtual machine (VM) runs a full-blown “guest” operating system with virtual access to host resources through a hypervisor.
In general, VMs provide an environment with more resources than most applications need.

## Glossary

* Docker Host aka Container Host = the Linux server/VM where containers can be run (a Linux machine doesn't need an actual VM since it's Linux already).
* Image = Cross-platform static package ready to be deployed & run
* Container = Running (or stopped) instance of an Image
* Windows Server Containers = Runtime with process & namespace isolation but shared kernel with container host
* Hyper-V Containers = Runtime that runs each container in separated (optimized) VMs, to provide better isolation
Images are created the same way for both of those runtimes.

## Commands

Build an image

  docker build -t {image_name} {dockerfile_path}

Creates a container based on the image, which can be localo or remote (Docker Hub):

  docker run {image}
  docker run {image} -d # in the background (d for daemon)
  docker run {image} -rm # Deletes the container once the program is finished ("exited" signal received)

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
  
## Docker Hub

Repository/Marketplace of (base) images. Not unlike nuget.org for NuGets.

