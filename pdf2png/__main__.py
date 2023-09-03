"""
Creates a PNG from a PDF file.

Usage: `python -m pdf2png source.pdf output.png
"""

import fitz
import sys

doc = fitz.open(sys.argv[1])
for page in doc:
    pix = page.get_pixmap(dpi=300)
    pix.save(sys.argv[2])
