#!/bin/bash

echo "openshift client, docker and remote-viewer must be installed to use this script."


route=$(oc get route spice --template '{{.spec.host}}')
sudo docker run -d --name spice-proxy-client --net=host jpillora/chisel client ${route} 5900:127.0.0.1:5900

(sudo docker logs -f spice-proxy-client & ) | grep -q "Connected"

PID=`ps -ef | grep "sudo docker logs" | grep -v 'grep' | awk '{print $2}'`
sudo kill -9 ${PID}

remote-viewer spice://127.0.0.1:5900

sudo docker rm -f spice-proxy-client
