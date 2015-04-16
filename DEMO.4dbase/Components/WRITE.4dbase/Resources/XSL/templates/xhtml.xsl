<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"				
				xmlns="http://www.w3.org/1999/xhtml"													
                exclude-result-prefixes="xsl str"
                >

<xsl:import href="common/html/style.xsl" />
<xsl:import href="common/html/repeat.xsl" />
<xsl:import href="common/html/common.xsl" />
<xsl:import href="common/html/images.xsl" />

<xsl:output method="xml" 
			indent="no"
			omit-xml-declaration="no"
			/>
															
<xsl:decimal-format name="decimal" NaN="0" />

<xsl:param name="page" select="0" />
<xsl:param name="include_jquery" select="'false'" />
<xsl:param name="content_editable" select="'false'" />
<xsl:param name="text_reference" select="'4d_text'" />
<xsl:param name="image_reference" select="'data_uri'" />
<xsl:param name="format" select="'html'" /><!-- comment format, should be left unchanged -->

<xsl:strip-space elements="*" />

<xsl:template match="/">
 
	<html>

	<header>
		<xsl:call-template name="document-title" />
		<xsl:call-template name="import-jquery" />
	</header>

	<body>
		<xsl:call-template name="body-attributes" />
		<xsl:call-template name="body-page" />	
		<xsl:call-template name="images-behind" />
		<xsl:call-template name="body-header" />	
		<xsl:call-template name="body-column" />		
		<xsl:call-template name="body-footer" />
		<xsl:call-template name="images-in-front" />	
	</body>

	</html>

</xsl:template>

</xsl:stylesheet>