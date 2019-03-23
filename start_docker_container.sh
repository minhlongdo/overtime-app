#!/bin/bash

docker run --name test-mysql -e MYSQL_ROOT_PASSWORD=mylovelyhorse -e MYSQL_DATABASE=test -p 3307:3306 -d mysql:5.7.25
