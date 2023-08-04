# DEVELOPER DARKSEC


if [ "$5" == "" ]
then
        echo "------------------------------------------------------------------------------------------------------------|"
        echo "|MODO DE USO : bash $0 bancocn.com -W usr/share/dirb/darksec.txt -U darksec                                 |"
        echo "|HELP: -W WORDLISTS| -U User-agent para passar do firewall do waf (Web Aplication Firewall)                 |"
        echo "------------------------------------------------------------------------------------------------------------|"
exit
fi

echo "========================="
curl --head -s $1 -H "User-Agent: $5 " | grep "Server" | awk -F " " '{print "SERVIDOR ==> "$2}'
echo "========================="

for senha in $(cat $3);
do
resposta=$(curl -H "User-Agent: $5 " -s -o /dev/null -w "%{http_code}" $1/$senha/);

if [ $resposta == "200" ]
then
echo "DIRETORIO ENCONTRADO :" $1/$senha/
fi
done
