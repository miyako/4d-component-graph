<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				xmlns:set="http://exslt.org/sets" 
				exclude-result-prefixes="xsl str exsl4D math set"
                >
				
  <xsl:strip-space elements="*" />
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:param name="settings-path-encoded" select="'settings.xml'" />
<xsl:param name="settings-path" select="str:decode-uri($settings-path-encoded)" />
<xsl:param name="settings" select="document($settings-path)" />

<xsl:template match="node()|@*">

<xsl:choose>
	<xsl:when test="set:has-same-node(. , /graph/settings)">
		<xsl:copy-of select="$settings/settings" />
	</xsl:when>
	<xsl:otherwise>
		<xsl:copy>
			<xsl:apply-templates select="node()|@*" />
		</xsl:copy>
	</xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>