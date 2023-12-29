INPUT    := input/
OUTPUT   := output/

INFILES  := $(wildcard $(INPUT)*)
OUTFILES := $(INFILES:$(INPUT)%=$(OUTPUT)%)


default: clobber $(OUTFILES) filesums

$(OUTPUT)%: $(INPUT)%
	tr -d '\r' < $< > $@

init:
	mkdir -p $(INPUT) $(OUTPUT)

filesums:
	cksum Makefile $(INFILES) $(OUTFILES) > cksums.txt

clobber:
	rm -rf $(OUTPUT)* ./*.txt
clean:
	rm -rf $(INPUT) $(OUTPUT) ./*.txt
