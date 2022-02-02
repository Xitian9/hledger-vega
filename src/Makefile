chartdata:
	./hledger-vega

cleandata:
	rm -f charts/*.csv

localvega: vega vega-lite vega-embed

cleanvega:
	rm -f vega*@*

clean: cleandata cleanvega

vega = vega@5
vegaLite = vega-lite@5
vegaEmbed = vega-embed@6

vega: .FORCE
	curl https://cdn.jsdelivr.net/npm/$(vega) > $(vega)
	sed -i -e 's/<script src="[^"]*vega@[^"]*">/<script src="$(vega)">/' index.html

vega-lite: .FORCE
	curl https://cdn.jsdelivr.net/npm/$(vegaLite) > $(vegaLite)
	sed -i -e 's/<script src="[^"]*vega-lite@[^"]*">/<script src="$(vegaLite)">/' index.html

vega-embed: .FORCE
	curl https://cdn.jsdelivr.net/npm/$(vegaEmbed) > $(vegaEmbed)
	sed -i -e 's/<script src="[^"]*vega-embed@[^"]*">/<script src="$(vegaEmbed)">/' index.html

SERVECMD=python3 -m http.server  # port 8000
#SERVECMD=caddy file-server  # port 80

serve: .FORCE
	$(SERVECMD)

.PHONY: all clean cleandata cleanvega localvega .FORCE
