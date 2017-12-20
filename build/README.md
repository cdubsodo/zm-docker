# Creating a Custom Build of `zm-docker`
This container facilitates the production of a custom build of the Zimbra software that can then be used to build `zm-docker`.

## Customize the Build Configuration
`./config/config.build` contains all the flags that will be used to customize the execution of the build process. For the most part you have to reference the [`zm-build/build.pl`]([zm-build/build.pl at develop · Zimbra/zm-build · GitHub](https://github.com/Zimbra/zm-build/blob/develop/build.pl)) file to understand what flags are available.

An example of `config.build` content is:

 BUILD_RELEASE = F9TEAMS
 BUILD_RELEASE_NO = 8.9.0
 BUILD_RELEASE_CANDIDATE = beta
 BUILD_TYPE = FOSS
 BUILD_THIRDPARTY_SERVER = zdev-vm008.eng.zimbra.com
 GIT_DEFAULT_BRANCH = develop
 ANT_OPTIONS = -DskipTests=1
 INTERACTIVE = 0
 DISABLE_BUNDLE = 1
 %GIT_OVERRIDES = zm-mailbox.branch=feature/ha-distributed
 %GIT_OVERRIDES = zm-db-conf.branch=feature/solr

## Produce a Build
- Once you have all your `SSH keys` in place and customized your `config.build` make sure your CWD is `zm-docker`
- Then just run `make compile`, it will take some time to finish
- If all goes well you can find the produced build into the `zm-docker/build/BUILDS` directory
- The latest *build* it generates has to be pointed for the *"latest"* symbolic link

## Build `zm-docker` with the Latest Build
- Produce a build
- Make sure your CWD is `zm-docker`
- Run `make clean && make build-all`