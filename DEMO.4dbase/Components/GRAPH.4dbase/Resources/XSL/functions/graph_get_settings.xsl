<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >
				
  <xsl:strip-space elements="*" />
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:template match="/">
 <xsl:copy-of select="graph/settings" />
</xsl:template>
</xsl:stylesheet>
