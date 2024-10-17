<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:decimal-format name="decimal" decimal-separator="."/>
	<xsl:template match="/">numfact;date facture;idclient;type;total<xsl:for-each select="//facture">
			<xsl:text>
</xsl:text>
			<xsl:value-of select="@numfacture"/>;<xsl:value-of select="@datefacture"/>;<xsl:value-of select="@idclient"/>;<xsl:value-of select="format-number(sum(.//stotligne),'0.00')"/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
