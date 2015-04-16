<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"		
				xmlns="http://www.w3.org/1999/xhtml"																	
                exclude-result-prefixes="xsl str"
                >

<xsl:template name="header-div">

<xsl:param name="node" />
<xsl:param name="page" select="0" />
		
	<xsl:for-each select="$node/column[1]">
	<xsl:variable name="header_id" select="concat('header_page_', $page)" />
	<div id="{$header_id}">
	
	<xsl:attribute name="style">
		<xsl:call-template name="style-position">
			<xsl:with-param name="left" select="@left" />
			<xsl:with-param name="top" select="@top + (($page - 1) * /document/@height)" />
			<xsl:with-param name="height" select="@height" />
			<xsl:with-param name="width" select="@width" />				
		</xsl:call-template>	
		<xsl:call-template name="style-text" />			
	</xsl:attribute>
			
	<xsl:comment><xsl:value-of select="$header_id" /></xsl:comment>		
			
	<xsl:for-each select="line">
	<xsl:variable name="line_id" select="concat('header_page_', $page, '_line_', @number)" />		
	<div id="{$line_id}">
					
		<xsl:attribute name="style">
			<xsl:call-template name="style-text" />
			<xsl:call-template name="style-border" />
		</xsl:attribute>
	
		<xsl:comment><xsl:value-of select="$line_id" /></xsl:comment>
				
		<xsl:for-each select="spans/span">
		<xsl:variable name="span_id" select="concat('header_page_', $page, '_line_', ../../@number, '_span_', @start, '_', @end)" />				
			<span id="{$span_id}">
			
				<xsl:if test="@background-color != 'none' or 
					@color or
					@font-family or
					@font-size or
					@font-style or
					@font-weight or 
					@line-height or 
					@padding-left or
					@padding-top or
					@padding-bottom or
					@padding-right"																									
				>
				
				<xsl:attribute name="style">
					<xsl:call-template name="style-text" />
				</xsl:attribute>
			</xsl:if>					
				
				<xsl:comment><xsl:value-of select="$span_id" /></xsl:comment>	
								
				<xsl:call-template name="text" />				
			
			</span>		
								
		</xsl:for-each>	
		
		<xsl:if test="count(spans/span) = 0">
		<span><xsl:value-of select="string('&amp;#160;')" disable-output-escaping="yes" /></span>	
		</xsl:if>																	
	
	</div>
							
	</xsl:for-each>
			
	</div>	
	</xsl:for-each>
				
</xsl:template>

<xsl:template name="footer-div">

<xsl:param name="node" />
<xsl:param name="page" select="0" />

	<xsl:for-each select="$node/column[1]">
	<xsl:variable name="footer_id" select="concat('footer_page_', $page)" />
	<div id="{$footer_id}">
	
	<xsl:attribute name="style">
		<xsl:call-template name="style-position">
			<xsl:with-param name="left" select="@left" />
			<xsl:with-param name="top" select="@top + (($page - 1) * /document/@height)" />
			<xsl:with-param name="height" select="@height" />
			<xsl:with-param name="width" select="@width" />				
		</xsl:call-template>	
		<xsl:call-template name="style-text" />			
	</xsl:attribute>
			
	<xsl:comment><xsl:value-of select="$footer_id" /></xsl:comment>		
			
	<xsl:for-each select="line">
	<xsl:variable name="line_id" select="concat('footer_page_', $page, '_line_', @number)" />		
	<div id="{$line_id}">
					
		<xsl:attribute name="style">
			<xsl:call-template name="style-text" />
		</xsl:attribute>
	
		<xsl:comment><xsl:value-of select="$line_id" /></xsl:comment>
				
		<xsl:for-each select="spans/span">
		<xsl:variable name="span_id" select="concat('footer_page_', $page, '_line_', ../../@number, '_span_', @start, '_', @end)" />				
			<span id="{$span_id}">
			
				<xsl:if test="@background-color != 'none' or 
					@color or
					@font-family or
					@font-size or
					@font-style or
					@font-weight or 
					@line-height or 
					@padding-left or
					@padding-top or
					@padding-bottom or
					@padding-right"																									
				>
				
				<xsl:attribute name="style">
					<xsl:call-template name="style-text" />
				</xsl:attribute>
			</xsl:if>					
				
				<xsl:comment><xsl:value-of select="$span_id" /></xsl:comment>	
								
				<xsl:call-template name="text" />				
			
			</span>		
								
		</xsl:for-each>	
		
		<xsl:if test="count(spans/span) = 0">
		<span><xsl:value-of select="string('&amp;#160;')" disable-output-escaping="yes" /></span>	
		</xsl:if>																	
	
	</div>
							
	</xsl:for-each>
			
	</div>	
	</xsl:for-each>
		
</xsl:template>

<xsl:template name="header">

<xsl:param name="side" select="'right'" />
<xsl:param name="page" select="0" />

	<xsl:choose>
	
		<xsl:when test="$side = 'right'">
			<xsl:call-template name="header-div">
				<xsl:with-param name="node" select="/document/header-right/page[1]" />
				<xsl:with-param name="page" select="$page" />
			</xsl:call-template> 			
		</xsl:when>
		
		<xsl:when test="$side = 'left'">
			<xsl:call-template name="header-div">
				<xsl:with-param name="node" select="/document/header-left/page[1]" />
				<xsl:with-param name="page" select="$page" />
			</xsl:call-template> 			
		</xsl:when>
		
		<xsl:when test="$side = 'first'">
			<xsl:call-template name="header-div">
				<xsl:with-param name="node" select="/document/header-first/page[1]" />
				<xsl:with-param name="page" select="$page" />
			</xsl:call-template> 			
		</xsl:when>				

	</xsl:choose>

</xsl:template>

<xsl:template name="footer">

<xsl:param name="side" select="'right'" />
<xsl:param name="page" select="0" />

	<xsl:choose>
	
		<xsl:when test="$side = 'right'">
			<xsl:call-template name="footer-div">
				<xsl:with-param name="node" select="/document/footer-right/page[1]" />
				<xsl:with-param name="page" select="$page" />				
			</xsl:call-template> 			
		</xsl:when>
		
		<xsl:when test="$side = 'left'">
			<xsl:call-template name="footer-div">
				<xsl:with-param name="node" select="/document/footer-left/page[1]" />
				<xsl:with-param name="page" select="$page" />
			</xsl:call-template> 			
		</xsl:when>
		
		<xsl:when test="$side = 'first'">
			<xsl:call-template name="footer-div">
				<xsl:with-param name="node" select="/document/footer-first/page[1]" />
				<xsl:with-param name="page" select="$page" />
			</xsl:call-template> 			
		</xsl:when>				

	</xsl:choose>

</xsl:template>

</xsl:stylesheet>