#!/bin/sh
pushd "$(dirname "$0")"

ARGS="  -D \
		--config config.yaml"

build() {
	hugo $ARGS -d ../docs
}

server() {
	hugo server $ARGS -p 58005 --bind 172.27.0.15 --baseURL localhost --disableFastRender
}

while getopts ':bs' P; do 
	case $P in
		b)
			build
		;;
		s)
			server
		;;
		?)
			echo "usage: `basename $0` [options]"
		;;
	esac
done

shift $(($OPTIND - 1))

popd
