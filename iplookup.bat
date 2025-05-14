#!/data/data/com.termux/files/usr/bin/bash

# Couleurs et titre (affichage basique pour Termux)
RED='\033[1;31m'
NC='\033[0m' # No Color

function menu() {
    clear
    echo -e "${RED}"
    echo " ██╗      ██████╗  ██████╗ ██╗  ██╗██╗   ██╗██████╗     ████████╗ ██████╗  ██████╗ ██╗     "
    echo " ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝██║   ██║██╔══██╗    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     "
    echo " ██║     ██║   ██║██║   ██║█████╔╝ ██║   ██║██████╔╝       ██║   ██║   ██║██║   ██║██║     "
    echo " ██║     ██║   ██║██║   ██║██╔═██╗ ██║   ██║██╔═══╝        ██║   ██║   ██║██║   ██║██║     "
    echo " ███████╗╚██████╔╝╚██████╔╝██║  ██╗╚██████╔╝██║            ██║   ╚██████╔╝╚██████╔╝███████╗"
    echo " ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝            ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝"
    echo "================================================="
    echo "1) Exit"
    echo "2) IP Geo Lookup"
    echo "3) Back to Main Menu"
    echo "================================================="
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1) exit ;;
        2) ip_geo_lookup ;;
        3) menu ;;
        *) menu ;;
    esac
}

function ip_geo_lookup() {
    clear
    echo "███████╗███╗   ██╗████████╗███████╗██████╗     ██╗██████╗ "
    echo "██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    ██║██╔══██╗"
    echo "█████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝    ██║██████╔╝"
    echo "██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    ██║██╔═══╝ "
    echo "███████╗██║ ╚████║   ██║   ███████╗██║  ██║    ██║██║     "
    echo "╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝     "
    echo "==================================================="
    echo -n "Enter an IP address (or type 'back' to return): "
    read ip

    if [[ "$ip" == "back" ]]; then
        menu
    fi

    curl -s "https://ipinfo.io/${ip}/json" -o geolocation.json

    echo "=================================="
    echo "IP Geolocation for $ip:"
    cat geolocation.json
    rm -f geolocation.json
    echo "=================================="
    read -p "Press Enter to continue..."
    ip_geo_lookup
}

# Lancement du menu
menu