
# Script prompts for Traefik public stack settings.

while true; do
    read -p "E-mail address for ACME challenge: " acme_email
    read -p "Traefik dashboard domain (something like traefik.example.com): " traefik_domain
    read -p "Traefik admin username: " traefik_user
    traefik_password_hash=$(openssl passwd -apr1)
    echo "Gathered settings:"
    echo "ACME_EMAIL=$acme_email"
    echo "TRAEFIK_DOMAIN=$traefik_domain"
    echo "TRAEFIK_USER=$traefik_user"
    echo "TRAEFIK_PASSHASH=$traefik_password_hash"
    read -r -p "Continue? [Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
      printf "ACME_EMAIL=$acme_email\nTRAEFIK_DOMAIN=$traefik_domain\nTRAEFIK_USER=$traefik_user\nTRAEFIK_PASSHASH=$traefik_password_hash" > .env
      echo "Saved to .env"
      break
      ;;
        [nN][oO]|[nN])
      echo "Aborting. New prompt begins..."
      ;;
        *)
      echo "Invalid input, aborting."
      exit 1
      ;;
    esac
done
