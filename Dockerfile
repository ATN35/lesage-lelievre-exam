# Utilisation d'une image légère de Node.js
FROM node:18-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier uniquement package.json et package-lock.json pour optimiser la mise en cache des dépendances
COPY package.json package-lock.json ./

# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de l'application
COPY . .

# Exposer le port 3000 pour Next.js
EXPOSE 3000

# Lancer Next.js en mode développement
CMD ["npm", "run", "dev"]
