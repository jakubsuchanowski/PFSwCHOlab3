## Build image
```
>docker build --ssh default=c:/users/kubas/.ssh/id_rsa -t lab3.v3 -f Dockerfile .
```

## Run container 
```
>docker run -d --rm -p 8080:8080 --name lab3 lab3.v3
```

## Add Image on dockerhub
```
>docker tag lab3.v3 kubynovv/lab3.v3:version3
>docker push kubynovv/lab3.v3:version3 
```
