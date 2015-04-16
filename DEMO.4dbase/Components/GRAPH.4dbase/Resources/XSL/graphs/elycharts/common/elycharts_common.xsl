<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:strip-space elements="*" />
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:template name="import-scripts">
	<xsl:variable name="jquery-js" select="document('../../scripts/jquery.xml')/scripts/script[@version='1.4.2']" />
	<xsl:variable name="elycharts-js" select="document('../../scripts/elycharts.xml')/scripts/script[@id='elycharts' and @version='2.1.4']" />
	<xsl:variable name="raphael-js" select="document('../../scripts/raphael.xml')/scripts/script[@id='raphael' and @version='1.5.2']" />

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$jquery-js" />		
		</xsl:call-template>

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$raphael-js" />		
		</xsl:call-template>

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$elycharts-js" />		
		</xsl:call-template>
		
						
</xsl:template>

<!-- function for json escape -->

<xsl:template name="escape-string">
	<xsl:param name="s"/>
	<xsl:text>&apos;</xsl:text>
	<xsl:call-template name="escape-bs-string">
		<xsl:with-param name="s" select="$s"/>
	</xsl:call-template>
	<xsl:text>&apos;</xsl:text>
</xsl:template>

<xsl:template name="escape-bs-string">
	<xsl:param name="s"/>
	<xsl:choose>
		<xsl:when test="contains($s,'\')">
			<xsl:call-template name="escape-quot-string">
				<xsl:with-param name="s" select="concat(substring-before($s,'\'),'\\')"/>
			</xsl:call-template>
			<xsl:call-template name="escape-bs-string">
				<xsl:with-param name="s" select="substring-after($s,'\')"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="escape-quot-string">
				<xsl:with-param name="s" select="$s"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="escape-quot-string">
	<xsl:param name="s"/>
	<xsl:choose>
		<xsl:when test="contains($s,'&quot;')">
			<xsl:choose>
			<xsl:when test="contains($s,&quot;&apos;&quot;)">
				<xsl:call-template name="encode-string">
					<xsl:with-param name="s" select="concat(substring-before($s,&quot;&apos;&quot;),&quot;\&apos;&quot;)"/>
				</xsl:call-template>
				<xsl:call-template name="escape-quot-string">
					<xsl:with-param name="s" select="substring-after($s,&quot;&apos;&quot;)"/>
				</xsl:call-template>				
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="encode-string">
					<xsl:with-param name="s" select="concat(substring-before($s,'&quot;'),'\&quot;')"/>
				</xsl:call-template>
				<xsl:call-template name="escape-quot-string">
					<xsl:with-param name="s" select="substring-after($s,'&quot;')"/>
				</xsl:call-template>	
			</xsl:otherwise>
			</xsl:choose>			
		</xsl:when>
		<xsl:when test="contains($s,&quot;&apos;&quot;)">
			<xsl:call-template name="encode-string">
				<xsl:with-param name="s" select="concat(substring-before($s,&quot;&apos;&quot;),&quot;\&apos;&quot;)"/>
			</xsl:call-template>
			<xsl:call-template name="escape-quot-string">
				<xsl:with-param name="s" select="substring-after($s,&quot;&apos;&quot;)"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="encode-string">
				<xsl:with-param name="s" select="$s"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="encode-string">
	<xsl:param name="s"/>
	<xsl:choose>
		<xsl:when test="contains($s,'&#x9;')">
			<xsl:call-template name="encode-string">
				<xsl:with-param name="s" select="concat(substring-before($s,'&#x9;'),'\t',substring-after($s,'&#x9;'))"/>
			</xsl:call-template>
		</xsl:when>
	<xsl:when test="contains($s,'&#xA;')">
		<xsl:call-template name="encode-string">
			<xsl:with-param name="s" select="concat(substring-before($s,'&#xA;'),'\n',substring-after($s,'&#xA;'))"/>
		</xsl:call-template>
	</xsl:when>
	<xsl:when test="contains($s,'&#xD;')">
		<xsl:call-template name="encode-string">
			<xsl:with-param name="s" select="concat(substring-before($s,'&#xD;'),'\r',substring-after($s,'&#xD;'))"/>
		</xsl:call-template>
	</xsl:when>
	<xsl:otherwise><xsl:value-of select="$s"/></xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>