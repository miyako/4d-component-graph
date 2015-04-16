<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:str="http://exslt.org/strings"				
				xmlns="http://www.w3.org/1999/xhtml"													
                exclude-result-prefixes="xsl str"
                >
				
<xsl:output method="xml" 
			indent="yes"
			omit-xml-declaration="no" 
			/>
							
<xsl:template match="/">

<xliff version="1.0">
    <file datatype="x-STR#" original="undefined" product-version="v11" source-language="en-US" target-language="ja">
        <header>
            <note />
        </header>
        <body>
            <group>
	<xsl:for-each select="fonts/font">

		<xsl:call-template name="trans-unit">
			<xsl:with-param name="suffix" select="'-j'" />		
			<xsl:with-param name="resname" select="@display-name" />		
		</xsl:call-template>

		<xsl:call-template name="trans-unit">
			<xsl:with-param name="suffix" select="'-e'" />		
			<xsl:with-param name="resname" select="@name" />		
		</xsl:call-template>
	</xsl:for-each>
	
            </group>	
        </body>
    </file>
</xliff>	
</xsl:template>


<xsl:template name="trans-unit">
<xsl:param name="prefix" select="'1-'" />
<xsl:param name="suffix" />
<xsl:param name="resname"  />
		<xsl:if test="string-length($resname) != 0">
		<trans-unit id="{concat($prefix, position(), $suffix)}" resname="{$resname}">
			<target>
			
			<xsl:if test="(string-length(@name) != 0)">
					<xsl:choose>
					<xsl:when test="contains(@name,' ')">
					<xsl:value-of select="concat(&quot;&apos;&quot;, @name, &quot;&apos;&quot;)" />			
					</xsl:when>
					<xsl:otherwise>
					<xsl:value-of select="@name" />
					</xsl:otherwise>									
					</xsl:choose>	
			</xsl:if>
			
			<xsl:if test="string-length(@display-name) != 0">
				<xsl:if test="not(starts-with(@name,'MS'))">
					<xsl:if test="(string-length(@name) != 0)">
						<xsl:value-of select="','" />
					</xsl:if>
					<xsl:choose>
					<xsl:when test="contains(@display-name,' ')">
					<xsl:value-of select="concat(&quot;&apos;&quot;, @display-name, &quot;&apos;&quot;)" />			
					</xsl:when>
					<xsl:otherwise>
					<xsl:value-of select="@display-name" />
					</xsl:otherwise>									
					</xsl:choose>	
				</xsl:if>
			</xsl:if>

			<xsl:if test="string-length(@postscript-name) != 0">
				<xsl:if test="not(starts-with(@name,'MS'))">
					<xsl:if test="(string-length(@name) != 0)">
						<xsl:value-of select="','" />
					</xsl:if>
					<xsl:choose>
					<xsl:when test="contains(@postscript-name,' ')">
					<xsl:value-of select="concat(&quot;&apos;&quot;, @postscript-name, &quot;&apos;&quot;)" />			
					</xsl:when>
					<xsl:otherwise>
					<xsl:value-of select="@postscript-name" />
					</xsl:otherwise>									
					</xsl:choose>	
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="@serif">	
				<xsl:value-of select="','" />								
				<xsl:choose>
				<xsl:when test="@serif = 1">
				<xsl:value-of select="'serif'" />			
				</xsl:when>
				<xsl:otherwise>
				<xsl:value-of select="'sans-serif'" />
				</xsl:otherwise>									
				</xsl:choose>
			</xsl:if>
							
			</target>		
		</trans-unit>
		</xsl:if>
</xsl:template>
		
</xsl:stylesheet>