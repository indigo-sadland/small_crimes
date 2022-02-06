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
                Available: content, api, params, dns, fuzz, xss, sqli, lfi

    ffuf  - keyword for showing ffuf command exmaples. 
                Availabe: discovery

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



# web-content wordlists keyword
if [[ $1 == "words" ]]; then

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


# ffuf
if [[ $1 == "ffuf" ]]; then

    if [[ $2 == "discovery" ]]; then
        echo -e '\033[1mFiles and Dirs Discovery example command\033[0m'
        echo "ffuf -w ${seclists_web_content} -e .php,.html,.sql,.bak,.old,.txt,.zip -c -v -r -u /FUZZ"

    fi

 #   if [[ $2 == ]]; tnen

  #  fi    
    
fi