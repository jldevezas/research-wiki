# research-wiki

A docker-based configuration of a DokuWiki instance for managing research the wiki way.

## Install

```shell
git clone https://github.com/jldevezas/research-wiki.git
cd research-wiki/
docker-compose up --build
```

Visit http://127.0.0.1:8080/install.php and fill-in the details. Don't forget to set your initial ACL policy to `Closed Wiki`, if you want to run a private wiki (although you can change this later).

Visit http://127.0.0.1:8080/ and login to start editing. You will find multiple templates for the pre-established namespaces within the proposed structure. We should publish an article with more details soon.

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
