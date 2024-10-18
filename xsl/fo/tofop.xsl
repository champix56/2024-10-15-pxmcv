<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output method="xml" version="1.0" indent="no"/>
	<xsl:template match="page">
		<fo:block break-before="page">
			<xsl:if test="/photos/pages/@titre='true'">
				<fo:block>
					<xsl:value-of select="/photos/titre"/>
				</fo:block>
			</xsl:if>
			<fo:table>
				<fo:table-body>
					<fo:table-row height="110mm">
						<xsl:apply-templates select="image[position() &lt;= 2]"/>
					</fo:table-row>
					<xsl:if test="count(image) >2">
						<fo:table-row height="110mm">
							<xsl:apply-templates select="image[position()>2]"/>
						</fo:table-row>
					</xsl:if>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
	<xsl:template match="page/image">
		<fo:table-cell>
			<fo:block text-align="center" display-align="center">
				<fo:external-graphic src="{concat(@path,@href)}" content-height="10cm" content-width="9cm" scaling="uniform"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--def. des formats de papier-->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4Portrait" page-height="297mm" page-width="21cm">
					<fo:region-body background-image="{/photos/@theme}"/>
					<fo:region-after extent="5mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--definition des construction de pages-->
			<fo:page-sequence master-reference="A4Portrait">
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center">
						<fo:page-number/>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block xsl:use-attribute-sets="bold title" text-align="center" text-decoration="underline">
							<xsl:value-of select="//titre"/>
						</fo:block>
						<xsl:apply-templates select="//page"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:attribute-set name="bold">
		<xsl:attribute name="font-weight">900</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="title">
		<xsl:attribute name="font-style">italic</xsl:attribute>
		<xsl:attribute name="color">tomato</xsl:attribute>
	</xsl:attribute-set>
</xsl:stylesheet>