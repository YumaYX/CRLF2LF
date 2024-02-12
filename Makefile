INPUT    := input/
OUTPUT   := output/

INFILES  := $(wildcard $(INPUT)*)
OUTFILES := $(INFILES:$(INPUT)%=$(OUTPUT)%)


default: init $(OUTFILES)

$(OUTPUT)%: $(INPUT)%
	tr -d '\r' < $< > $@

init: clobber
	mkdir -p $(INPUT) $(OUTPUT)

rev:
	for i in $$(ls -1 $(OUTPUT)); do unix2dos $(OUTPUT)$${i}; done

sum:
	cksum $(INFILES) $(OUTFILES) > cksum.txt

clobber:
	rm -rf $(OUTPUT)* ./*.txt

clean: clobber
	rm -rf $(INPUT) $(OUTPUT) ./*.txt
