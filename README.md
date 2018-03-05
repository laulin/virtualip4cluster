# virtualip4cluster

Create a virtual IP on cluster (high availability)

## Description

The playbook push all needed files on cluster nodes and build a docker. The container
runs a ucarp instance *via* supervisor.

## Missing features

The virtual ip is not a service and will not start at the reboot.