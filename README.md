# SchoolLink RDC

Plateforme scolaire multi-rôles avec API Node/TypeScript, PostgreSQL, Prisma, JWT et interface web minimale.

## Dépôt GitHub

Le contenu de ce dossier peut être placé directement à la racine d'un dépôt GitHub. Ne téléversez jamais `.env`; utilisez `.env.example` comme modèle.

## Démarrage local

1. Copier `.env.example` vers `.env`.
2. Définir une valeur longue et aléatoire pour `JWT_SECRET`.
3. Installer les dépendances : `npm install`.
4. Générer Prisma : `npm run db:generate`.
5. Créer/appliquer la base : `npm run db:migrate`.
6. Charger les données de démonstration : `npm run db:seed`.
7. Démarrer l'API : `npm run dev`.
8. Ouvrir `apps/web/index.html`.

Compte de démonstration créé par le seed : `admin@schoollink.cd` / `ChangeMe123!`. À remplacer avant toute utilisation réelle.

## Docker

Configurer `JWT_SECRET`, puis lancer :

```bash
docker compose up -d --build
```

API : `http://localhost:4000`

## API

- `GET /health`
- `POST /auth/login`
- `GET /me`
- `GET/POST /students`
- `GET /classes`
- `GET/POST /grades`
- `GET/POST /attendance`
- `GET /payments`

## Avant une vraie mise en production

Configurer HTTPS, secrets hors dépôt, migrations contrôlées, sauvegardes PostgreSQL, stockage de fichiers, rate limiting, observabilité, gestion des appareils, politique de conservation des données, notifications push et intégration d'un prestataire Mobile Money agréé.
