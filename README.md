# aix-docker
Bring your own AIX disk and run AIX 7.2 in docker on X64 using qemu-system-ppc64.
This is just a boiler plate.


# Whatever
In this example the container is setup in an ubuntu 20 VM running on vmware ESX. 
It runs reasonable fast with 4Gb RAM and 1 CPU.

The AIX instance will be reachable on your local network via tap0 interface.
We need to help this tap0 interface a little so it can talk to the outside world.


- Run **build.sh** to build the docker image,

- Run **clean.sh** whenever you need to clean up your mess.

- Run **run.sh** whenever you want to deploy your AIX docker container.



Make sure you have **/proc/sys/net/ipv4/ip_forward** set to 1.

All the host networking stuff is setup in run.sh

Yes, the booting is very slow under qemu, it'll sleep on "Star" for some minutes, then it'll begin puking out lots of 4 digit lottery numbers until it hits the login prompt (probably after 10-13mins).

If you run the container in interactive mode, ctrl-c will shutdown qemu and the container.

Attaching to the container after starting in a detached mode doesn't really seem to work, it never pickups any key presses.
