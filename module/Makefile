MAKE=@make
DUNE=@dune
LN=@ln -sf
RM=@rm

all:
	$(DUNE) build src/module.a

clean:
	$(DUNE) clean
	$(RM) -rf $(BIN)
