rmi: stop-test
	docker rmi limaofeng/sinopia 2>&1 > /dev/null

build:
	docker build -t limaofeng/sinopia:latest .

start-test: stop-test build
	docker run -p 4873:4873 --name sinopia-test -v /home/docker/sinopia-test:/opt/sinopia/storage limaofeng/sinopia:latest
	docker logs sinopia-test

stop-test:
	-docker rm -f sinopia-test 2>&1 > /dev/null

test: build
	docker run --rm -i -t limaofeng/sinopia:latest

shell: build
	docker run --rm -i -t limaofeng/sinopia:latest /bin/bash

logs:
	docker logs sinopia-test

publish:
	docker push limaofeng/sinopia:latest

test: start-test
