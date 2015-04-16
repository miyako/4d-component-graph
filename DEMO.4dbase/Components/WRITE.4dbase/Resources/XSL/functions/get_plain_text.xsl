<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"
				xmlns:xhtml="http://www.w3.org/1999/xhtml"												
                exclude-result-prefixes="xsl str"
                >

<xsl:strip-space elements="span" />	

<xsl:output method="text" />
			
<xsl:template match="/">

	<xsl:for-each select="//xhtml:span">
		<xsl:value-of select="." />
	</xsl:for-each>

</xsl:template>

</xsl:stylesheet>