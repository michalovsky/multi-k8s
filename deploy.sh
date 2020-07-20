docker build -t michalovsky/multi-client:latest -t michalovsky/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t michalovsky/multi-server:latest -t michalovsky/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t michalovsky/multi-worker:latest -t michalovsky/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push michalovsky/multi-client:latest
docker push michalovsky/multi-server:latest
docker push michalovsky/multi-worker:latest

docker push michalovsky/multi-client:$SHA
docker push michalovsky/multi-server:$SHA
docker push michalovsky/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=michalovsky/multi-client:$SHA
kubectl set image deployments/server-deployment server=michalovsky/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=michalovsky/multi-worker:$SHA
