<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="xml" version="1.0"/>
	<xsl:variable name="maxH" select="max(//ligneAvg)"/>
	<xsl:variable name="pasH" select="100 div $maxH"/>
	<xsl:variable name="pasW" select="100 div count(//ligneAvg)"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-height="210mm" page-width="297mm">
					<fo:region-body/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block-container height="200mm" display-align="center">
							<fo:block text-align="center">
								<fo:instream-foreign-object content-height="19cm" content-width="24cm" scaling="uniform">
									<svg viewBox="-20 -20 150 150" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
										<desc/>
										<defs>
											<symbol id="Axes">
												<line x1="20" y1="0" x2="20" y2="101" stroke="black" stroke-width="2"/>
												<polygon points="20,-1 25,5 15,5"/>
												<text x="112" y="115">X</text>
												<line x1="20" y1="100" x2="120" y2="100" stroke="black" stroke-width="2"/>
												<polygon points="121,100 115,95 115,105"/>
												<text x="5" y="10">Y</text>
												<rect x="40" y="97.5" width="1" height="5" style="fill:black"/>
												<text x="35" y="115">10</text>
												<rect x="70" y="97.5" width="1" height="5" style="fill:black"/>
												<text x="65" y="115">20</text>
												<rect x="100" y="97.5" width="1" height="5" style="fill:black"/>
												<text x="95" y="115">30</text>
												<rect x="18.5" y="20" width="5" height="1" style="fill:black"/>
												<text x="3" y="25">10</text>
												<rect x="18.5" y="50" width="5" height="1" style="fill:black"/>
												<text x="3" y="55">20</text>
												<rect x="18" y="80" width="5" height="1" style="fill:black"/>
												<text x="3" y="85">30</text>
											</symbol>
											<linearGradient id="effetArrondiVertical" x1="0%" x2="100%" y1="20%" y2="0">
												<stop offset="0%" stop-color="#B7CA79"/>
												<stop offset="80%" stop-color="#677E52"/>
											</linearGradient>
										</defs>
										<xsl:apply-templates select="//facture"/>
										<use xlink:href="#Axes" x="-15" y="0"/>
									</svg>
								</fo:instream-foreign-object>
							</fo:block>
						</fo:block-container>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template match="facture">
	<xsl:variable name="H" select="ligneAvg * $pasH"/>
		<rect x="{((position()-1) * 20) + 6}" y="{100 -$H }" width="18" height="{$H}" fill="url(#effetArrondiVertical)"/>
	</xsl:template>
</xsl:stylesheet>