<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"																		
                exclude-result-prefixes="xsl str"
                >

<xsl:template name="body-header">

<xsl:choose>

<xsl:when test="$page = 0">
	<xsl:for-each select="/document/body/page">
		<xsl:call-template name="header">
			<xsl:with-param name="side" select="@side" />
			<xsl:with-param name="page" select="@number" />	
		</xsl:call-template>
	</xsl:for-each>
</xsl:when>	

<xsl:otherwise>	
	<xsl:for-each select="/document/body/page[@number = $page]">
		<xsl:call-template name="header">
			<xsl:with-param name="side" select="@side" />
			<xsl:with-param name="page" select="@number" />	
		</xsl:call-template>
	</xsl:for-each>
</xsl:otherwise>

</xsl:choose>	

</xsl:template>

<xsl:template name="body-footer">

<xsl:choose>

<xsl:when test="$page = 0">
	<xsl:for-each select="/document/body/page">
		<xsl:call-template name="footer">
			<xsl:with-param name="side" select="@side" />
			<xsl:with-param name="page" select="@number" />			
		</xsl:call-template>
	</xsl:for-each>
</xsl:when>	

<xsl:otherwise>	
	<xsl:for-each select="/document/body/page[@number = $page]">
		<xsl:call-template name="footer">
			<xsl:with-param name="side" select="@side" />
			<xsl:with-param name="page" select="@number" />			
		</xsl:call-template>
	</xsl:for-each>
</xsl:otherwise>

</xsl:choose>

</xsl:template>

<xsl:template name="body-column">

		<xsl:for-each select="/document/body/page/column">

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

<xsl:template name="text">

	<xsl:choose>
	
		<xsl:when test="@formula">
		<xsl:comment>
			<xsl:choose>
			
				<xsl:when test="$text_reference = '4d_html'">
					<xsl:value-of select="concat('#4DHTML ', @formula)" />	
				</xsl:when>	
				
				<xsl:when test="$text_reference = '4d_text'">
					<xsl:value-of select="concat('#4DTEXT ', @formula)" />	
				</xsl:when>
				
				<xsl:when test="$text_reference = '4d_var'">
					<xsl:value-of select="concat('#4DVAR ', @formula)" />	
				</xsl:when>	
				
				<xsl:when test="$text_reference = '4d_htmlvar'">
					<xsl:value-of select="concat('#4DHTMLVAR ', @formula)" />	
				</xsl:when>		
									
			</xsl:choose>	
			</xsl:comment>
		</xsl:when>
	
	<xsl:otherwise>
		<xsl:value-of select="@text" />	
	</xsl:otherwise>	
	
	</xsl:choose>
	
</xsl:template>

</xsl:stylesheet>