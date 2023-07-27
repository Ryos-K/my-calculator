LEX 	= lex
YACC 	= yacc
LEXSRC 	= calc.l
YACCSRC = calc.y

all: calc

calc: lex.yy.c y.tab.c
	$(CC) -o calc lex.yy.c y.tab.c

lex.yy.c: $(LEXSRC)
	$(LEX) $(LEXSRC)

y.tab.c: $(YACCSRC)
	$(YACC) -d $(YACCSRC)

.PHONY: clean test
clean: 
	rm -f calc lex.yy.c y.tab.c y.tab.h

test:
	bash test/test.sh ./calc ./test