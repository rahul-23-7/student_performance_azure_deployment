## End to End MAchine Learning Project
Containerized ML Project can be deployed on any cloud.


## Run from terminal:

docker build -t testdockerrahul.azurecr.io/mltest:latest .

docker login testdockerrahul.azurecr.io

docker push testdockerrahul.azurecr.io/mltest:latest
