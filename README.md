# aix-docker
Bring your own AIX disk and run AIX 7.2 in docker on X64 using qemu-system-ppc64.


# Whatever
In this example the container is setup in an ubuntu 22 VM running on vmware ESX. 
It runs reasonable fast with 4Gb RAM and 1 CPU.

The AIX instance will be reachable on your local network via tap0 interface.
We need to help this tap0 interface a little so it can talk to the outside world.


- Run build.sh to build the docker image,

- Run clean.sh whenever you need to clean up your mess.

- Run run.sh whenever you want to deploy your AIX docker container.

