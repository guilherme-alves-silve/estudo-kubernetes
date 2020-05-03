#!/bin/bash

for i in {1..5}; do
	{
	for i in {1..10000}; do
		curl http://13.0.0.2:30500 > teste.txt
		curl http://13.0.0.2:31000 > teste.txt
		sleep $1
	done
	}&
done