docker build -t michalovsky/multi-client -f ./client/Dockerfile ./client
docker build -t michalovsky/multi-server -f ./server/Dockerfile ./server
docker build -t michalovsky/multi-worker -f ./worker/Dockerfile ./worker
docker push michalovsky/multi-client
docker push michalovsky/multi-server
docker push michalovsky/multi-worker
