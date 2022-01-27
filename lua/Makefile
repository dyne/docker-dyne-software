
all:
	@curl -sL https://api.github.com/repos/dyne/lua-zenroom/git/refs/heads \
	  | awk '/sha/ { print $2 }' | xargs | cut -d, -f1 | tee > lua-zenroom.head
	docker build --build-arg centos=8 -f Dockerfile.tarantool -t dyne/tarantool:centos8 .
