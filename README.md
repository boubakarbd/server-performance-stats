# Server Stats Script

Ce script Bash permet de surveiller les performances d'un serveur Linux en affichant des statistiques clés telles que l'utilisation du CPU, de la mémoire, du disque, ainsi que les processus les plus gourmands en ressources.

## Fonctionnalités

- **CPU Usage** : Affiche le pourcentage d'utilisation du CPU.
- **Memory Usage** : Affiche la mémoire totale, utilisée et libre en Go, ainsi que les pourcentages correspondants.
- **Disk Usage** : Affiche l'utilisation du disque pour la partition racine (`/`), y compris l'espace total, utilisé et libre.
- **Top 5 Processes** : Liste les 5 processus les plus gourmands en CPU et en mémoire.

## Technologies utilisées

- **Langage** : Bash
- **Outils Linux** : `mpstat`, `free`, `df`, `ps`, `awk`, `sed`

## Prérequis

- Un système d'exploitation Linux.
- Les outils suivants doivent être installés :
  - `mpstat` (disponible via le paquet `sysstat`).
  - `awk`, `sed`, `free`, `df`, `ps` (généralement préinstallés sur la plupart des distributions Linux).


## Installation

1. Download or clone the repository:
   ```bash
   git clone https://github.com/boubakarbd/server-performance-stats.git
   cd server-stats
   ```

2. Make the script executable:
   ```bash
   chmod +x server-stats.sh
   ```

3. Run the script:
   ```bash
   ./server-stats.sh
   ```
