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
