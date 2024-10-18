<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY euro "&#x20ac;"> 
	<!ENTITY nbsp "&#160;"> 
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import  href="lib-facture-html.xslt"/>
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>

	<!--<xsl:template match="@rsets">
		<xsl:value-of select="/factures/@rsets"/><br/>
		<xsl:value-of select="/factures/@adr1ets"/>
	</xsl:template>-->
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
			.center{
				text-align:center;
			}
		</style>
			</head>
			<body>
				<div id="header">Factures en date du : <xsl:value-of select="/factures/@dateeditionXML"/><hr/>
<table>
						<xsl:call-template name="totaux">
							<xsl:with-param name="nodes" select="/factures"/>
						</xsl:call-template>
					</table>		
<hr/>		
				</div>
				<xsl:apply-templates select="//facture"/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ligne">
		<tr class="ligne">
			<td>
				<xsl:value-of select="ref"/>
			</td>
			<td>
				<xsl:value-of select="designation"/>
			</td>
			<td class="center">
				<xsl:value-of select="format-number(phtByUnit,'0.00€')"/>
			</td>
			<td class="center">
				<xsl:value-of select="nbUnit"/>
			</td>
			<th>
				<xsl:value-of select="format-number(stotligne,'0.00€')"/>
			</th>
		</tr>
	</xsl:template>
	</xsl:stylesheet>