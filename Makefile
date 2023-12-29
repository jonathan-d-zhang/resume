BUILD_DIR := ./build
SRC_DIR := ./src
PDFS := anon.pdf main.pdf

.PHONY: all
all: $(PDFS)

$(PDFS): %.pdf: $(SRC_DIR)/main.tex
	mkdir -p $(BUILD_DIR)
	lualatex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(basename $@ .tex)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
