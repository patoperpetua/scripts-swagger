#!/usr/bin/env bash

# Web Page of BASH best practices https://kvz.io/blog/2013/11/21/bash-best-practices/
#Exit when a command fails.
set -o errexit
#Exit when script tries to use undeclared variables.
set -o nounset
#The exit status of the last command that threw a non-zero exit code is returned.
set -o pipefail

#Trace what gets executed. Useful for debugging.
#set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename "${__file}" .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)"

echo "Script name: ${__base}"
echo "Executing at ${__root}"

if ! type "java" &> /dev/null; then
    echo "java is not installed. Install it and then re launch"
    exit 1
fi

if ! type "curl" &> /dev/null; then
    echo "curl is not installed. Install it and then re launch"
    exit 1
fi

if ! type "mvn" &> /dev/null; then
    echo "Maven is not installed. Install it and then re launch"
    exit 1
fi

if [ -f .env ]
then
    # shellcheck disable=SC2046
    export $(< .env sed 's/#.*//g' | xargs)
    # export $(grep -v '^#' .env | xargs)
fi

if [ -z "${SWAGGER_API_SPEC+x}" ]; then
    SWAGGER_API_SPEC="../../documentation/dist/openapi.yaml"
fi

if [ -z "${SWAGGER_GROUP+x}" ]; then
    SWAGGER_GROUP="com.singletonsd.apis"
fi

if [ -z "${SWAGGER_ARTIFACT+x}" ]; then
    SWAGGER_ARTIFACT="task"
fi

if [ -z "${SWAGGER_VERSION+x}" ]; then
    SWAGGER_VERSION="1.0.0"
fi

function usage(){
    echo "1 - swagger spec location."
    echo "2 - api version."
}

FOLDER=binaries
SWAGGER_NAME=swagger-codegen-cli.jar
SWAGGER_JAR=${FOLDER}/${SWAGGER_NAME}

# shellcheck disable=SC1090
source "${__dir}/swagger_binaries_downloader.sh"

SWAGGER_COMMAND="java -jar ${SWAGGER_JAR} generate -l java"

eval "${SWAGGER_COMMAND}" \
    -i "${SWAGGER_API_SPEC}" \
    --library=okhttp-gson \
	--model-package="${SWAGGER_GROUP}.${SWAGGER_ARTIFACT}.model" \
	--api-package="${SWAGGER_GROUP}.${SWAGGER_ARTIFACT}.calls" \
	--artifact-version=${SWAGGER_VERSION} --artifact-id="${SWAGGER_ARTIFACT}" \
	--group-id="${SWAGGER_GROUP}" \
	-DserializableModel=true,dateLibrary=legacy

mvn package
