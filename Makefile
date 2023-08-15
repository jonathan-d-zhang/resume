BUILD_DIR := ./build
BUILD_CMD := lualatex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=$(BUILD_DIR)
PDFS := anon.pdf main.pdf

define PII
\newcommand{\myemail}{firstlastnumbers@gmail.com}
\newcommand{\myname}{First Last}
\newcommand{\mygh}{first-mi-last}
\newcommand{\mylinkedin}{fimi-last}
\newcommand{\myphone}{314-159-2653}
\newcommand{\mylocation}{United States}
endef
export PII

.PHONY: all
all: $(PDFS)

$(PDFS): %.pdf: main.tex
	mkdir -p $(BUILD_DIR)
	$(BUILD_CMD) -jobname="$(basename "$@" ".tex")" $?
	cp $(BUILD_DIR)/$@ ./

pii.tex:
	@echo "$$PII" > pii.tex

.PHONY: clean
clean:
	rm -rf build
	rm *.pdf
