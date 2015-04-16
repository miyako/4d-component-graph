<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:import href="common/elycharts_common.xsl" />
<xsl:import href="common/elycharts_templates.xsl" />
<xsl:import href="common/elycharts_series.xsl" />

<xsl:import href="../default/common/graph_settings.xsl" />
<xsl:import href="../default/common/html_common.xsl" />

<xsl:strip-space elements="*" />
<xsl:output method="xml" indent="no" />
						  
<xsl:template match="/">

<html>
    <head>

		<!-- no meta will cause error on IE -->	
		<meta charset="utf-8" />

		<!-- empty title will cause error on IE -->
		<title>GRAPH</title>

		<xsl:call-template name="import-scripts" />
						
    </head>
	
    <body>
		
		<div id="chart" style="{concat('width: ', $width - 25, 'px; ', 'height: ', $height - 25, 'px; margin: 0 auto')}"></div>

		<script type="text/javascript">			
			<xsl:comment>
			<xsl:call-template name="import-template-chart3" />			
			<xsl:text>
			$('#chart').chart({
				template : 'chart3',
			</xsl:text>
			<xsl:call-template name="series-column-tips">
				<xsl:with-param name="v" select="/graph/x_values/v" />					
			</xsl:call-template>
			<xsl:text>
			</xsl:text>
			<xsl:call-template name="series-column">
				<xsl:with-param name="v" select="/graph/legend/v" />					
			</xsl:call-template>
			<xsl:text>
			</xsl:text>
			<xsl:call-template name="series-column-labels">
				<xsl:with-param name="v" select="/graph/x_values/v" />					
			</xsl:call-template>
			<xsl:text>			 
				margins : [30, 30, 30, 30]							 
			});
			</xsl:text>
			</xsl:comment>			
		</script>
		
    </body>
		
</html>			

</xsl:template>

</xsl:stylesheet>