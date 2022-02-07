#! /bin/bash

echo '
  _                      __   __           ___  __  
/__`  |\/|  /\  |       /  ` |__) |  |\/| |__  /__` 
.__/  |  | /~~\ |___    \__, |  \ |  |  | |___ .__/ 
                                                    '


if [[ -z $1 ]] || [[ $1 == "help" ]]; then

    echo '
Usage:
    words - keyword for showing wordlists. 
                Available flags: content, api, params, dns, fuzz, xss, sqli, lfi

    ffuf  - keyword for showing ffuf command exmaples. 

    https - keyword for showing httpx command exmaples.

    help - show this message.        
'

fi

# Constants
home_recon=$(echo $HOME)/hunt/recon


## web content
seclists_web_content="$home_recon/wrds/SecLists/Discovery/Web-Content/"
web_content_1="$home_recon/wrds/content_lists/"
web_content_2="$home_recon/wrds/Wordlists/directory_scanner/"

### api
seclists_api="$home/wrds/SecLists/Discovery/Web-Content/api/"

### parameters 
seclists_params="$home/wrds/SecLists/Discovery/Web-Content/BurpSuite-ParamMiner/"


## DNS
seclists_dns="$home_recon/wrds/SecLists/Discovery/DNS/"
dns_lists_1="$home_recon/wrds/dns_lists"


## Fuzzing
seclists_fuzzing="$home_recon/wrds/SecLists/Fuzzing/"

### XSS
seclists_xss="$home_recon/wrds/SecLists/Fuzzing/XSS/"
polyglot_xss=`ls $home_recon/wrds/SecLists/Fuzzing/Polyglots/XSS-*`

### SQLi
seclists_sqli="$home_recon/wrds/SecLists/Fuzzing/SQLi/"
polyglot_sqli=`ls $home_recon/wrds/SecLists/Fuzzing/Polyglots/SQLi-*`

### LFI
seclists_lfi="$home_recon/wrds/SecLists/Fuzzing/LFI/"



# wordlists keyword
if [[ $1 == "words" ]]; then

    if [[  -z $2 ]]; then
        echo -e '\033[1mFlag is required!\033[0m'
    fi

    if [[ $2 == "content" ]]; then

        echo -e '\033[1mSecLists Web-Content Lists\033[0m'

        for entry in "$seclists_web_content"*
        do
            echo "$entry"
        done

        echo ""


        echo -e '\033[1mOther Content Discovery Lists 1\033[0m'

        for entry in "$web_content_1"*
        do
            echo "$entry"
        done

        echo ""


        echo -e '\033[1mOther Content Discovery Lists 2\033[0m'

                for entry in "$web_content_2"*
        do
            echo "$entry"
        done

        echo ""


    fi

    # api wordlists
    if [[ $2 == "api" ]]; then

        echo -e '\033[1mSecLists API Lists\033[0m'

        for entry in "$seclists_api"*
        do
            echo "$entry"
        done

        echo ""

    fi 

    # params wordlists
    if [[ $2 == "params" ]]; then

        echo -e '\033[1mSecLists Parameters Lists\033[0m'

        for entry in "$seclists_params"*
        do
            echo "$entry"
        done

        echo ""
    fi     

    # dns wordlists
    if [[ $2 == "dns" ]]; then


        echo -e '\033[1mSecLists DNS Lists\033[0m'

        for entry in "$seclists_dns"*
        do
            echo "$entry"
        done

        echo ""


        echo -e '\033[1m DNS Lists\033[0m'

        for entry in "$dns_lists_1"*
        do
            echo "$entry"
        done

        echo ""


    fi

    # fuzzing wordlists
    if [[ $2 == "fuzz" ]]; then


        echo -e '\033[1mSecLists Fuzzing Lists\033[0m'

        for entry in "$seclists_fuzzing"*
        do
            echo "$entry"
        done

        echo ""


    fi

    # xss wordlists
    if [[ $2 == "xss" ]]; then


        echo -e '\033[1mSecLists XSS Lists\033[0m'

        for entry in "$seclists_xss"*
        do
            echo "$entry"
        done

        echo ""


        echo -e '\033[1mPolyglot XSS Lists\033[0m'

        for eachfile in "$polyglot_xss"
        do
            echo "$eachfile"
        done

        echo ""


    fi

    # sqli wordlists
    if [[ $2 == "sqli" ]]; then


        echo -e '\033[1mSecLists SQLi Lists\033[0m'

        for entry in "$seclists_xss"*
        do
            echo "$entry"
        done

        echo ""


        echo -e '\033[1mPolyglot SQLI Lists\033[0m'

        for eachfile in "$polyglot_xss"
        do
            echo "$eachfile"
        done

        echo ""


    fi

    # lfi wordlists
    if [[ $2 == "lfi" ]]; then


        echo -e '\033[1mSecLists LFI Lists\033[0m'

        for entry in "$seclists_lfi"*
        do
            echo "$entry"
        done

        echo ""

    fi    

fi


# ffuf keyword
if [[ $1 == "ffuf" ]]; then


    echo -e '\033[1mFiles and Dirs Discovery Example Command\033[0m'
    echo "ffuf -w ${seclists_web_content} -e .php,.html,.sql,.bak,.old,.txt,.zip -c -v -r -u http://ffuf.me/FUZZ"
    echo ""

    echo -e '\033[1mVHost Discovery Example Command\033[0m'
    echo "ffuf -w ${seclists_dns} -H "Host: FUZZ.ffuf.me" -u http://ffuf.me"
    echo ""

    echo -e '\033[1mFuzzing Multiple Locations\033[0m'
    echo "ffuf -u https://W2/W1 -w ./wordlist.txt:W1,./domains.txt:W2"
    echo ""

    echo -e '\033[1mGET Parameters Discovery Example Command \033[0m'
    echo "ffuf -w ${seclists_params} -u http://ffuf.me/cd/param/data?FUZZ=1"    
    echo ""

    echo -e '\033[1mPOST Parameters Discovery Example Command \033[0m'
    echo "ffuf -w /path/to/postdata.txt -X POST -d 'username=admin\&password=FUZZ' -u https://target/login.php"
    echo ""
    
fi


# httpx keyword
if [[ $1 == "httxp" ]]; then

    echo -e '\033[1mhttpx Full Scan Examlpe Command \033[0m'
    echo "httpx -l domains.txt -vhost -http2 -pipeline -title -content-length -status-code -follow-redirects -tls-probe -content-type -location -csp-probe -web-server -stats -ip -cname -cdn -ports 80,81,300,443,591,593,832,981,1010,1311,2082,2087,2095,2096,2480,3000,3128,3333,4243,4567,4711,4712,4993,5000,5104,5108,5800,6543,7000,7396,7474,8000,8001,8008,8014,8042,8069,8080,8081,8088,8090,8091,8118,8123,8172,8222,8243,8280,8281,8333,8443,8500,8834,8880,8888,8983,9000,9043,9060,9080,9090,9091,9200,9443,9800,9981,12443,16080,18091,18092,20720,28017 -threads 300 -o httpx.out"
    echo ""

fi