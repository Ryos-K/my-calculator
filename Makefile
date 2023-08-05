LEX 	= flex
YACC 	= bison
LEXSRC 	= calc.l
YACCSRC = calc.y
MAINSRC = main.c
LEXOUT  = lexer.c
YACCOUT = parser.c
CALCOUT = calc

all: $(CALCOUT)

$(CALCOUT): $(MAINSRC) $(LEXOUT) $(YACCOUT)
	$(CC) -o calc main.c $(LEXOUT) $(YACCOUT)

$(LEXOUT): $(LEXSRC)
	$(LEX)  -o $(LEXOUT) $(LEXSRC) 

$(YACCOUT): $(YACCSRC)
	$(YACC) -o $(YACCOUT) -d $(YACCSRC)

.PHONY: clean test
clean: 
	rm -f $(CALCOUT) $(LEXOUT) $(YACCOUT)


test:
	bash test/test.sh ./calc ./test