#!/bin/bash
set +x
DIR=$(dirname $0)
IP="$1"
DNS="$IP.sslip.io"
for FILE in `grep --include=*.yml --include=*.yaml -rnw "$DIR" -e "sslip.io" -l`
do
    echo "🪄 Update $FILE"
    OLD_DNS=$(grep -e "sslip.io" $FILE | grep -v "link\.argocd\.argoproj\.io\/external-link:" | cut -d "." -f2-7 | cut -d "\`" -f1)
    if [[ "x$OLD_DNS" != "x" && "x$OLD_DNS" != "x$DNS" ]]
    then
        echo "$OLD_DNS -> $DNS"
        sed -i "s/$OLD_DNS/$DNS/g" $FILE
    fi
    LINK_DNS=$(grep $FILE -e "link\.argocd\.argoproj\.io\/external-link:.*sslip.io" | cut -d ":" -f2- | cut -d "." -f2-)
    if [[ "x$LINK_DNS" != "x" && "x$LINK_DNS" != "x$DNS" ]]
    then
        echo "$LINK_DNS -> $DNS"
        sed -i "s/$LINK_DNS/$DNS/g" $FILE
    fi
done