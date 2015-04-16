<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >
				
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:strip-space elements="*" />
<xsl:decimal-format name="decimal" NaN="0" />			

<xsl:template name="style">

	<xsl:param name="node" />

	<style type="{$node/@type}">
	<!-- we cannot use xs:comment because double dashes may appear -->
	<!-- most browsers prefer html 4.01 style in style, as opposed to script -->
	<xsl:value-of select="string('&lt;!--')" disable-output-escaping="yes" />
		<xsl:value-of select="$node" disable-output-escaping="yes" />
	<xsl:value-of select="string('//--&gt;')" disable-output-escaping="yes" />
	</style>	
	
</xsl:template>

<xsl:template name="script">

	<xsl:param name="node" />
	<xsl:variable name="CDATA-START">
	<xsl:value-of select="string('//&lt;![CDATA[')" />
	</xsl:variable>
	<xsl:variable name="CDATA-END">
	<xsl:value-of select="string('//]]&gt;')" />
	</xsl:variable>

	<script type="{$node/@type}">
	<xsl:call-template name="escape-in" />
		<xsl:value-of select="$node" disable-output-escaping="yes" />
	<xsl:call-template name="escape-out" />
	</script>
			
</xsl:template>

<xsl:template name="escape-in">
<xsl:choose>
<xsl:when test="$format='xhtml'"><!-- xhtml 1.0 style -->	
		<xsl:value-of select="string('//&lt;![CDATA[')" disable-output-escaping="yes" />
</xsl:when>
<xsl:otherwise><!-- html 4.01 style -->
	<!--we cannot use xs:comment because double dashes may appear -->
	<xsl:value-of select="string('&lt;!--')" disable-output-escaping="yes" />
</xsl:otherwise>
</xsl:choose>	
</xsl:template>

<xsl:template name="escape-out">
<xsl:choose>
<xsl:when test="$format='xhtml'"><!-- xhtml 1.0 style -->	
		<xsl:value-of select="string('//]]&gt;')" disable-output-escaping="yes" />
</xsl:when>
<xsl:otherwise><!-- html 4.01 style -->
	<!--we cannot use xs:comment because double dashes may appear -->
	<xsl:value-of select="string('//--&gt;')" disable-output-escaping="yes" />
</xsl:otherwise>
</xsl:choose>	
</xsl:template>

</xsl:stylesheet>