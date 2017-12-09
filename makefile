name=mongo-dk1
image=mongo
host_dir=$(shell pwd)
vol1=${host_dir}/volume
mnt1=/data/db
vol2=${host_dir}/shared
mnt2=/shared
pl1=27017
pd1=27017



create:
	docker run -d -it --name ${name} \
	-v ${vol1}:${mnt1} \
	-v ${vol2}:${mnt2} \
	-p ${pl1}:${pd1} \
	${image}

create_auth:
	docker run -d -it --name ${name} \
	-v ${vol1}:${mnt1} \
	-v ${vol2}:${mnt2} \
	-p ${pl1}:${pd1} \
	${image} \
	--auth

bash:
	docker exec -it ${name} /bin/bash

connect:
	docker exec -it ${name} mongo

stop:
	docker stop ${name}

start:
	docker start ${name}

restart: stop start

delete:
	docker rm ${name}





