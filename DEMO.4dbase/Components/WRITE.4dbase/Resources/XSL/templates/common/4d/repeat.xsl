<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"																			
                exclude-result-prefixes="xsl str"
                >

<xsl:template name="header-div">

<xsl:param name="node" />
<xsl:param name="page" select="0" />
		
	<xsl:for-each select="$node/column[1]">

	<span>
	
	<xsl:attribute name="style">	
		<xsl:call-template name="style-text" />			
	</xsl:attribute>
						
	<xsl:for-each select="line">
		
	<span>
					
		<xsl:attribute name="style">
			<xsl:call-template name="style-text" />
		</xsl:attribute>
				
		<xsl:for-each select="spans/span">				
			<span>
			
				<xsl:if test="@background-color != 'none' or 
					@color or
					@font-family or
					@font-size or
					@font-style or
					@font-weight"																									
				>
				
				<xsl:attribute name="style">
					<xsl:call-template name="style-text" />
				</xsl:attribute>
			</xsl:if>					
								
				<xsl:call-template name="text" />				
			
			</span>		
								
		</xsl:for-each>	
	
	</span>
							
	</xsl:for-each>
			
	</span>	
	</xsl:for-each>
				
</xsl:template>

<xsl:template name="footer-div">

<xsl:param name="node" />
<xsl:param name="page" select="0" />

	<xsl:for-each select="$node/column[1]">
	
	<span>
	
	<xsl:attribute name="style">
		<xsl:call-template name="style-text" />			
	</xsl:attribute>
			
	<xsl:for-each select="line">
		
	<span>
					
		<xsl:attribute name="style">
			<xsl:call-template name="style-text" />
		</xsl:attribute>
				
		<xsl:for-each select="spans/span">
			
			<span>
			
			<xsl:if test="@background-color != 'none' or 
				@color or
				@font-family or
				@font-size or
				@font-style or
				@font-weight"
			>
				<xsl:attribute name="style">
					<xsl:call-template name="style-text" />
				</xsl:attribute>
			</xsl:if>					
								
				<xsl:call-template name="text" />				
			
			</span>		
								
		</xsl:for-each>	
	
	</span>
							
	</xsl:for-each>
			
	</span>	
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