#!/data/data/com.termux/files/usr/bin/bash

# Couleurs
RED='\033[1;31m'
NC='\033[0m'

function menu() {
    clear
    echo -e "${RED}"
    echo "Скрыть личную жизнь не так просто."
    echo "================================================="
    echo "1) Quitter"
    echo "2) IP Geo Lookup"
    echo "3) Retour au menu principal"
    echo "================================================="
    echo -n "Fais ton choix: "
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
    echo -e "${RED}"
    echo "=========== LOCALISATION IP =========="
    echo -n "Entre une adresse IP (ou 'back' pour revenir) : "
    read ip

    if [[ "$ip" == "back" ]]; then
        menu
    fi

    echo "=================================="
    echo "Résultat de géolocalisation pour $ip :"
    echo

    # Appel API + extraction des champs utiles
    curl -s "https://ipinfo.io/${ip}/json" | jq -r '
        "IP: \(.ip)",
        "Ville: \(.city)",
        "Région: \(.region)",
        "Pays: \(.country)",
        "Fournisseur: \(.org)",
        "Code Postal: \(.postal)",
        "Localisation GPS: \(.loc)"
    '

    echo
    echo "=================================="
    read -p "Appuie sur Entrée pour continuer..."
    ip_geo_lookup
}

# Démarrer le menu
menu