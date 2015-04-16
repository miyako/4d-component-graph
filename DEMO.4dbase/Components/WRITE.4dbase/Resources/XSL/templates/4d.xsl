<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"																
                exclude-result-prefixes="xsl str"
                >

<xsl:import href="common/4d/style.xsl" />
<xsl:import href="common/4d/repeat.xsl" />
<xsl:import href="common/4d/common.xsl" />

<xsl:output method="xml" 
			indent="no"
			omit-xml-declaration="yes"
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
 
	<xsl:call-template name="body-header" />	
	<xsl:call-template name="body-column" />		
	<xsl:call-template name="body-footer" />

</xsl:template>

</xsl:stylesheet>