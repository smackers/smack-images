#!/bin/bash

ORG=smackers
IMAGES=images

for dockerfile in $(ls ${IMAGES})
do
	echo "building ${ORG}/${dockerfile/.*/}"
	docker build -f ${IMAGES}/${dockerfile} -t ${ORG}/${dockerfile/.*/} .
done
