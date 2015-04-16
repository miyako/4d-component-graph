<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:str="http://exslt.org/strings"
                >
<xsl:output method="text" />

<xsl:template match="/">
 <xsl:value-of select="str:encode-uri(/string-to-encode, false)" />
</xsl:template>
</xsl:stylesheet>
