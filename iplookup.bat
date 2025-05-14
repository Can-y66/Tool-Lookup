import requests
import os

def clear():
    os.system('cls' if os.name == 'nt' else 'clear')

def main_menu():
    while True:
        clear()
        print("""
 ██╗      ██████╗  ██████╗ ██╗  ██╗██╗   ██╗██████╗     ████████╗ ██████╗  ██████╗ ██╗     
 ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝██║   ██║██╔══██╗    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     
 ██║     ██║   ██║██║   ██║█████╔╝ ██║   ██║██████╔╝       ██║   ██║   ██║██║   ██║██║     
 ██║     ██║   ██║██║   ██║██╔═██╗ ██║   ██║██╔═══╝        ██║   ██║   ██║██║   ██║██║     
 ███████╗╚██████╔╝╚██████╔╝██║  ██╗╚██████╔╝██║            ██║   ╚██████╔╝╚██████╔╝███████╗
 ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝            ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
=================================================
1) Quitter
2) IP Geo Lookup
3) Retour au menu principal
=================================================
""")
        choice = input("Entrez votre choix : ").strip()
        if choice == "1":
            break
        elif choice == "2":
            ip_geo_lookup()
        elif choice == "3":
            continue

def ip_geo_lookup():
    while True:
        clear()
        print("""
███████╗███╗   ██╗████████╗███████╗██████╗     ██╗██████╗ 
██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    ██║██╔══██╗
█████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝    ██║██████╔╝
██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    ██║██╔═══╝ 
███████╗██║ ╚████║   ██║   ███████╗██║  ██║    ██║██║     
╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝     
=================================================
""")
        ip = input("Entrez une adresse IP (ou tapez 'back' pour revenir) : ").strip()
        if ip.lower() == "back":
            break

        response = requests.get(f"https://ipinfo.io/{ip}/json")
        if response.status_code == 200:
            data = response.json()
            print("\n=========== Résultats ===========")
            for key in ['ip', 'city', 'region', 'country', 'loc', 'org', 'postal']:
                if key in data:
                    print(f"{key.capitalize()} : {data[key]}")
            print("=================================")
        else:
            print("Erreur lors de la requête.")

        input("\nAppuyez sur Entrée pour continuer...")

if __name__ == "__main__":
    main_menu()