<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:import href="../../common/highcharts_common.xsl" />
<xsl:import href="../../../default/common/html_common.xsl" />
<xsl:import href="common/highcharts_series.xsl" />
<xsl:import href="../../../default/common/graph_settings.xsl" />

<xsl:strip-space elements="*" />
<xsl:output method="text" indent="no" />

<xsl:template match="/">

	<xsl:variable name="total" select="sum(/graph/y_values/v)" />
	
	<xsl:call-template name="series-pie">
		<xsl:with-param name="v" select="/graph/legend/v" />
		<xsl:with-param name="total" select="$total" />						
	</xsl:call-template>

</xsl:template>

</xsl:stylesheet>