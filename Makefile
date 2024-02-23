SHELL:=/bin/bash
povray:=povray +A +UA +W800 +H600
colors:=Green Blue Red Cyan Yellow Magenta Silver

boxes:=$(patsubst %,Box-%.png,$(colors))
cracked:=$(patsubst %,Cracked-%.png,$(colors))
sprites:=$(boxes) $(cracked) Player.png Ball.png

all: index.html

display:
	@echo $(povray) +D +P -F Player.pov

clean:
	rm *.png sprites.html

%.png: %.pov Makefile
	$(povray) -D +F +O$@ +I$<
	mogrify -trim $@

Cracked-%.pov:: Cracked.pov
	sed "s/Silver/$*/" $< > $@

Box-%.pov:: Box.pov
	sed "s/Silver/$*/" $< > $@

index.html: index.sh $(sprites)
	./$<
