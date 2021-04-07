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

# Analysis: Jupyter notebook

We also provide a Jupyter notebook to help you analyze your activity based on your wiki, over the three dimensions we propose here: literature, collections and experiments.

## Install

First, let us install R and Jupyter:

```shell
sudo apt-get install r-base
pip install jupyter
```

Then, you must install the `IRkernel` package in R:

```r
install.packages("IRkernel")
```

Finally, just launch Jupyter notebook in the notebook directory:

```shell
cd research-wiki/notebook/
jupyter notebook
```

And follow the instructions in the notebook to run your analysis. All plots will be saved to the `output/` directory.

# Citation

If you are using this package to manage your research, please cite the following papers:

```bibtex
@article{Devezas2021,
  author     = {Devezas, Jos\'{e} and Nunes, S\'{e}rgio},
  title      = {Managing Research the Wiki Way},
  year       = {2021},
  issue_date = {Spring 2021},
  publisher  = {Association for Computing Machinery},
  address    = {New York, NY, USA},
  volume     = {27},
  number     = {3},
  issn       = {1528-4972},
  url        = {https://doi.org/10.1145/3453117},
  doi        = {10.1145/3453117},
  journal    = {XRDS: Crossroads, The ACM Magazine for Students},
  month      = mar,
  pages      = {10–11},
  numpages   = {2}
}
```

```bibtex
@misc{Devezas2021a,
  author        = {José Devezas and Sérgio Nunes},
  title         = {Managing Research the Wiki Way: A Systematic Approach to Documenting Research},
  year          = {2021},
  archiveprefix = {arXiv},
  eprint        = {2104.01849},
  primaryclass  = {cs.DL},
}
```
