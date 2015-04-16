<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:wr="http://www.4D.com/namespace/write/v11"
				xmlns:db4d="http://www.4D.com/namespace/db4d/v11"	
				xmlns:str="http://exslt.org/strings"	
				xmlns:set="http://exslt.org/sets"											
                exclude-result-prefixes="xsl wr db4d str set"
                >

<xsl:decimal-format name="numeric" NaN="0" />

<xsl:param name="boundary1" />
<xsl:param name="boundary2" />
	
<xsl:output method="text" /> 

<xsl:template match="/eml[1]">

	<xsl:for-each select="/eml/headers/header">
	<xsl:sort select="./@name" />
		<xsl:value-of select="concat(@name, ': ', @value, '&#xD;&#xA;')" />
	</xsl:for-each>
		
	<xsl:text>Content-Type: multipart/related;&#xD;&#xA;</xsl:text>
	<xsl:text>&#x9;boundary=</xsl:text><xsl:value-of select="concat('&quot;', $boundary1, '&quot;;&#xD;&#xA;')" />
	<xsl:text>&#x9;type=&quot;multipart/alternative&quot;&#xD;&#xA;</xsl:text>	
	<xsl:text>MIME-Version: 1.0&#xD;&#xA;</xsl:text>
	<xsl:text>&#xD;&#xA;</xsl:text>	
				
	<xsl:value-of select="concat('--', $boundary1)" /><xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>Content-Type: multipart/alternative;&#xD;&#xA;</xsl:text>
	<xsl:text>&#x9;boundary=</xsl:text><xsl:value-of select="concat('&quot;', $boundary2, '&quot;&#xD;&#xA;')" />
	<xsl:text>&#xD;&#xA;</xsl:text>
	
	<xsl:value-of select="concat('--', $boundary2)" /><xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>Content-Type: text/plain; charset=&quot;utf-8&quot;&#xD;&#xA;</xsl:text>
	<xsl:text>Content-Transfer-Encoding: base64</xsl:text><xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:value-of select="@text-data" />
	<xsl:text>&#xD;&#xA;</xsl:text>	
	<xsl:text>&#xD;&#xA;</xsl:text>
	
	<xsl:value-of select="concat('--', $boundary2)" /><xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>Content-Type: text/html; charset=&quot;utf-8&quot;</xsl:text><xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>Content-Transfer-Encoding: base64</xsl:text><xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:value-of select="@html-data" />

	<xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>&#xD;&#xA;</xsl:text>	
	
	<xsl:value-of select="concat('--', $boundary2, '--')" /><xsl:text>&#xD;&#xA;</xsl:text>
	<xsl:text>&#xD;&#xA;</xsl:text>	
	
	<xsl:for-each select="./image">
		<xsl:value-of select="concat('--', $boundary1)" /><xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:text>Content-Type: image/png;&#xD;&#xA;</xsl:text>
		<xsl:value-of select="concat('Content-ID: ', ./@cid, '&#xD;&#xA;')" />
		<xsl:text>Content-Transfer-Encoding: base64</xsl:text><xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:value-of select="@data" />	
		<xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:text>&#xD;&#xA;</xsl:text>
	</xsl:for-each>				
	
	<xsl:for-each select="./attachment">
		<xsl:value-of select="concat('--', $boundary1)" /><xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:text>Content-Type: application/octet-stream;&#xD;&#xA;</xsl:text>
		<xsl:text> name=&quot;</xsl:text><xsl:value-of select="@rfc" /><xsl:text>&quot;</xsl:text>
		<xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:text>Content-Disposition: attachment;</xsl:text> 	
		<xsl:text>&#xD;&#xA;</xsl:text>				
		<xsl:text> filename*=&quot;utf-8''</xsl:text><xsl:value-of select="./@uri" /><xsl:text>&quot;;</xsl:text>	
		<xsl:text>&#xD;&#xA;</xsl:text>			
		<xsl:text> size=</xsl:text><xsl:value-of select="./@size" /><xsl:text></xsl:text>
		<xsl:text>&#xD;&#xA;</xsl:text>	
		<xsl:value-of select="concat('Content-ID: ', ./@cid, '&#xD;&#xA;')" />
		<xsl:text>Content-Transfer-Encoding: base64</xsl:text><xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:value-of select="@data" />	
		<xsl:text>&#xD;&#xA;</xsl:text>
		<xsl:text>&#xD;&#xA;</xsl:text>	
	</xsl:for-each>	
	
	<xsl:value-of select="concat('--', $boundary1, '--')" /><xsl:text>&#xD;&#xA;</xsl:text>																																																									
			
</xsl:template>
</xsl:stylesheet>