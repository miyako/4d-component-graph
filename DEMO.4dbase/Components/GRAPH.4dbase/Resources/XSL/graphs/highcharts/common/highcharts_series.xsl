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
	<xsl:text>
		series: [
		</xsl:text>
			<xsl:for-each select="$v">
				<xsl:variable name="position" select="position()" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:value-of select="'{name: '" />
				<xsl:call-template name="escape-string">
					<xsl:with-param name="s" select="."/>
				</xsl:call-template>
				<xsl:value-of select="', data: ['" />
				
				<xsl:for-each select="/graph/y_values[position() = $position]/s">
					<xsl:variable name="item" select="position()" />
					<xsl:if test="$item != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:choose>
					<xsl:when test="$map_zero_to_null = 1 and . = 0">
						<xsl:value-of select="'null'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="." />
					</xsl:otherwise>								
					</xsl:choose>
				</xsl:for-each>		
				
				<xsl:value-of select="']'" />	
				<xsl:value-of select="'}'" />						
			</xsl:for-each>	
		<xsl:text>
		]	
	</xsl:text>	
</xsl:template>
 
<xsl:template name="series-pie">
<xsl:param name="v" />
<xsl:param name="total" />
	<xsl:text>
		series: [{
			type: 'pie',
			name: '',
			data: [
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
			]
		}]
	</xsl:text>
</xsl:template>

</xsl:stylesheet>