
function check_prereq() {
    COMMAND=$1
    which $COMMAND >/dev/null 2>&1 || export EXIT_CODE=$? && true
    if [ ${EXIT_CODE:-0} -ne 0 ]; then
        eerror "You need to install ${COMMAND}"
        usage
    fi
}

function validate_conf_file() {
    set +o nounset
    if [ -z $1 ]; then
        eerror "Please provide a valid variable file"
        usage
    fi
    set -o nounset
    CONF_FILE=$1
    if [ -f ${CONF_FILE} ]; then
        set -o allexport
        source ${CONF_FILE}
        set +o allexport
    else
        eerror "Please provide a valid variable file"
        usage
    fi

    if [ -z ${short_tier[${ENVIRONMENT}]:+x} ]; then
        eerror "Please provide a valid deployment environment: eng, dve, nonp, prod "
        usage
    fi
}

function validate_k8s_name() {
    NAME=$1
    if ! echo "${NAME}" | grep -E -q '^[a-z0-9]([-a-z0-9]*[a-z0-9])?$'; then
        eerror "Invalid NAME \"${NAME}\": name must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"
        exit 1
    fi
}
