# docker-dr-helloworld
Simple example of a docker container that supports [dr](https://github.com/j842/dr).

## Example usage without dr

```
docker run --rm -i -t j842/dr-helloworld /usr/local/bin/helloworld helloworld
```

## Example usage with dr

```
dr install j842/dr-helloworld helloworld
dr helloworld run
```

## Usage details

```
dr install j842/dr-helloworld SERVICENAME
```
on the host calls the drinstall script in the container. It adds the scripts for
the other commands to the host (in our case just help and run).

You can then use 
```
    dr SERVICENAME run
```
to execute the 'run' script, which launches the container and runs helloworld.
