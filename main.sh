#!/bin/bash
#omaeva, shindeiru

token(){
        GetToken=$(curl -s --compressed "https://cse.google.com/cse.js?cx=partner-pub-2698861478625135:3033704849" -L -D -)
        token=$(echo $GetToken | grep -Po "(?<=\"cse_token\": \")[^\"]*")
}
query1(){
        token
        key="partner-pub-2698861478625135:3033704849"
    query1=$(curl -s --compressed 'https://cse.google.com/cse/element/v1?num=10&hl=en&cx='''"${key}"'''&safe=off&cse_tok='''"${token}"'''&start='''"${2}"'''&q='''"${1}"'''&callback=x' -L -D - | grep -Po '(?<="unescapedUrl": ")[^"]*')
}
query2(){
        token
        key="partner-pub-2698861478625135:3033704849"
    query1=$(curl -s --compressed 'https://cse.google.com/cse/element/v1?num=10&hl=en&cx='''"${key}"'''&safe=off&cse_tok='''"${token}"'''&start='''"${2}"'''&q='''"${1}"'''&callback=x' -L -D - | grep -Po '(?<="unescapedUrl": ")[^"]*')
}
echo "=================="
echo "1. Single Dorking"
echo "2. Multi Dorking"
echo "=================="

read -p "[+]Root@GoogleCarver:~# " choice;

if [[ -z $choice ]]; then
        printf "\nNo Input. Exit now\n"
        exit 1
fi

if [[ $choice -eq 1 ]]; then
        read -p "URL Only: (y/n)? " filter;
        read -p "Dork: " dork;
        dorke=''"$dork"''
        eDork=$(echo $dork | sed -f urlencode)
        num=1;
        for pages in {0..1000..10}; do
                printf "\n====== Grabbing from Page $num ======\n"
                query1 $eDork $pages
                if [[ $query1 == '' ]]; then
                printf "No Links Found\n"
                break;
            else
                if [[ $filter == 'y' || $filter == 'Y' ]]; then
                        Url=$(echo $query1 | grep -Po 'http.?://([[:alnum:]_.-]+?\.){1,5}[[:alpha:].]{2,10}/')
                            echo ''"$Url"''
                            echo "$Url" >> result.tmp
                else
                            echo ''"$query1"''
                            echo "$query1" >> result.tmp
                        fi
            fi
            ((num++))
        done

elif [[ $choice -eq 2 ]]; then
        read -p "URL Only: (y/n)? " filter;
        read -p "Dork Files: " dork_file;
        if [[ ! -f $dork_file ]]; then
                echo "[404] File $dork_fileor not found. Please check your dork file name."
                exit 1;
        fi
        IFS=$'\r\n' GLOBIGNORE='*' command eval 'dorke=($(cat $dork_file))'
        for (( i = 0; i <"${#dorke[@]}"; i++ )); do
                baka=$(echo ${dorke[$i]} | sed -f urlencode)
                printf "\n[=] Searching Dork: ${dorke[$i]}\n"
                num=1;
                for pages in {0..1000..10}; do
                        printf "\n====== Grabbing from Page $num ======\n"
                        query2 $baka $pages
                        if [[ $query1 == '' ]]; then
                        printf "Not Links Found\n"
                        break;
                    else
                if [[ $filter == 'y' || $filter == 'Y' ]]; then
                        Url=$(echo $query1 | grep -Po 'http.?://([[:alnum:]_.-]+?\.){1,5}[[:alpha:].]{2,10}/')
                            echo ''"$Url"''
                            echo "$Url" >> result.tmp
                else
                            echo ''"$query1"''
                            echo "$query1" >> result.tmp
                        fi
                    fi
                    ((num++))
                done
        done
else
        printf "\nBad Input. Exit now\n"
fi
printf "\n\n[!] Filtering Result... \n"
time=$(date | sed 's/ /-/g')
cat result.tmp | sort -u | uniq >> Result-$(date --iso-8601=seconds).txt
printf "[+] All : $(cat Result-$(date --iso-8601=seconds).txt | wc -l) Sites\n"
