docker build -f .docker/Dockerfile -t croupier-app .
docker run --rm -p 80:80 croupier-app