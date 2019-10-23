# SINGLETON SD - SCRIPTS - SWAGGER

This project contains swagger Linux bash scripts to generate swagger libraries from a spec file.
It uses [Swagger Code Generator](https://github.com/swagger-api/swagger-codegen) and [OpenApi Generator](https://github.com/OpenAPITools/openapi-generator).

> The **main repository** is hosted in [gitlab.com/singletonsd/scripts/swagger](https://gitlab.com/singletonsd/scripts/swagger.git) but it is automatically mirrored to [github.com/singletonsd](https://github.com/singletonsd/scripts-swagger.git), [github.com/patoperpetua](https://github.com/patoperpetua/scripts-swagger.git) and to [gitlab.com/patoperpetua](https://gitlab.com/patoperpetua/scripts-swagger.git). If you are in the Github page it may occur that is not updated to the last version.

## AVAILABLE SCRIPTS

### BINARIES DOWNLOADER

It downloads the .jar file to generate libraries.

```bash
curl -s https://singletonsd.gitlab.io/scripts/swagger/latest/swagger_binaries_dowloader.sh | bash /dev/stdin
```

It can be downloaded by:

```bash
curl -o swagger_binaries_downloader.sh -L https://singletonsd.gitlab.io/scripts/swagger/latest/swagger_binaries_dowloader.sh
```

### SWAGGER GENERATE ANDROID

It generates an android library of the provided script. It contains the following options:

```bash
SWAGGER_API_SPEC=#location of spec, it can be local or url
SWAGGER_GROUP=#group name. MANDATORY
SWAGGER_ARTIFACT=#artifact name. MANDATORY
SWAGGER_VERSION=
```

It can be downloaded by:

```bash
mkdir -p scripts && \
curl -o scripts/swagger_binaries_downloader.sh -L https://singletonsd.gitlab.io/scripts/swagger/latest/swagger_binaries_downloader.sh && \
curl -o scripts/swagger_generate_android.sh -L https://singletonsd.gitlab.io/scripts/swagger/latest/swagger_generate_android.sh && \
chmod +x scripts/swagger_binaries_downloader.sh scripts/swagger_generate_android.sh
```

### SWAGGER GENERATE ANGULAR

It generates an typescript angular library of the provided script. It contains the following options:

```bash
SWAGGER_API_SPEC=#location of spec, it can be local or url
```

It can be downloaded by:

```bash
mkdir -p scripts && \
curl -o scripts/swagger_binaries_downloader.sh -L https://singletonsd.gitlab.io/scripts/swagger/latest/swagger_binaries_dowloader.sh && \
curl -o scripts/swagger_generate_angular.sh -L https://singletonsd.gitlab.io/scripts/swagger/latest/swagger_generate_angular.sh && \
chmod +x scripts/swagger_binaries_downloader.sh scripts/swagger_generate_angular.sh
```

## DOWNLOAD

All scripts are available also inside a zip file under [this url](https://singletonsd.gitlab.io/scripts/swagger/latest/scripts.zip). Or you can execute the following to download:

```bash
mkdir -p binaries && \
curl -o binaries/scripts.zip -L https://singletonsd.gitlab.io/scripts/swagger/latest/scripts.zip && \
cd binaries && unzip scripts.zip && mv src/* . && rm -r src && rm -r scripts.zip && cd ..
```

## GIT HOOK

You can setup shellcheck to be run before a commit. To do that just execute the following script under your git repository:

```bash
curl -s https://singletonsd.gitlab.io/scripts/common/latest/bash_script_test_hook_installer.sh | bash /dev/stdin
```

## STRUCTURE

Master branch is setup as latest folder. To use an specific version, put the version name before the file name like:

```url
https://singletonsd.gitlab.io/scripts/swagger/latest/bash_script_test_standalone.sh
https://singletonsd.gitlab.io/scripts/swagger/develop/bash_script_test_standalone.sh
https://singletonsd.gitlab.io/scripts/swagger/v0.0.2/bash_script_test_standalone.sh
```

## DOCUMENTATION

- [Shellcheck](https://github.com/koalaman/shellcheck).
- [Swagger Code Generator](https://github.com/swagger-api/swagger-codegen).
- [OpenApi Generator](https://github.com/OpenAPITools/openapi-generator).

## TODO

- [X] Fix documentation.
- [X] Add script to download test script from gitlab pages.
- [X] Zip all scripts and put inside pages.
- [ ] Create a docker image with all scripts inside.
- [ ] Improve generators. Add more information.

----------------------

© [Singleton SD](http://www.singletonsd.com), France, 2019.
