<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:strip-space elements="*" />
  <xsl:output method="xml" encoding="UTF-8" indent="no" />


<xsl:template name="series-column">
<xsl:param name="v" />
<xsl:param name="c" />

	<xsl:text>data.addColumn('string', 'x_values');</xsl:text>
	<xsl:for-each select="$v">
		<xsl:text>data.addColumn('number',</xsl:text>
		<xsl:call-template name="escape-string">
					<xsl:with-param name="s" select="."/>
		</xsl:call-template>
		<xsl:text>);</xsl:text>
	</xsl:for-each>
	
	<xsl:text>data.addRows(</xsl:text><xsl:value-of select="count($c)" /><xsl:text>);</xsl:text>

	<xsl:for-each select="$c">
		<xsl:variable name="position" select="position()" />
		<xsl:text>data.setValue(</xsl:text><xsl:value-of select="$position - 1" /><xsl:text>, 0, </xsl:text><xsl:call-template name="escape-string">
			<xsl:with-param name="s" select="."/>
		</xsl:call-template><xsl:text>);</xsl:text>	
				
		<xsl:for-each select="/graph/y_values/s[position() = $position]">
			<xsl:variable name="item" select="position()" />				
			<xsl:text>data.setValue(</xsl:text><xsl:value-of select="$position - 1" /><xsl:text>, </xsl:text><xsl:value-of select="$item" /><xsl:text>, </xsl:text><xsl:value-of select="." /><xsl:text>);</xsl:text>
		</xsl:for-each>	
	</xsl:for-each>
			
</xsl:template>
 
<xsl:template name="series-pie">
<xsl:param name="v" />
<xsl:param name="total" />
	<xsl:text>
	data.addColumn('string', 'labels');
	data.addColumn('number', 'values');
	data.addRows([
	</xsl:text>
			<xsl:for-each select="$v">				
				<xsl:variable name="position" select="position()" />
				<xsl:variable name="value" select="sum(/graph/y_values/v[position() = $position])" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:value-of select="'['" />
				<xsl:call-template name="escape-string">
					<xsl:with-param name="s" select="."/>
				</xsl:call-template>
				<xsl:value-of select="concat(', ', $value, ']')" />
			</xsl:for-each>	
	<xsl:text>
	]);
	</xsl:text>
</xsl:template>

</xsl:stylesheet>