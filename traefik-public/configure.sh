
# Script prompts for Traefik public stack settings.

echo "This script will guide you through configuration process for Traefik public service."
echo "These are current settings:"
cat .env
echo
read -r -p "Overwrite? [Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
  read -p "E-mail address for ACME challenge: " acme_email
  read -p "Traefik dashboard domain (something like traefik.example.com): " traefik_domain
  read -p "Traefik admin username: " traefik_user
  traefik_password_hash=$(openssl passwd -apr1)
  read -r -p "Continue? [Y/n] " input
  case $input in
      [yY][eE][sS]|[yY])
    echo "" > .env
    echo "ACME_EMAIL=$acme_email" >> .env
    echo "TRAEFIK_DOMAIN=$traefik_domain" >> .env
    echo "TRAEFIK_USER=$traefik_user" >> .env
    echo "TRAEFIK_PASSHASH=$traefik_password_hash" >> .env
    exit 0
    ;;
      [nN][oO]|[nN])
    echo "Aborting. New prompt begins..."
    ;;
      *)
    echo "Invalid input, aborting."
    exit 1
    ;;
  esac
  ;;
    [nN][oO]|[nN])
  echo "Aborting."
  ;;
    *)
  echo "Invalid input, aborting."
  exit 1
  ;;
esac
