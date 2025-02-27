# Utilisation d'une image légère de Node.js
FROM node:18-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json pour installer les dépendances en premier
COPY package.json package-lock.json ./

# Installer les dépendances
RUN npm install

# Copier tout le reste du projet dans le conteneur
COPY . .

# Construire l’application Next.js
RUN npm run build

# Exposer le port 3000 pour l’application Next.js
EXPOSE 3000

# Lancer l’application Next.js
CMD ["npm", "start"]
