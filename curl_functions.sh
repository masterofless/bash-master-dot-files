function wait_for_http() {
    url=$1
    desc=${2:-"server"}
    echo "INFO: waiting for $desc at ${url}"
    let count=0
    until $(curl -m 5 --output /dev/null --silent --head --fail ${url}); do
        let count=count+1
        if ((count >= 6)); then
            echo "ERROR: Timeout waiting for ${url}"
            exit -1
        fi
        printf '.'
        sleep 5
    done
    echo ""
    echo "INFO: ${url} is alive"
}

function wait_for_elastic () {
#   ELASTIC_HOST=${ELASTIC_HOST:-elastic}
#   ELASTIC_PORT=${ELASTIC_PORT:-9200}
    ELASTIC_HOSTPORT=http://${ELASTIC_HOSTPORT:-${ELASTIC_HOST}:${ELASTIC_PORT}}

    wait_for_http $ELASTIC_HOSTPORT "Elastic"

}

function wait_for_wordpress () {
#   WORDPRESS_HOST=${WORDPRESS_HOST:-wordpress}
#   WORDPRESS_PORT=${WORDPRESS_PORT:-80}
    WORDPRESS_HOSTPORT=http://${WORDPRESS_HOSTPORT:-${WORDPRESS_HOST}:${WORDPRESS_PORT}}

    wait_for_http $WORDPRESS_HOSTPORT "Wordpress"
}
