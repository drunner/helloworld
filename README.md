# drunner-helloworld
Simple example of a docker container that supports [dRunner](https://github.com/j842/drunner).

## Example usage

```
drunner install drunner/helloworld
helloworld run
```

## Usage details

```
drunner install drunner/helloworld [SERVICENAME]
```
on the host calls the install script in the container. It adds the scripts for
the other commands to the host (in our case just help and run). SERVICENAME
defaults to helloworld.

You can then use 
```
    SERVICENAME run
```
to execute the 'run' script, which launches the container and runs helloworld.
