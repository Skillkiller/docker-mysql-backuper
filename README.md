# MySQL Backuper
## Funktion
Dieses Image verbindet sich zum MySQL Server und dumpt jede Datenbank in einzelne SQL-Dateien.

## Verwendung
Das Skript ist so ausgelegt das es von extern aus gestartet werden muss. Am einfachst geht das über einen Cronjob Eintrag auf dem Host System.  
Beispiel:
``50 2 * * *       /usr/local/bin/docker-compose -f /home/[user]/backup/docker-compose.yml up "mysql-backup"``

## Einrichtung
Es ist eine Beispiel [Docker-Compose](/docker-compose.yml) Datei im Repo vorhanden. Dort müssen nur die Anmelde Daten und das entsprechende Docker MySQL Netzwerk eingetragen werden.

### Einrichtung im Detail
1. Das Skript speichert alle Backups in den Container Pfad ``/backup/[Database Name]/[DateInfo].sql``. Daher muss dieser Pfad in ein Volume gepackt werden oder gemountet werden.  
2. Die Umgebungsvariablen ``MYSQL_HOST``, ``MYSQL_USERNAME`` und ``MYSQL_PASSWORD`` müssen gefüllt werden
3. Wenn der MySQL Server nicht von außerhalb erreichbar ist, muss der Backup Container ins Docker MySQL Netzwerk
