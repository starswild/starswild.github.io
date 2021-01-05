#!/bin/sh
BASE="$(dirname "$0")"
pushd $BASE

ARGS="  -D \
		--config config.yaml"

build() {
	hugo $ARGS -d ../docs
}

server() {
	hugo server $ARGS -p 58005 --bind 172.27.0.15 --baseURL localhost --disableFastRender
}

commit() {
	pushd $BASE/..
	git add .
	git commit -m "$(date +%Y-%m-%d\ %H:%M:%S)"
	#git push origin main
	popd
}


while getopts ':bsc' P; do 
	case $P in
		b)
			build
		;;
		s)
			server
		;;
		c)
			commit
		;;
		?)
			echo "usage: `basename $0` [options]"
		;;
	esac
done

shift $(($OPTIND - 1))

popd
