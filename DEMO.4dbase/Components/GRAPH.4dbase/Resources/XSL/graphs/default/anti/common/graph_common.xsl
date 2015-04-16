<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >
				
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

	<xsl:template name="max">	
		<xsl:variable name="max">
			<xsl:call-template name="get-max">
				<xsl:with-param name="current-max" select="0" />
				<xsl:with-param name="current-pos" select="1" />					
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$max" />
	</xsl:template>			

	<xsl:template name="min">	
		<xsl:variable name="min">
			<xsl:call-template name="get-min">
				<xsl:with-param name="current-min" select="0" />
				<xsl:with-param name="current-pos" select="1" />					
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$min" />
	</xsl:template>		
					
	<xsl:template name="get-max">
	
		<xsl:param name="current-max" />
		<xsl:param name="current-pos" />
		<xsl:variable name="sum" select="sum(/graph[1]/y_values[$current-pos]/s)" />
						
		<xsl:choose>
			<xsl:when test="$current-pos &gt; count(/graph[1]/y_values)">
				<xsl:value-of select="$current-max" />
			</xsl:when>
			<xsl:when test="$sum &gt; $current-max">
			<xsl:call-template name="get-max">
				<xsl:with-param name="current-max" select="$sum" />
				<xsl:with-param name="current-pos" select="$current-pos + 1" />					
			</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			<xsl:call-template name="get-max">
				<xsl:with-param name="current-max" select="$current-max" />
				<xsl:with-param name="current-pos" select="$current-pos + 1" />					
			</xsl:call-template>		
			</xsl:otherwise>				
		</xsl:choose>
				
	</xsl:template>	

	<xsl:template name="get-min">
	
		<xsl:param name="current-min" />
		<xsl:param name="current-pos" />
		<xsl:variable name="sum" select="sum(/graph[1]/y_values[$current-pos]/s)" />
						
		<xsl:choose>
			<xsl:when test="$current-pos &gt; count(/graph[1]/y_values)">
				<xsl:value-of select="$current-min" />
			</xsl:when>
			<xsl:when test="$sum &lt; $current-min">
			<xsl:call-template name="get-min">
				<xsl:with-param name="current-min" select="$sum" />
				<xsl:with-param name="current-pos" select="$current-pos + 1" />					
			</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			<xsl:call-template name="get-min">
				<xsl:with-param name="current-min" select="$current-min" />
				<xsl:with-param name="current-pos" select="$current-pos + 1" />					
			</xsl:call-template>		
			</xsl:otherwise>				
		</xsl:choose>
				
	</xsl:template>	

</xsl:stylesheet>