<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY euro "&#x20ac;"> 
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:decimal-format name="euro" grouping-separator=" " decimal-separator=","/>
	<xsl:decimal-format name="calculatable_number" decimal-separator="."/>
	<xsl:param name="tva_tx" select="20"/>
	<xsl:variable name="tva_pcent" select="$tva_tx div 100"/>
	<xsl:template name="info-emeteur">
		<xsl:value-of select="/factures/@rsets"/><br/>
		<xsl:value-of select="/factures/@adr1ets"/><br/>
		<xsl:if test="string-length(@adr2ets)>0">
			<xsl:value-of select="/factures/@adr2ets"/>
			<br/>
		</xsl:if>
		<xsl:value-of select="/factures/@cpets"/>&nbsp;<xsl:value-of select="/factures/@villeets"/>
	</xsl:template>
	<xsl:template match="@numfacture">
		<div class="numfacture">
			<!--
				interdit les if successif pour le meme test
					<xsl:if test="contains(../@type,'acture')">Facture</xsl:if>
					<xsl:if test="contains(../@type,'evis')">Devis</xsl:if>
			-->
			<xsl:choose>
				<xsl:when test="contains(../@type,'acture')">Facture</xsl:when>
				<xsl:otherwise>Devis</xsl:otherwise>
			</xsl:choose>
			N° <xsl:value-of select="."/><br/>
			En date du : <xsl:value-of select="../@datefacture"/>
		</div>
	</xsl:template>
	<xsl:template match="facture">
		<div class="facture" id="F{@numfacture}">
			<xsl:comment>une Facture depuis xml</xsl:comment>
			<div class="emeteur">
				<!--<xsl:apply-templates select="/factures/@rsets"/>-->
				<xsl:call-template name="info-emeteur"/>
			</div>
			<div class="destinataire">dest</div>
			<xsl:apply-templates select="@numfacture"/>
			<table class="lignes" border="1" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>Ref</th>
						<th>designation</th>
						<th>&euro;/unit.</th>
						<th>quantité</th>
						<th>sous-total</th>
					</tr>
				</thead>
				<tbody>
					<xsl:apply-templates select=".//ligne"/>
					<xsl:call-template name="totaux">
						<xsl:with-param name="nodes" select="."/>
					</xsl:call-template>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template name="totaux">
		<xsl:param name="nodes" select="."/>
		<xsl:variable name="stot" select="sum($nodes//stotligne)"/>
		<xsl:variable name="tva" select="format-number($stot * $tva_pcent,'0.00', 'calculatable_number')"/>
		<tr>
			<td colspan="3">&nbsp;</td>
			<td>Montant H.T.</td>
			<th>
				<xsl:value-of select="format-number($stot,'# ##0,00€', 'euro')"/>
			</th>
		</tr>
		<tr>
			<td colspan="3"/>
			<td>Montant T.V.A.</td>
			<th>
				<xsl:value-of select="format-number($tva,'# ##0,00€', 'euro')"/>
			</th>
		</tr>
		<tr>
			<td colspan="3"/>
			<td>Montant T.T.C.</td>
			<th>
				<xsl:value-of select="format-number($stot + $tva,'# ##0,00€', 'euro')"/>
			</th>
		</tr>
	</xsl:template>

</xsl:stylesheet>
