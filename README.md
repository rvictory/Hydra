#Hydra: Remote packet capture and transmission

Hydra is a system designed to make it easy to capture full packet captures from remote areas of a network and transmit those packet captures (in near real time) to another machine. Hydra makes use of OpenVPN and Daemonlogger to accomplish this task.

##Here's how Hydra works:
1. The receiver starts an OpenVPN server with certificate based authentication. Security tools (Bro, Suricata, etc.) are then set to listen on the "tap0" interface
2. Hydra Agents (the remote sensors) connect to the OpenVPN server
3. Hydra Agents redirect all traffic from one interface (can be a separate monitoring interface or can be the main system interface) to the tap0 interface (using Daemonlogger)
4. All traffic on the agent gets encrypted automatically and ends up on the other side ready for processing

What we are providing is a set of scripts/utilities designed to make this whole process simpler to setup and manage.