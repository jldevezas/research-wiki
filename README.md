# Research wiki

A docker-based configuration of a [DokuWiki](https://www.dokuwiki.org/) instance for managing research the wiki way.

## Install

```shell
git clone https://github.com/jldevezas/research-wiki.git
cd research-wiki/
docker-compose up --build
```

Visit http://127.0.0.1:8080/ and login with username `admin` and password `admin` (don't forget to change it in `Admin => User Manager`). You can then start editing taking advantage of the multiple templates for the pre-established namespaces within the proposed structure. We will publish an article with more details soon.

You can then stop the server by pressing `ctrl+c`.

## Day-to-day operation

To start:

```shell
cd research-wiki/
docker-compose start
```

To stop:

```shell
cd research-wiki/
docker-compose stop
```
