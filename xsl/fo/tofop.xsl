<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!--def. des formats de papier-->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4Portrait" page-height="297mm" page-width="21cm">
					<fo:region-body></fo:region-body>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!--definition des construction de pages-->
			<fo:page-sequence master-reference="A4Portrait">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						DEGEMER <fo:inline color="blue">MAT</fo:inline> Breizh 
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>


</xsl:stylesheet>
