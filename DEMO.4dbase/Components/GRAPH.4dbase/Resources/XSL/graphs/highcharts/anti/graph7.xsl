<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:import href="../common/highcharts_common.xsl" />
<xsl:import href="common/highcharts_series.xsl" />
<xsl:import href="../../default/common/graph_settings.xsl" />
<xsl:import href="../../default/common/html_common.xsl" />
  
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
			<xsl:call-template name="set-options" />
			<xsl:text>
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'container'
					},
					</xsl:text>
					<xsl:call-template name="common-attributes">
						<xsl:with-param name="t" select="$title" />					
					</xsl:call-template>
					<xsl:text>
					tooltip: {
						formatter: function() {
				                return '&lt;b&gt;'+ this.point.name +'&lt;/b&gt;&lt;br/&gt;'+
								this.y +': '+ ' ('+ Math.round(this.percentage) +'%)';
						}						
					},				
					plotOptions: {
						pie: {
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
								enabled: </xsl:text><xsl:value-of select="$datalabels_enabled" /><xsl:text>
							},
							enableMouseTracking: </xsl:text><xsl:value-of select="$mousetracking_enabled" /><xsl:text>,
							showInLegend: </xsl:text><xsl:value-of select="$legend_visible" /><xsl:text>
						}
					},
					</xsl:text>
					<xsl:call-template name="series-pie">
						<xsl:with-param name="v" select="/graph/legend/v" />
						<xsl:with-param name="total" select="$total" />						
					</xsl:call-template>
					<xsl:text>					
				});
			});
			</xsl:text>
				<xsl:call-template name="common-functions" />
			<xsl:text>								
			</xsl:text>
			</xsl:comment>			
		</script>
						
    </head>
	
    <body>
		
		<div id="container" style="{concat('width: ', $width - 25, 'px; ', 'height: ', $height - 25, 'px; margin: 0 auto')}"></div>

    </body>
	
</html>

</xsl:template>

</xsl:stylesheet>