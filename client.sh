#!/bin/bash

echo "openshift client, docker and remote-viewer must be installed to use this script."


route=$(oc get route spice --template '{{.spec.host}}')
sudo docker run -d --net=host jpillora/chisel client ${route} 5900:127.0.0.1:5900
remote-viewer spice://127.0.0.1:5900
