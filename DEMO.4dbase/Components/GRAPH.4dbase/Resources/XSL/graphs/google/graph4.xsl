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
				
		<script type="text/javascript">	
			<xsl:comment>
			<xsl:text>
			google.setOnLoadCallback(drawChart);
			function drawChart() {
			var data = new google.visualization.DataTable();			
			</xsl:text>			
			<xsl:call-template name="series-column">
				<xsl:with-param name="v" select="/graph/legend/v" />
				<xsl:with-param name="c" select="/graph/x_values/v" />									
			</xsl:call-template>

			<xsl:call-template name="set-options">
				<xsl:with-param name="mode" select="'line'" />
			</xsl:call-template>
			
			<xsl:text>
			var chart = new google.visualization.LineChart(document.getElementById('container'));
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