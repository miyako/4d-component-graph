<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"		
				xmlns="http://www.w3.org/1999/xhtml"																	
                exclude-result-prefixes="xsl str"
                >

<xsl:template name="document-title">
	<!-- no meta will cause error on IE -->	
	<meta charset="utf-8" />
	<!-- empty title will cause error on IE -->
	<xsl:choose>
	<xsl:when test="string-length(/document/@title) != 0">
	<title><xsl:value-of select="/document/@title" /></title>		
	</xsl:when>
	<xsl:otherwise>
	<title>DOCUMENT</title>	
	</xsl:otherwise>
	</xsl:choose>
	
	<xsl:if test="string-length(/document/@language) != 0">
		<meta http-equiv="content-language" content="{/document/@language}" />	
	</xsl:if>
		
	<xsl:if test="string-length(/document/@subject) != 0">
		<meta name="subject" content="{/document/@subject}" />
	</xsl:if>
	
	<xsl:if test="string-length(/document/@notes) != 0">
		<meta name="notes" content="{/document/@notes}" />	
	</xsl:if>	

	<xsl:if test="string-length(/document/@company) != 0">
		<meta name="company" content="{/document/@company}" />	
	</xsl:if>
	
	<xsl:if test="string-length(/document/@author) != 0">
		<meta name="author" content="{/document/@author}" />	
	</xsl:if>
		
</xsl:template>

<xsl:template name="body-attributes">
	<xsl:attribute name="contenteditable">
	<xsl:value-of select="boolean($content_editable = 'true')" />
	</xsl:attribute>
</xsl:template>

<xsl:template name="body-page">

<xsl:choose>

<xsl:when test="$page = 0">
	<xsl:for-each select="/document/body/page">
	<xsl:variable name="page_id" select="concat('paper_page_', @number)" />
		<div id="{$page_id}">
		<xsl:attribute name="style">
		<xsl:call-template name="style-position">
			<xsl:with-param name="left" select="../../@left" />
			<xsl:with-param name="top" select="../../@top + ((@number - 1) * ../../@height)" />
			<xsl:with-param name="height" select="../../@height" />
			<xsl:with-param name="width" select="../../@width" />			
		</xsl:call-template>	
		</xsl:attribute>
		<xsl:comment><xsl:value-of select="$page_id" /></xsl:comment>
		</div>		
	</xsl:for-each>
</xsl:when>	

<xsl:otherwise>	
	<xsl:for-each select="/document/body/page[@number = $page]">
	<xsl:variable name="page_id" select="concat('paper_page_', @number)" />	
		<div id="{$page_id}">
		<xsl:attribute name="style">
		<xsl:call-template name="style-position">
			<xsl:with-param name="left" select="../../@left" />
			<xsl:with-param name="top" select="../../@top + ((@number - 1) * ../../@height)" />
			<xsl:with-param name="height" select="../../@height" />
			<xsl:with-param name="width" select="../../@width" />			
		</xsl:call-template>	
		</xsl:attribute>
		<xsl:comment><xsl:value-of select="$page_id" /></xsl:comment>
		</div>		
	</xsl:for-each>
</xsl:otherwise>

</xsl:choose>	
	
</xsl:template>

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
		<xsl:variable name="column_id" select="concat('page_', ../@number, '_column_', @number)" />
		<div id="{$column_id}">

		<xsl:attribute name="style">
			<xsl:call-template name="style-position">
				<xsl:with-param name="left" select="@left" />
				<xsl:with-param name="top" select="@top + ((../@number - 1) * /document/@height)" />
				<xsl:with-param name="height" select="@height" />
				<xsl:with-param name="width" select="@width" />				
			</xsl:call-template>	
			<xsl:call-template name="style-text" />			
		</xsl:attribute>
		
		<xsl:comment><xsl:value-of select="$column_id" /></xsl:comment>
		
		<xsl:for-each select="line">
		<xsl:variable name="line_id" select="concat('page_', ../../@number, '_column_', ../@number, '_line_', @number)" />		
		<div id="{$line_id}">
						
			<xsl:attribute name="style">
				<xsl:call-template name="style-text" />
				<xsl:call-template name="style-border" />				
			</xsl:attribute>
		
			<xsl:comment><xsl:value-of select="$line_id" /></xsl:comment>
					
			<xsl:for-each select="spans/span">
			<xsl:variable name="span_id" select="concat('page_', ../../../../@number, '_column_', ../../../@number, '_line_', ../../@number, '_span_', @start, '_', @end)" />				
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

	<xsl:choose>
		
		<xsl:when test="@href">
			<xsl:element name="a">
				<xsl:attribute name="style">
					<xsl:call-template name="style-text" />													
				</xsl:attribute>		
				<xsl:attribute name="href">
					<xsl:value-of select="@href" />													
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="'_blank'" />													
				</xsl:attribute>	
				<xsl:value-of select="@text" />			
			</xsl:element>		
		</xsl:when>
		
		<xsl:when test="@data">
			<xsl:element name="img">
			
				<xsl:attribute name="style">
					<xsl:call-template name="style-text" />													
				</xsl:attribute>		

				<xsl:choose>
				
					<xsl:when test="$image_reference = 'cid'">
						<xsl:attribute name="src">
							<xsl:value-of select="concat('cid:', @id)" />
						</xsl:attribute> 
					</xsl:when>	
					
					<xsl:when test="$image_reference = 'data_uri'">
						<xsl:attribute name="src">
							<xsl:value-of select="concat('data:image/', @format, ';base64,', @data)" />
						</xsl:attribute> 
					</xsl:when>	
										
				</xsl:choose>
			
				<xsl:attribute name="width"><xsl:value-of select="concat(@width, 'px')" /></xsl:attribute>
				<xsl:attribute name="height"><xsl:value-of select="concat(@height, 'px')" /></xsl:attribute>
				
			</xsl:element>		
		</xsl:when>	
	
		<xsl:otherwise>

			<xsl:choose>
							
				<xsl:when test="string-length(@text) = 0">
					<xsl:value-of select="string('&amp;#160;')" disable-output-escaping="yes" />
				</xsl:when>
				
				<xsl:otherwise>
					<xsl:value-of select="@text" />	
				</xsl:otherwise>
											
			</xsl:choose>	
											
		</xsl:otherwise>
				
	</xsl:choose>
		
	</xsl:otherwise>	
	</xsl:choose>
	
</xsl:template>

<xsl:template name="import-jquery">
	<xsl:if test="$include_jquery = 'true'">
		<xsl:variable name="jquery-js" select="document('../../scripts/jquery.xml')/scripts/script[@version='1.4.2']" />		
		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$jquery-js" />		
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="script">

	<xsl:param name="node" />
	<xsl:variable name="CDATA-START">
	<xsl:value-of select="string('//&lt;![CDATA[')" />
	</xsl:variable>
	<xsl:variable name="CDATA-END">
	<xsl:value-of select="string('//]]&gt;')" />
	</xsl:variable>

	<script type="{$node/@type}">
	<xsl:call-template name="escape-in" />
		<xsl:value-of select="$node" disable-output-escaping="yes" />
	<xsl:call-template name="escape-out" />
	</script>
			
</xsl:template>

<xsl:template name="escape-in">
<xsl:choose>
<xsl:when test="$format='xhtml'"><!-- xhtml 1.0 style -->	
		<xsl:value-of select="string('//&lt;![CDATA[')" disable-output-escaping="yes" />
</xsl:when>
<xsl:otherwise><!-- html 4.01 style -->
	<!--we cannot use xs:comment because double dashes may appear -->
	<xsl:value-of select="string('&lt;!--')" disable-output-escaping="yes" />
</xsl:otherwise>
</xsl:choose>	
</xsl:template>

<xsl:template name="escape-out">
<xsl:choose>
<xsl:when test="$format='xhtml'"><!-- xhtml 1.0 style -->	
		<xsl:value-of select="string('//]]&gt;')" disable-output-escaping="yes" />
</xsl:when>
<xsl:otherwise><!-- html 4.01 style -->
	<!--we cannot use xs:comment because double dashes may appear -->
	<xsl:value-of select="string('//--&gt;')" disable-output-escaping="yes" />
</xsl:otherwise>
</xsl:choose>	
</xsl:template>

</xsl:stylesheet>