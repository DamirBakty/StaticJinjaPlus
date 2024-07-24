# Докеризиратор генератора статических сайтов

Пример порта, набор докерфайлов которые позволяют взять исходники из другого репозитория и собрать из них докер-образы, запушить на докер-хаб.
В проекте как пример был взят следущий [репозиторий](https://github.com/MrDave/StaticJinjaPlus)

### Как установить

Для работы нужен docker, можете установить по [ссылке](https://docs.docker.com/engine/install/)

## Как собрать образы
### После установки докера, нужны слеующие данные для сбора контейнеров:
* tag - тэг контейнера локального компьютера
* python-slim-version - версия образа python-slim из dockerhub
* ubuntu-version - версия образа python-slim из dockerhub
* staticjinja_plus_version - версия тэга из репозитория
* staticjinja_plus_branch - название ветки репозитория


Dockerfile для использования версии из веток репозитория в директории branch:

* python-slim.dockerfile - для использования python-slim в качестве образа

```
docker build -f python-slim.dockerfile -t ${tag} --build-arg packet_version=${python-slim-version} --build-arg=${staticjinja_plus_branch}  .
```

* ubuntu.dockerfile - для использования ubuntu в качестве образа
```
docker build -f ubuntu.dockerfile -t ${tag} --build-arg packet_version=${ubuntu-version} --build-arg=${staticjinja_plus_branch} .
```

Dockerfile для использования версии из тэгов репозитория в директории tags:

* python-slim.dockerfile - для использования python-slim в качестве образа
```
docker build -f python-slim.dockerfile -t ${tag} --build-arg packet_version=${python-slim-version} --build-arg=${staticjinja_plus_version}  .
```

* ubuntu.dockerfile - для использования ubuntu в качестве образа
```
docker build -f ubuntu.dockerfile -t ${tag} --build-arg packet_version=${ubuntu-version} --build-arg=${staticjinja_plus_version} .
```

## Как запустить контейнеры
### После сбора контейнеров, для запуска контейнеров нужны слудующие данные:
* templates_path - путь где лежат .html файлы для рендеринга
* tag - тэг контейнера локального компьютера
* packet_version - версия пакета из репозитория

```
docker run -v ${path}:/StaticJinjaPlus-${packet_version}  ${tag}
```

## Как запушить контейнеры в Dockerhub
### После успешных тестов контейнеров, нужны следующие данные:
* tag - тэг контейнера локального компьютера
* username - юзернейм из [dockerhub](https://hub.docker.com/)

### Подготовка тэга для dockerhub
```
docker tag ${tag} ${username}/${tag}
```
### Запушить контейнер в dockerhub
```
docker push ${username}/${tag}
```