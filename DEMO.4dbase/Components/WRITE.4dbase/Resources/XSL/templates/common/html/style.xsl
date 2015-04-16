<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"		
				xmlns="http://www.w3.org/1999/xhtml"																	
                exclude-result-prefixes="xsl str"
                >

<xsl:template name="style-position">

<xsl:param name="left" select="0" />
<xsl:param name="top" select="0" />
<xsl:param name="height" select="0" />
<xsl:param name="width" select="0" />

	<xsl:value-of select="concat(
		'position:absolute;', 
		'left:', $left, 'px;',
		'top:', $top, 'px;',
		'height:', $height, 'px;',
		'width:', $width, 'px;')" 
		/>

</xsl:template>

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
			<xsl:value-of select="concat('font-size:', @font-size, 'px;')" />
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
	
	<xsl:if test="@text-shadow">
		<xsl:if test="@text-shadow != 'inherited'">		
			<xsl:value-of select="concat('text-shadow:', @text-shadow, ';')" />
		</xsl:if>
	</xsl:if>	

	<xsl:if test="@text-align">
		<xsl:if test="@text-align != 'inherited'">		
			<xsl:value-of select="concat('text-align:', @text-align, ';')" />
		</xsl:if>
	</xsl:if>
				
	<xsl:if test="@line-height">
		<xsl:if test="@line-height != 'inherited'">
			<xsl:value-of select="concat('line-height:', @line-height, 'em;')" />
		</xsl:if>		
	</xsl:if>

	<xsl:if test="@padding-left">
		<xsl:if test="@padding-left != 'inherited'">
			<xsl:value-of select="concat('padding-left:', @padding-left, 'px;')" />
		</xsl:if>		
	</xsl:if>

	<xsl:if test="@padding-top">
		<xsl:if test="@padding-top != 'inherited'">
			<xsl:value-of select="concat('padding-top:', @padding-top, 'px;')" />
		</xsl:if>		
	</xsl:if>
	
	<xsl:if test="@padding-bottom">
		<xsl:if test="@padding-bottom != 'inherited'">
			<xsl:value-of select="concat('padding-bottom:', @padding-bottom, 'px;')" />
		</xsl:if>		
	</xsl:if>

	<xsl:if test="@padding-right">
		<xsl:if test="@padding-right != 'inherited'">
			<xsl:value-of select="concat('padding-right:', @padding-right, 'px;')" />
		</xsl:if>		
	</xsl:if>				
																														
</xsl:template>

<xsl:template name="style-border">

	<xsl:if test="@border-bottom and @border-color">
		<xsl:if test="@border-bottom != 0">
			<xsl:value-of select="concat('border-bottom:', @border-bottom, 'px solid ', @border-color, ';')" />
		</xsl:if>		
	</xsl:if>

	<xsl:if test="@border-left and @border-color">
		<xsl:if test="@border-left != 0">
			<xsl:value-of select="concat('border-left:', @border-left, 'px solid ', @border-color, ';')" />
		</xsl:if>		
	</xsl:if>

	<xsl:if test="@border-right and @border-color">
		<xsl:if test="@border-right != 0">
			<xsl:value-of select="concat('border-right:', @border-right, 'px solid ', @border-color, ';')" />
		</xsl:if>		
	</xsl:if>
		
	<xsl:if test="@border-top and @border-color">
		<xsl:if test="@border-top != 0">
			<xsl:value-of select="concat('border-top:', @border-top, 'px solid ', @border-color, ';')" />
		</xsl:if>		
	</xsl:if>

	<xsl:if test="@margin-left">
		<xsl:if test="@margin-left != 0">
			<xsl:value-of select="concat('margin-left:', @margin-left, 'px;')" />
		</xsl:if>		
	</xsl:if>

	<xsl:if test="@text-indent">
		<xsl:if test="@text-indent != 0">
			<xsl:value-of select="concat('text-indent:', @text-indent, 'px;')" />
		</xsl:if>		
	</xsl:if>
			
</xsl:template>

</xsl:stylesheet>