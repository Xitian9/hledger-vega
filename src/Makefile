all: vega vega-lite vega-embed

vegaVersion = 5
vegaLiteVersion = 5
vegaEmbedVersion = 6

vega: .FORCE
	curl https://cdn.jsdelivr.net/npm/vega@$(vegaVersion) > vega@$(vegaVersion)

vega-lite: .FORCE
	curl https://cdn.jsdelivr.net/npm/vega-lite@$(vegaLiteVersion) > vega-lite@$(vegaLiteVersion)

vega-embed: .FORCE
	curl https://cdn.jsdelivr.net/npm/vega-embed@$(vegaEmbedVersion) > vega-embed@$(vegaEmbedVersion)

.PHONY: all .FORCE
