# VELOCITY

> Une boutique de chaussures de performance. Ou plutôt, une copie assumée de Nike — mais en Rails.

---

## C'est quoi ?

VELOCITY est une application e-commerce de chaussures construite avec Ruby on Rails. Elle couvre le cycle complet : catalogue produits, panier session, et paiement via Stripe Checkout.

Le projet est né un soir par curiosité. Le design est *librement inspiré* de Nike.com. Les chaussures n'existent pas. Les stats affichées en page d'accueil (50K membres, 4.9 étoiles) sont inventées. Tout le reste fonctionne.

---

## Stack

| Couche | Technologie |
|---|---|
| Framework | Ruby on Rails 8.1 |
| Ruby | 3.4.2 |
| Base de données | SQLite 3 |
| CSS | Tailwind CSS (via CDN) |
| Paiement | Stripe Checkout |
| Serveur | Puma |
| Variables d'env | dotenv-rails |

---

## Fonctionnalités

- **Catalogue** — 24 produits répartis en 3 catégories (Running, Lifestyle, Basketball)
- **Catégories** — pages dédiées avec filtre produits (`/categories/:slug`)
- **Recherche** — barre de recherche dans la nav, filtre par nom de produit
- **Panier** — basé sur la session Rails, ajout / suppression, compteur dans la nav
- **Paiement** — intégration Stripe Checkout en mode test, redirection success/cancel
- **Pages statiques** — FAQ (accordéons), Contact (formulaire validé), À propos, Carrières

---

## Installation

### Prérequis

- Ruby 3.4+
- Bundler
- Un compte Stripe (gratuit, mode test suffisant)

### Setup

```bash
git clone <repo>
cd testkimi2

bundle install
bin/rails db:create db:migrate db:seed
```

### Variables d'environnement

Crée un fichier `.env` à la racine (déjà dans `.gitignore`) :

```env
STRIPE_SECRET_KEY=sk_test_...
STRIPE_PUBLISHABLE_KEY=pk_test_...
```

Récupère tes clés sur [dashboard.stripe.com/test/apikeys](https://dashboard.stripe.com/test/apikeys).

### Lancer le serveur

```bash
bin/rails server
```

Ouvre [http://localhost:3000](http://localhost:3000).

---

## Seed

Le seed crée 3 catégories et 24 produits :

- **8 Running** — Pegasus 40, Vaporfly 4, Alphafly 3, React Infinity, Zoom Tempo, Wildhorse 8, Free Run 5.0, Invincible 3
- **8 Lifestyle** — Force One Low, Max 95, Max 90, Max 270, Blazer Mid, Huarache OG, Cortez, Dunk Low
- **8 Basketball** — I High OG, III, IV Retro, VI Rings, XI Low, XIII, XXXVII, Tatum 3

Pour réinitialiser les données :

```bash
bin/rails db:seed
```

Le seed est idempotent pour les catégories (`find_or_create_by!`) et détruit/recrée les produits à chaque exécution.

---

## Routes principales

```
GET  /                        → Accueil
GET  /products                → Tous les produits (+ ?q= pour la recherche)
GET  /products/:id            → Fiche produit
GET  /categories/:slug        → Produits par catégorie
GET  /cart                    → Panier
POST /cart/items/:product_id  → Ajouter au panier
DEL  /cart/items/:product_id  → Retirer du panier
POST /checkout                → Créer une session Stripe
GET  /checkout/success        → Confirmation commande
GET  /checkout/cancel         → Paiement annulé
GET  /contact                 → Formulaire de contact
GET  /faq                     → Foire aux questions
GET  /about                   → À propos
GET  /careers                 → Carrières (spoiler : on embauche pas)
```

---

## Tester le paiement Stripe

1. Ajoute des produits au panier
2. Clique sur **Commander →**
3. Sur la page Stripe, utilise la carte de test : `4242 4242 4242 4242`
4. Date d'expiration : n'importe quelle date future — CVC : n'importe quoi
5. Tu es redirigé vers `/checkout/success`, le panier est vidé

---

## Structure des modèles

```
Category
  slug        string   (utilisé dans l'URL)
  name        string
  subtitle    string
  image_url   string
  has_many :products

Product
  name        string
  price       decimal
  old_price   decimal   (optionnel, affiche le prix barré)
  badge       string    (ex: "Nouveau", "Best-seller", "-20%")
  badge_color string    (classe Tailwind, ex: "bg-red-600")
  image_url   string
  colors      text      (classes Tailwind séparées par |)
  belongs_to :category
```

---

## À propos

VELOCITY est un projet d'apprentissage. Il n'y a pas de vraies chaussures, pas de stock, pas d'équipe. Juste du Rails, du Tailwind, et beaucoup d'aplomb.

Pour les détails, voir la page [/about](/about).
