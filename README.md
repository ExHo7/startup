Startup Script README
Welcome to the Startup Script documentation! This script is designed to provide system administrators and users with an interactive overview of their server's status, including date, weather, system resources usage, battery status, Docker service and container checks, security logs, internet connectivity, and top headlines.

Features
Show Date: Displays the current date in a formatted manner.
Check Internet Connection: Verifies if the server is connected to the internet by pinging Google's primary DNS server.
Docker Service Check: Ensures that Docker is running on the system.
Dperson Torproxy Container Check: Validates if the dperson/torproxy container is up and running.
Battery Status: Displays the current battery percentage if available.
System Resources Usage: Shows CPU usage, memory usage, and disk space information.
Weather Information: Retrieves the weather forecast for a specified city using wttr.in API.
Top Headlines: Fetches top headlines from newsapi.org based on the user's country preference.
Installation
Clone this repository or download the script file (startup.sh) to your local machine.
Make sure you have curl and docker installed on your server.
Update permissions for the script by running: chmod +x startup.sh.
Execute the script using: ./startup.sh.
Usage
To use this script, simply run it with ./startup.sh. The script will display all the information mentioned above in a colorful and organized manner.

Screenshot
Below is an example of how the script's output may look:

📅 Date du jour : Mercredi 12 Avril 2023
⚠️ Batterie non détectée.
💻 Utilisation actuelle des ressources système :
CPU: 2.5%
Mémoire : 1.9Gi / 7.8Gi
Espace disque : 89.4G / 500G
🔋 État de la batterie : 95%
Météo actuelle :
Température : 18°C
Humidité : 65%
Vent : Sud-Ouest
Docker est en cours d'exécution.
Le conteneur tor-proxy est en cours d'exécution.
Déconnecté de Internet.
Dernières nouvelles :
- Titre 1
- Titre 2
- ...

Contributing
We welcome contributions to improve this script! If you find any issues or have suggestions for new features, please open an issue or submit a pull request.

License
This project is licensed under the MIT License. Please see the LICENSE file for more information.

Feel free to customize and enhance your startup experience with this versatile script! Enjoy managing your server like never before.
