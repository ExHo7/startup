#!/bin/bash

# Définition des codes de couleur
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # Réinitialise la couleur

# Affiche la date du jour
function show_date() {
    echo -e "${YELLOW}📅 Date du jour : $(date +"%A %d %B %Y")${NC}"
}

# Affiche la météo avec wttr.in
function show_weather() {
    local city="Perpignan" # Remplacez par la ville souhaitée
    echo -e "${BLUE}Météo actuelle :${NC}"
    curl -s "wttr.in/$city?format=3"  
}
# Check de la taille des logs
function check_log_sizes() {
    echo -e "${BLUE}Vérification de la taille des fichiers journaux...${NC}"
    for log_file in /var/log/*.log; do
        if [ -f "$log_file" ]; then
            file_size=$(du -h "$log_file" | awk '{print $1}')
            echo -e "${YELLOW}$log_file : $file_size${NC}"
        fi
    done
}

# Affiche l'état de la batterie
function check_battery() {
    if [ -f /sys/class/power_supply/BAT0/capacity ]; then
        local capacity=$(cat /sys/class/power_supply/BAT0/capacity)
        echo -e "${YELLOW}🔋 État de la batterie : ${capacity}%${NC}"
    else
        echo -e "${YELLOW}⚠️ Batterie non détectée.${NC}"
    fi
}

# Affiche l'utilisation actuelle des ressources système
function show_system_usage() {
    echo -e "${BLUE}💻 Utilisation actuelle des ressources système :${NC}"
    echo "CPU : $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')"
    echo "Mémoire : $(free -h | awk '/Mem:/ {print $3 "/" $2}')"
    echo "Espace disque : $(df -h / | awk 'NR==2 {print $3 " / " $2}')"
}

# Vérification si le service Docker est en cours d'exécution
function check_docker_service() {
    if systemctl is-active --quiet docker; then
        echo -e "${GREEN}Docker est en cours d'exécution.${NC}"
    else
        echo -e "${RED}Docker n'est pas en cours d'exécution.${NC}"
        exit 1
    fi
}

# Vérification si le conteneur dperson/torproxy est en cours d'exécution
function check_dperson_torproxy_container() {
    if docker ps -a --format '{{.Names}}' | grep -q 'tor-proxy'; then
        echo -e "${GREEN}Le conteneur tor-proxy est en cours d'exécution.${NC}"
    else
        echo -e "${RED}Le conteneur tor-proxy n'est pas en cours d'exécution.${NC}"
        exit 1
    fi
}

# Vérification des dépendances
if ! command -v curl &> /dev/null; then
    echo "Erreur : curl n'est pas installé. Veuillez installer curl."
    exit 1
fi

if ! command -v docker &> /dev/null; then
    echo "Erreur : Docker n'est pas installé. Veuillez installer Docker."
    exit 1
fi

# Affiche les derniers messages de sécurité
function show_security_logs() {
    echo -e "${BLUE}Derniers messages de sécurité :${NC}"
    journalctl -u systemd-journald -f | grep 'SECURITY'
}

# Vérifie l'état de la connexion internet
function check_internet_connection() {
    if ping -c 1 google.com &> /dev/null; then
        echo -e "${GREEN}Connecté à Internet.${NC}"
    else
        echo -e "${RED}Déconnecté de Internet.${NC}"
    fi
}

# Affiche les dernières actualités du jour (avec newsapi.org)
function show_news() {
    local api_key="3848876c69294de88de94e1b774c78ef" # Remplacez par votre clé API
    local country="us" # Pays pour les nouvelles
    echo -e "${BLUE}Dernières nouvelles :${NC}"
    curl -s "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$api_key" | jq '.articles[].title'
}


# Exécution des fonctions
show_date
check_internet_connection
check_docker_service
check_dperson_torproxy_container
check_battery
# check_log_sizes
show_system_usage
show_weather
show_news
# show_security_logs

