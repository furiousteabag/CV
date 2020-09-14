PAPER=CV.tex
COMPILER=xelatex
TEMPDIR=temp
FLAGS=-shell-escape \
	  -interaction nonstopmode \
	  -halt-on-error \
	  -file-line-error \
	  -output-directory=$(TEMPDIR)

all:
	mkdir -p $(TEMPDIR)
	$(COMPILER) $(FLAGS) $(PAPER)
	mv $(TEMPDIR)/*.pdf .

clean:
	rm -rf temp/ _minted-slides/ indent.log

watch:  
	ls $(PAPER) | entr make all
