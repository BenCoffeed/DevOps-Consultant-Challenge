#This script is used to check the current external IP address of a node using DynDNS.org
#The file is exported to the default NGINX index.hgml file. 

outFile= "/usr/share/nginx/html/index.html" 
result="$(curl checkip.dyndns.org)"
stamp="$(date +"%Y-%m-%d_%H-%M-%S")"

echo $stamp "|" $result > $outFile

