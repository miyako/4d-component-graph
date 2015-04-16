<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"																			
                exclude-result-prefixes="xsl str"
                >

<xsl:template name="style-text">

	<xsl:if test="@background-color">
		<xsl:if test="@background-color != 'none'">
			<xsl:if test="@background-color != 'inherited'">
				<xsl:value-of select="concat('background-color:', @background-color, ';')" />
			</xsl:if>
		</xsl:if>		
	</xsl:if>
	
	<xsl:if test="@color">
		<xsl:if test="@color != 'inherited'">
			<xsl:value-of select="concat('color:', @color, ';')" />
		</xsl:if>		
	</xsl:if>		
	
	<xsl:if test="@font-family">
		<xsl:if test="@font-family != 'inherited'">	
			<xsl:value-of select="concat('font-family:', @font-family, ';')" />
		</xsl:if>				
	</xsl:if>
			
	<xsl:if test="@font-size">
		<xsl:if test="@font-size != 'inherited'">		
			<xsl:value-of select="concat('font-size:', @font-size, 'pt;')" />
		</xsl:if>	
	</xsl:if>
		
	<xsl:if test="@font-style">
		<xsl:if test="@font-style != 'inherited'">		
			<xsl:value-of select="concat('font-style:', @font-style, ';')" />
		</xsl:if>
	</xsl:if>	
	
	<xsl:if test="@font-weight">
		<xsl:if test="@font-weight != 'inherited'">		
			<xsl:value-of select="concat('font-weight:', @font-weight, ';')" />
		</xsl:if>	
	</xsl:if>
		
	<xsl:if test="@text-decoration">
		<xsl:if test="@text-decoration != 'inherited'">	
			<xsl:value-of select="concat('text-decoration:', @text-decoration, ';')" />
		</xsl:if>				
	</xsl:if>	
	
</xsl:template>

</xsl:stylesheet>