# Resume
Note, this is a PNG (couldn't figure out how to make github embed a pdf to the
readme directly), so it may look blurry. See the latest release https://github.com/jonathan-d-zhang/resume/releases/latest.

![my resume](https://github.com/jonathan-d-zhang/resume/releases/latest/download/main.png)

This repo can be used as a template.

## Editing
Currently there is only support for specifying a few fields in external configs. These are:

* Contact information: name, email, linkedin, github, phone number, and location

Other than these, you will need to modify `src/main.tex`.

## How to Build Locally
### Prerequisites
You will need:

#### tlmgr
`tlmgr` is used to manage tex live packages.

Install with [the quick install guide](https://tug.org/texlive/quickinstall.html).
I recommend running `install-tl` with these arguments:
```shell
$ perl ./install-tl --no-interaction --scheme=scheme-minimal --no-doc-install --no-src-install
```
which will download a minimal installation without docs and package sources.

**Note**: you will need `perl` to install `tlmgr`

**Note**: It is also possible to get TeX Live without `tlmgr` through an OS's
package manager (like `apt`).

#### Python
At least Python 3.11.

### Install LaTeX dependencies
You can install the packages the resume depends on with
```shell
$ tlmgr install $(cat DEPENDS.txt)
```

### Actually building it
Run `python build.py`.

### If you want to generate a PNG for embedding
Use the `pdf2png` module. Usage instructions are given in `pdf2png/__main__.py`
Requirements are listed in `requirements.txt`
