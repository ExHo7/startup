# Startup Script 🚀
=====================

C'est un script de démarrage qui fonctionne sur Linux. Il peut être utilisé dans votre fichier bashrc pour s'exécuté au lancement du terminal

### Installation

1. Ouvrez votre terminal et accédez à la racine du projet.
2. Exécutez le script `chmod +x startup.sh` pour rendre celui-ci exécutable.
3. Configurez le fichier `.config.cfg` avec votre clé API newsapi et votre ville.

### Fonctions

*   `show_date()`: Affiche la date actuelle.
*   `show_weather()`: Affiche la météo avec wttr.in.
*   `check_internet_connection()`: Vérifie si vous êtes connecté à Internet.
*   `show_security_logs()`: Affiche les derniers messages de sécurité.
*   `config.cfg`: Vérifie l'état de certaines conditions.

### Exemples d'utilisation

```bash
./startup.sh
