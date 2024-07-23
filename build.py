import tomllib
from pathlib import Path
import subprocess
import itertools
import datetime

MY_NAME = "jonathan-zhang"
JOBNAME_TEMPLATE = "{name}-{date}-{slug}"

PARENT_DIR = Path(__file__).parent
CONFIG_DIR = PARENT_DIR / "data"
BUILD_DIR = PARENT_DIR / ".build"
BUILD_DIR.mkdir(exist_ok=True)

LATEX_TEMPLATE = r"{}\include{{src/main.tex}}"

LUALATEX_ARGS = [
    "lualatex",
    "-halt-on-error",
    "-file-line-error",
    "-interaction=nonstopmode",
    f"-output-directory={BUILD_DIR.resolve()}",
]

def date() -> str:
    """Produces a date in the format I want, in my time zone"""

    return datetime.datetime.now(datetime.UTC).strftime("%Y-%m-%d")

def cat_files(p: Path) -> str:
    """Concatenate all files in a directory"""
    assert p.is_dir()

    out = []

    for child in p.iterdir():
        out.append(child.read_text())

    return "\n".join(out)


def build_newcommand(k: str, v: object) -> str:
    """Format a key value pair as a Latex newcommand"""
    if isinstance(v, list):
        v = ", ".join(map(str, v))

    return rf"\newcommand{{\{k}}}{{{v}}}"


if __name__ == '__main__':
    data = tomllib.loads(cat_files(CONFIG_DIR))

    for x in itertools.product(*(x.items() for x in data.values())):
        newcommands = []
        job_name = []
        for group_name, group in x:
            # special case for "notanon" to not show it in the slug
            if group_name != "notanon":
                job_name.append(group_name)

            for k, v in group.items():
                newcommands.append(build_newcommand(k, v))
        name = "anon" if "anon" in job_name else MY_NAME
        subprocess.run(
            LUALATEX_ARGS
            + [
                f"-jobname={JOBNAME_TEMPLATE.format(name=name, date=date(), slug='-'.join(job_name))}",
                LATEX_TEMPLATE.format("".join(newcommands)),
            ]
        )
