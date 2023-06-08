MAKE=@make
DUNE=@dune
LN=@ln -sf
RM=@rm
BIN=list

all:
	$(DUNE) build src/$(BIN).exe
	$(LN) _build/default/src/$(BIN).exe $(BIN)

clean:
	$(DUNE) clean
	$(RM) -rf $(BIN)
