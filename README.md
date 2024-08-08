# Докеризиратор генератора статических сайтов

Пример порта, набор докерфайлов которые позволяют взять исходники из другого репозитория и собрать из них докер-образы,
запушить на докер-хаб.
В проекте как пример был взят следущий [репозиторий](https://github.com/MrDave/StaticJinjaPlus)

### Как установить

Для работы нужен docker, можете установить по [ссылке](https://docs.docker.com/engine/install/)

## Как собрать образы

### После установки докера, нужны слеующие данные для сбора контейнеров:

* image - название контейнера в компьютере
* tag - тэг контейнера локального компьютера
* python-slim-version - версия образа python-slim из dockerhub
* version - версия образа ubuntu из dockerhub
* staticjinja_plus_version - версия тэга из репозитория
* staticjinja_plus_branch - название ветки репозитория
* hash_sum - хэш сумма версии пакета в github

Dockerfile для использования свежей версии в директории develop:

* директория python - для использования python-slim в качестве образа

```
docker build -t ${image}:${tag} --build-arg packet_version=${python-slim-version} .
```

* директория ubuntu - для использования ubuntu в качестве образа

```
docker build -t ${image}:${tag} --build-arg version=${version} .
```

### В момент выхода порта есть слудющие тэги StaticJinjaPlus:

- [0.1.0](https://github.com/MrDave/StaticJinjaPlus/releases/tag/0.1.0)
- [0.1.1](https://github.com/MrDave/StaticJinjaPlus/releases/tag/0.1.1)

Dockerfile для использования версии из тэгов репозитория в директории 0.1:

* Высчитать хэш сумму, после надо сохранить как ${hash_sum}:
```shell
curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${staticjinja_plus_version}.tar.gz | sha256sum  | awk '{print $1}'
```

* директория python - для использования python-slim в качестве образа

```
docker build -t ${image}:${tag} --build-arg packet_version=${python-slim-version} --build-arg staticjinja_plus_version=${staticjinja_plus_version} --build-arg hash_sum=${hash_sum} .
```

* директория ubuntu - для использования ubuntu в качестве образа

```
docker build -t ${image}:${tag} --build-arg version=${version} --build-arg staticjinja_plus_version=${staticjinja_plus_version} --build-arg hash_sum=${hash_sum} .
```

## Как запустить контейнеры

### После сбора контейнеров, для запуска контейнеров нужны слудующие данные:

* templates_path - путь где лежат .html файлы для рендеринга
* tag - тэг контейнера локального компьютера
* packet_version - версия пакета из репозитория

```
docker run -v ${path}:/StaticJinjaPlus-${packet_version}  ${image}:${tag}
```

## Как выкладывать образы в Docker hub

### После успешных тестов контейнеров, нужны следующие данные:

* tag - тэг образа из локального компьютера
* username - юзернейм из [dockerhub](https://hub.docker.com/)

### Подготовка тэга для dockerhub

```
docker tag ${image}:${tag} ${username}/${image}:${tag}
```

### Запушить контейнер в dockerhub

```
docker push ${username}/${image}:${tag}
```

## Обновление образов при выходе новых версий

### При выходе новых версий StaticJinjaPlus нужно повторить сбор контейнеров как указывалось выше, с указыванием новых версий