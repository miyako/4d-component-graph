<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"												
                exclude-result-prefixes="xsl str"
                >

<xsl:decimal-format name="numeric" NaN="0" />

<xsl:param name="page" select="0" />
	
<xsl:output method="xml" 
			indent="no"
			omit-xml-declaration="no" 
			/>
			
<xsl:template match="/">

<eml>

<xsl:for-each select="/document/images/image">

<xsl:variable name="image-page" select="@page" />
<xsl:variable name="image" select="." />

	<xsl:choose>

	<xsl:when test="$page = 0">
		<xsl:for-each select="/document/body/page">
			<xsl:call-template name="images">
				<xsl:with-param name="image-page" select="$image-page" />		
				<xsl:with-param name="image" select="$image" />
			</xsl:call-template>	
		</xsl:for-each>
	</xsl:when>

	<xsl:otherwise>
		<xsl:for-each select="/document/body/page[@number = $page]">
			<xsl:call-template name="images">
				<xsl:with-param name="image-page" select="$image-page" />		
				<xsl:with-param name="image" select="$image" />
			</xsl:call-template>	
		</xsl:for-each>
	</xsl:otherwise>

	</xsl:choose>

</xsl:for-each> 

	<xsl:choose>

	<xsl:when test="$page = 0">
		<xsl:for-each select="/document/*/page/column/line/spans/span[@data]">
			<xsl:call-template name="image-in-line" />	
		</xsl:for-each>
	</xsl:when>

	<xsl:otherwise>
		<xsl:for-each select="/document/*/page[@number = $page]/column/line/spans/span[@data]">
			<xsl:call-template name="image-in-line" />	
		</xsl:for-each>
	</xsl:otherwise>

	</xsl:choose>

</eml>

</xsl:template>

<xsl:template name="image-in-line">

	<xsl:element name="image">

		<xsl:attribute name="data">
		<xsl:value-of select="@data" />
		</xsl:attribute>

		<xsl:attribute name="cid">
		<xsl:value-of select="@id" />
		</xsl:attribute>

		<xsl:attribute name="width">
		<xsl:value-of select="@width" />
		</xsl:attribute>

		<xsl:attribute name="height">
		<xsl:value-of select="@height" />
		</xsl:attribute>

	</xsl:element>

</xsl:template>

<xsl:template name="images">

	<xsl:param name="image-page" />
	<xsl:param name="image" />

	<xsl:variable name="right" select="($image-page = 'right') and (((/document/@odd-page-is-right = 'true') and (@number mod 2 = 1)) or ((/document/@odd-page-is-right = 'false') and (@number mod 2 = 0)))" />
	<xsl:variable name="left" select=" ($image-page = 'left')  and (((/document/@odd-page-is-right = 'true') and (@number mod 2 = 0)) or ((/document/@odd-page-is-right = 'false') and (@number mod 2 = 1)))" />
	<xsl:variable name="print-on-this-page" select="(/document/@left-page-is-different = 'false') or $right or $left or ($image-page = @number)" />

	<xsl:if test="$print-on-this-page">

	<xsl:variable name="verticalOffset">
	<xsl:choose>
	<xsl:when test="$page = 0">
	<xsl:value-of select="(@number - 1) * (@height)" />
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="0" />
	</xsl:otherwise>
	</xsl:choose>
	</xsl:variable>
	
	<xsl:element name="image">

		<xsl:attribute name="data">
		<xsl:value-of select="$image/@data" />
		</xsl:attribute>

		<xsl:attribute name="cid">
		<xsl:value-of select="$image/@id" />
		</xsl:attribute>

		<xsl:attribute name="width">
		<xsl:value-of select="$image/@width" />
		</xsl:attribute>

		<xsl:attribute name="height">
		<xsl:value-of select="$image/@height" />
		</xsl:attribute>

	</xsl:element>

	</xsl:if>
	
</xsl:template>

</xsl:stylesheet>