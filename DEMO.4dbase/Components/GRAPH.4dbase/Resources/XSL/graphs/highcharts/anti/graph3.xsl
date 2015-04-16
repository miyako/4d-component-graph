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
								
		<script type="text/javascript">			
			<xsl:comment>
			<xsl:call-template name="set-options" />
			<xsl:text>
			var chart;
			$(document).ready(function() {
				chart = new Highcharts.Chart({
					chart: {
						renderTo: 'container',
						defaultSeriesType: 'column'
					},
					</xsl:text>
					<xsl:call-template name="common-attributes">
						<xsl:with-param name="t" select="$title" />					
					</xsl:call-template>
					<xsl:text>
					xAxis: {
						categories: [
						</xsl:text>
						<xsl:for-each select="/graph/legend/v">
							<xsl:variable name="position" select="position()" />
							<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
							<xsl:call-template name="escape-string">
								<xsl:with-param name="s" select="."/>
							</xsl:call-template>							
						</xsl:for-each>	
					<xsl:text>													
					]
					},
					yAxis: {
						title: {
							text: </xsl:text>
								<xsl:call-template name="escape-string">
									<xsl:with-param name="s" select="$y_label_title"/>
								</xsl:call-template>							
							<xsl:text>	
						},
						plotLines: [{
							value: 0,
							width: 1,
							color: '#808080'
						}]
					},
					tooltip: {
						formatter: function() {
				                return '&lt;b&gt;'+ this.series.name +'&lt;/b&gt;&lt;br/&gt;'+
								this.x +': '+ this.y;
						}
					},
					plotOptions: {
						column: {
							dataLabels: {
								enabled: </xsl:text><xsl:value-of select="$datalabels_enabled" /><xsl:text>
							},						
							enableMouseTracking: </xsl:text><xsl:value-of select="$mousetracking_enabled" /><xsl:text>,
							showInLegend: </xsl:text><xsl:value-of select="$legend_visible" /><xsl:text>,
							stacking: 'normal'
						}	
					},										
					</xsl:text>
					<xsl:call-template name="series-column">
						<xsl:with-param name="v" select="/graph/x_values/v" />					
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