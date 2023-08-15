BUILD_DIR := ./build
BUILD_CMD := lualatex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=$(BUILD_DIR)
PDFS := anon.pdf main.pdf

.PHONY: all
all: $(PDFS)

$(PDFS): %.pdf: main.tex
	mkdir -p $(BUILD_DIR)
	$(BUILD_CMD) -jobname="$(basename "$@" ".tex")" $?
	cp $(BUILD_DIR)/$@ ./

.PHONY: clean
clean:
	rm -rf build
	rm *.pdf
