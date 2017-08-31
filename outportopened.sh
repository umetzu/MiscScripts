#!/bin/bash
for port in {1..65535}
do
	echo -ne "$port"\\r
	timeout 1 bash -c "echo > /dev/tcp/portquiz.net/$port" && echo "port $port is open" | tee -a ports2.md &
done