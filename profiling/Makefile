MAKE=@make
DUNE=@dune
LN=@ln -sf
RM=@rm
BIN=profiling

all:
	$(DUNE) build --instrument-with landmarks src/$(BIN).exe
	$(LN) _build/default/src/$(BIN).exe $(BIN)


clean:
	$(DUNE) clean
	$(RM) -rf $(BIN)
