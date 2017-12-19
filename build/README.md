# Creating a Custom Build of `zm-docker`
This container facilitates the production of a custom build of the Zimbra software that can then be used to build `zm-docker`.

## Customize the Build Configuration
`./config/config.build` contains all the flags that will be used to customize the execution of the build process. For the most part you have to reference the [`zm-build/build.pl`]([zm-build/build.pl at develop · Zimbra/zm-build · GitHub](https://github.com/Zimbra/zm-build/blob/develop/build.pl)) file to understand what flags are available.

## Produce a Build
- Make sure that your CWD is `zm-docker/build` (the directory this file is in)
- Make sure you have the latest build container cached in Docker. `docker build -t zm-docker-build .`
- Run the build `docker run -v ``realpath ../BUILDS``:/home/build/zm/BUILDS -v ``realpath ./config``:/home/build/config zm-docker-build`
- Check that `../BUILDS/latest` contains the build

*TODO* this should be refactored into `make compile` 

## Build `zm-docker` with the Latest Build
- Produce a build
- Make sure your CWD is `zm-docker`
- Run `make clean && make build-all`