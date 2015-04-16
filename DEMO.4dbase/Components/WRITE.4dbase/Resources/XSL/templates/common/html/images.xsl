<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"
				xmlns="http://www.w3.org/1999/xhtml"																	
                exclude-result-prefixes="xsl str"
                >

<xsl:template name="images-behind">
	<xsl:for-each select="/document/images/image[@layout = 'behind']">
		<xsl:call-template name="images-in-page" />
	</xsl:for-each>
</xsl:template>

<xsl:template name="images-in-front">
	<xsl:for-each select="/document/images/image[@layout = 'front']">
		<xsl:call-template name="images-in-page" />
	</xsl:for-each>
</xsl:template>

<xsl:template name="images-in-page">

<xsl:variable name="image-page" select="@page" />
<xsl:variable name="image" select="." />

<xsl:choose>

<xsl:when test="$page = 0">
	<xsl:for-each select="/document/body/page">
		<xsl:call-template name="images-in-page-div">
			<xsl:with-param name="image-page" select="$image-page" />		
			<xsl:with-param name="image" select="$image" />
		</xsl:call-template>	
	</xsl:for-each>
</xsl:when>

<xsl:otherwise>
	<xsl:for-each select="/document/body/page[@number = $page]">
		<xsl:call-template name="images-in-page-div">
			<xsl:with-param name="image-page" select="$image-page" />		
			<xsl:with-param name="image" select="$image" />
		</xsl:call-template>	
	</xsl:for-each>
</xsl:otherwise>

</xsl:choose>

</xsl:template>

<xsl:template name="images-in-page-div">

	<xsl:param name="image-page" />
	<xsl:param name="image" />
	
	<xsl:if test="
		($image-page = 'all') or 
		(($image-page = 'right') and (@number mod 2 = 1)) or 
		(($image-page = 'left')  and (@number mod 2 = 0)) or 
		($image-page = @number)"
		>

	<xsl:element name="div">
	
		<xsl:attribute name="style">		
			<xsl:choose>
			<xsl:when test="$page = 0">
				<xsl:call-template name="style-position">
					<xsl:with-param name="left" select="$image/@x" />
					<xsl:with-param name="top" select="$image/@y" />
					<xsl:with-param name="height" select="$image/@height" />
					<xsl:with-param name="width" select="$image/@width" />				
				</xsl:call-template>	</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="style-position">
					<xsl:with-param name="left" select="$image/@x" />
					<xsl:with-param name="top" select="$image/@y + ((@number - 1) * $image/@y)" />
					<xsl:with-param name="height" select="$image/@height" />
					<xsl:with-param name="width" select="$image/@width" />				
				</xsl:call-template>	
			</xsl:otherwise>
			</xsl:choose>		
		</xsl:attribute> 
		
		<xsl:attribute name="id">
			<xsl:value-of select="$image/@id" />
		</xsl:attribute>

		<xsl:element name="img">
		
			<xsl:choose>
				<xsl:when test="$image_reference = 'cid'">
					<xsl:attribute name="src">
						<xsl:value-of select="concat('cid:', $image/@id)" />
					</xsl:attribute> 
				</xsl:when>	
				<xsl:when test="$image_reference = 'data_uri'">
					<xsl:attribute name="src">
						<xsl:value-of select="concat('data:image/', $image/@format, ';base64,', $image/@data)" />
					</xsl:attribute> 
				</xsl:when>					
			</xsl:choose>
				
			<xsl:attribute name="width"><xsl:value-of select="concat($image/@width, 'px')" /></xsl:attribute>
			<xsl:attribute name="height"><xsl:value-of select="concat($image/@height, 'px')" /></xsl:attribute>

		</xsl:element>	
				
	</xsl:element> 
	
	</xsl:if>
	
</xsl:template>

</xsl:stylesheet>