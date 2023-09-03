# Resume
Note, this is a PNG (couldn't figure out how to make github embed a pdf to the
readme directly), so it may look blurry. See the latest release https://github.com/jonathan-d-zhang/resume/releases/latest.

![my resume](https://github.com/jonathan-d-zhang/resume/releases/latest/download/main.png)

This repo can be used as a template.

# Building Locally
## tlmgr
**Note you will need `perl` to install `tlmgr`**

`tlmgr` is used to manage tex live packages.

Install with https://tug.org/texlive/quickinstall.html.
I recommend running `install-tl` with these arguments:
```shell
$ perl ./install-tl --no-interaction --scheme=scheme-minimal --no-doc-install --no-src-install
```
which will download a minimal installation without docs and package sources.

## Resume deps
You can install the packages the resume depends on with
```shell
$ tlmgr install $(cat DEPENDS.txt)
```
which is a bit scuffed, but what can you do.

## Actually building it
`make` will build both an anonymous version and a not-anonymous version.

## Other ways to get TeX Live
It is also possible to get TeX Live without `tlmgr` through an OS's package manager (like `apt`).
