# docker-dr-helloworld
Simple example of a docker container that supports [dr](https://github.com/j842/dr).

## Usage 

    dr install j842/dr-helloworld helloworld
    dr helloworld run

## Description

drinstall in the container is called by dr install on the host. It adds the scripts to the host for
the other commands (in our case just help and run).

You can then use 
    dr SERVICENAME run
to execute the 'run' script, which launches the container and runs helloworld.
