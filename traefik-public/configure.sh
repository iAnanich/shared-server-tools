
# Script prompts for Traefik public stack settings.

read -p "E-mail address for ACME challenge: " acme_email

read -p "Traefik dashboard domain (something like traefik.example.com): " traefik_domain

read -p "Traefik admin username: " traefik_user

#echo "Traefik admin password asked next. (better remember it)"
traefik_password_hash=$(openssl passwd -apr1)

TRAEFIK_USER=$traefik_user \
TRAEFIK_PASSHASH=$traefik_password_hash \
TRAEFIK_DOMAIN=$traefik_domain \
ACME_EMAIL=$acme_email \
docker-compose -f docker-swarm.template.yml config > docker-swarm.yml
