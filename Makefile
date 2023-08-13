BUILD_DIR := ./build
BUILD_CMD := lualatex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=$(BUILD_DIR)
DATE := $(shell date +'%Y-%m-%d')
NAME := jonathan-d-zhang


all: anon master

master:
	mkdir -p $(BUILD_DIR)
	$(BUILD_CMD) -jobname="$(NAME)-$(DATE)" main.tex

anon:
	mkdir -p $(BUILD_DIR)
	$(BUILD_CMD) -jobname="anon" anon.tex

.PHONY: clean
clean:
	rm -rf build

