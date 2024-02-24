SHELL:=/bin/bash
povray:=povray +A +UA +W800 +H600 +L$(abspath ./POV-RoundEdge)
colors:=Green Blue Red Cyan Yellow Magenta Silver

boxes:=$(patsubst %,Box-%.png,$(colors))
cracked:=$(patsubst %,Cracked-%.png,$(colors))
spherical:=Player.png Ball.png
boundingbox:=$(patsubst %.png,%-BoundingBox.png,$(spherical))
sprites:=$(boxes) $(cracked) $(spherical) $(boundingbox)

all: index.html

display:
	@echo $(povray) +D +P -F Player.pov

clean:
	rm *.png sprites.html

%.png: %.pov
	$(povray) -D +F +O$@ +I$<
	mogrify -trim $@

Cracked-%.pov:: Cracked.pov
	sed "s/Silver/$*/" $< > $@

Box-%.pov:: Box.pov
	sed "s/Silver/$*/" $< > $@

%-BoundingBox.png: %.png
	 convert $< -shave 1x1 -bordercolor black -compose Copy -border 1 $@

index.html: index.sh $(sprites)
	./$<
