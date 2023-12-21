# edp-2023-recursado-tp

## generador

```
$ cd 01-generador/
$ docker build -t generador .
$ docker run -v $(pwd)/outputs_docker:/app/outputs generador
```

## usuario

```
$ cd 02-usuario/
$ docker build -t usuario .
$ docker run -v $(pwd)/outputs_docker:/app/outputs -it usuario

```
