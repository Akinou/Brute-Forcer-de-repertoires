#!/bin/bash
read -p "Entrez l'URL : " url
read -p "Entrez la liste de mots : " wordlist
while read -r line; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url/$line")
    if [ $response == 200 ]; then
        echo "Trouvé : $url/$line"
    fi
done < "$wordlist"
