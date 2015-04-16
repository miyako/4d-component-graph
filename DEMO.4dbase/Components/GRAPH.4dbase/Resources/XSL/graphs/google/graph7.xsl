<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:import href="common/google_common.xsl" />
<xsl:import href="common/google_series.xsl" />
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
	
		<xsl:variable name="total" select="sum(/graph/y_values/v)" />
				
		<script type="text/javascript">	
			<xsl:comment>
			<xsl:text>
			google.setOnLoadCallback(drawChart);
			function drawChart() {
			var data = new google.visualization.DataTable();			
			</xsl:text>			
			<xsl:call-template name="series-pie">
				<xsl:with-param name="v" select="/graph/legend_pie/v" />
				<xsl:with-param name="total" select="$total" />						
			</xsl:call-template>

			<xsl:call-template name="set-options">
				<xsl:with-param name="mode" select="'pie'" />
			</xsl:call-template>
			
			<xsl:text>
			var chart = new google.visualization.PieChart(document.getElementById('container'));
			chart.draw(data, options);
			}			
			</xsl:text>
			</xsl:comment>						
		</script>
						
    </head>
	
    <body>
	<div id="container" style="{concat('width: ', $width - 25, ';height: ', $height - 25, ';margin: 0 auto')}"></div>
    </body>
		
</html>			

</xsl:template>

</xsl:stylesheet>