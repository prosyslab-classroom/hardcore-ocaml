MAKE=@make
DUNE=@dune
LN=@ln -sf
RM=@rm

all:
	$(DUNE) build src/gen.exe
	$(LN) _build/default/src/gen.exe gen
	$(DUNE) build src/read.exe
	$(LN) _build/default/src/read.exe read

clean:
	$(DUNE) clean
	$(RM) -rf gen read
