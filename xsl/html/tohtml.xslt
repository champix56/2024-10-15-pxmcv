<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY euro "&#x20ac;"> 
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<!--<xsl:template match="@rsets">
		<xsl:value-of select="/factures/@rsets"/><br/>
		<xsl:value-of select="/factures/@adr1ets"/>
	</xsl:template>-->
	<xsl:template name="info-emeteur">
		<xsl:value-of select="/factures/@rsets"/><br/>
		<xsl:value-of select="/factures/@adr1ets"/><br/>
		<xsl:if test="string-length(@adr2ets)>0">
			<xsl:value-of select="/factures/@adr2ets"/><br/>
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
					<tr class="ligne">
						<td/>
						<td/>
						<td/>
						<td/>
						<td/>
					</tr>
					<tr>
						<td colspan="3"/>
						<td>Montant H.T.</td>
						<th>€</th>
					</tr>
					<tr>
						<td colspan="3"/>
						<td>Montant T.V.A.</td>
						<th>€</th>
					</tr>
					<tr>
						<td colspan="3"/>
						<td>Montant T.T.C.</td>
						<th>€</th>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<title>Enter your title here</title>
				<style>
			@media screen{.facture{margin-bottom:20px;border:1px solid black;}}			
			body{
				width:18cm;
			}			
			.facture{
				page-break-before:always;
				height:27cm;
			}
			.emeteur{
				height:5cm;
			}
			.destinataire{
				margin-left:13cm;
				height:5cm;
			}
			.numfacture{
				margin-top:1cm;
				margin-left:25%;
				width:50%;
				text-align:center;
				border:1px solid black;
			}
			table{
				width:90%;
				margin-left:5%;
				margin-top:1cm;
			}
		</style>
			</head>
			<body>
				<div id="header">Factures en date du : <xsl:value-of select="/factures/@dateeditionXML"/><hr/></div>
				<xsl:apply-templates select="//facture"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>