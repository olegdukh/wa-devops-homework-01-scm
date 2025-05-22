# Завдання№1
# Крок 1. Створив репозиторій на GitHub
https://github.com/new
Назва: wa-devops-homework-01-scm
Type: Public

# Крок 2. Налаштував репозиторій на локальній машині
#Створив локальну директорію
mkdir wa-devops-homework-01-scm && cd wa-devops-homework-01-scm

#Ініціалізував Git
git init

#Додав GitHub як remote
git remote add origin https://github.com/olegdukh/wa-devops-homework-01-scm.git

#Створив основну гілку
git checkout -b main

#Створив development-гілку
git checkout -b development

# Крок 3. Створив feature-гілку за правилами курсу
git checkout -b oleh_dukh/01_scm

# Крок 4. Додав Bash-скрипт setup_nginx.sh
Створив файл:
nano setup_nginx.sh
Вставив у нього:
#!/bin/bash
#Checking if Docker installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing..."
    sudo apt update && sudo apt install -y docker.io
fi

#Runnning NGINX
echo "Starting NGINX..."
docker run -d --name nginx-server -p 80:80 nginx

chmod +x setup_nginx.sh
git add setup_nginx.sh
git commit -m "Initial version: setup_nginx.sh with Docker NGINX launch"

# Крок 5. Додай коміти з покращеннями (імітація розвитку проєкту)
Додав логування
echo "docker logs nginx-server > nginx.log" >> setup_nginx.sh
git commit -am "Add log export to nginx.log"
Додав очищення
echo "docker stop nginx-server && docker rm nginx-server" >> setup_nginx.sh
git commit -am "Add cleanup logic to stop/remove NGINX container"

# Крок 6. Змерджив через development → main
#Змерджив feature → development
git checkout development
git merge --no-ff oleh_dukh/01_scm -m "Merge oleh_dukh/01_scm into development"

#Змерджив development → main
git checkout main
git merge --no-ff development -m "Merge development into main"

# Крок 7. Створив теги на важливі версії
git tag -a v1.0 -m "Initial setup script"
git tag -a v1.1 -m "Added logging"
git tag -a v1.2 -m "Added cleanup logic"
git tag -a v1.2 -m "Specify explicit NGINX version 1.25.3-alpine"

# Крок 8. Запушив все на GitHub
git push origin main
git push origin development
git push origin oleh_dukh/01_scm
git push origin --tags

# Завдання№2

# Крок 9. Завдання 2 — Markdown + Pull Request
Перейшов на гілку
git checkout oleh_dukh/01_scm
Додав markdown-файл code-review.md з контентом
git add code-review.md
git commit -m "Add code-review markdown file"
git push origin oleh_dukh/01_scm
