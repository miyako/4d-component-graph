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

<xsl:template name="import-scripts">
	<xsl:variable name="jquery-js" select="document('../../scripts/jquery.xml')/scripts/script[@version='1.4.2']" />
	<xsl:variable name="highcharts-js" select="document('../../scripts/highcharts.xml')/scripts/script[@id='highcharts' and @version='2.1.6']" />
	<xsl:variable name="highcharts-export-js" select="document('../../scripts/highcharts.xml')/scripts/script[@id='highcharts#export' and @version='2.1.6']" />

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$jquery-js" />		
		</xsl:call-template>

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$highcharts-js" />		
		</xsl:call-template>

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$highcharts-export-js" />		
		</xsl:call-template>
				
</xsl:template>

<xsl:template name="common-attributes">

	<xsl:text>
		title: {
			text: </xsl:text><xsl:call-template name="escape-string">
					<xsl:with-param name="s" select="$title"/>
				</xsl:call-template><xsl:text>,
			align: '</xsl:text><xsl:value-of select="$title_align" /><xsl:text>',
			verticalAlign: '</xsl:text><xsl:value-of select="$title_vertical_align" /><xsl:text>',
			floating: </xsl:text><xsl:value-of select="$title_floating" /><xsl:text>,
				x: </xsl:text><xsl:value-of select="$title_x" /><xsl:text>,
				y: </xsl:text><xsl:value-of select="$title_y" /><xsl:text>,	
				margin: </xsl:text><xsl:value-of select="$title_margin" /><xsl:text>,								
			style: {
				color: '</xsl:text><xsl:value-of select="$title_color" /><xsl:text>',
				fontSize: '</xsl:text><xsl:value-of select="$title_font_size" /><xsl:text>px',
				fontStyle: '</xsl:text><xsl:value-of select="$title_font_style" /><xsl:text>',
				textDecoration: '</xsl:text><xsl:value-of select="$title_font_decoration" /><xsl:text>',								
				fontFamily: </xsl:text><xsl:call-template name="escape-string">
						<xsl:with-param name="s" select="$title_font_family"/>
					</xsl:call-template><xsl:text>,				
				fontWeight: '</xsl:text><xsl:value-of select="$title_font_weight" /><xsl:text>'
			}	
		},		
		subtitle: {
			text: </xsl:text><xsl:call-template name="escape-string">
					<xsl:with-param name="s" select="$subtitle"/>
				</xsl:call-template><xsl:text>,
			align: '</xsl:text><xsl:value-of select="$subtitle_align" /><xsl:text>',
			verticalAlign: '</xsl:text><xsl:value-of select="$subtitle_vertical_align" /><xsl:text>',
			floating: </xsl:text><xsl:value-of select="$subtitle_floating" /><xsl:text>,
				x: </xsl:text><xsl:value-of select="$subtitle_x" /><xsl:text>,
				y: </xsl:text><xsl:value-of select="$subtitle_y" /><xsl:text>,									
			style: {
				color: '</xsl:text><xsl:value-of select="$subtitle_color" /><xsl:text>',
				fontSize: '</xsl:text><xsl:value-of select="$subtitle_font_size" /><xsl:text>px',
				fontStyle: '</xsl:text><xsl:value-of select="$subtitle_font_style" /><xsl:text>',
				textDecoration: '</xsl:text><xsl:value-of select="$subtitle_font_decoration" /><xsl:text>',								
				fontFamily: </xsl:text><xsl:call-template name="escape-string">
						<xsl:with-param name="s" select="$subtitle_font_family"/>
					</xsl:call-template><xsl:text>,				
				fontWeight: '</xsl:text><xsl:value-of select="$subtitle_font_weight" /><xsl:text>'
			}					
		},
		credits: {
			enabled: false
		},
		exporting: {
			enabled: false
		},		
		legend: {
			borderColor: </xsl:text><xsl:value-of select="concat(&quot;&apos;&quot;, $legend_rect_stroke_color, &quot;&apos;&quot;)" /><xsl:text>,
			shadow: </xsl:text><xsl:value-of select="$legend_shadow" /><xsl:text>,
			floating: </xsl:text><xsl:value-of select="$legend_floating" /><xsl:text>,						
			borderWidth: </xsl:text><xsl:value-of select="$legend_rect_stroke_width" /><xsl:text>,
			backgroundColor: </xsl:text><xsl:value-of select="concat(&quot;&apos;&quot;, $legend_rect_fill_color, &quot;&apos;&quot;)" /><xsl:text>
		},											
	</xsl:text>
</xsl:template>

<xsl:template name="set-options">
<xsl:text>
Highcharts.setOptions({
    colors: [
	'</xsl:text><xsl:value-of select="$legend1_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend2_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend3_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend4_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend5_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend6_color1" /><xsl:text>', 	
	'</xsl:text><xsl:value-of select="$legend7_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend8_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend9_color1" /><xsl:text>', 	
	'</xsl:text><xsl:value-of select="$legend10_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend11_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend12_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend13_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend14_color1" /><xsl:text>', 
	'</xsl:text><xsl:value-of select="$legend15_color1" /><xsl:text>',								
	'</xsl:text><xsl:value-of select="$legend16_color1" /><xsl:text>'],
    chart: {
        backgroundColor: {
            linearGradient: [</xsl:text><xsl:value-of select="$width" /><xsl:text>, 0, </xsl:text><xsl:value-of select="$width" /><xsl:text>, </xsl:text><xsl:value-of select="$height" /><xsl:text>],
            stops: [
                [0, '</xsl:text><xsl:value-of select="$background_grad_color1" /><xsl:text>'],
                [1, '</xsl:text><xsl:value-of select="$background_grad_color2" /><xsl:text>']
            ]
		}	
	},
        borderWidth: </xsl:text><xsl:value-of select="$border_width" /><xsl:text>,
		plotBackgroundColor: '</xsl:text><xsl:value-of select="$plot_background_color" /><xsl:text>',
        plotShadow: </xsl:text><xsl:value-of select="$plot_shadow" /><xsl:text>,
        plotBorderWidth: </xsl:text><xsl:value-of select="$plot_border_width" /><xsl:text>
});
</xsl:text>
</xsl:template>

<xsl:template name="common-functions">
<xsl:text>
function setTitle(title, subtitle){

	chart.setTitle(title, subtitle);

}

var intervalID = '';

function setTimer(interval, url){

	if((interval == 0) || (intervalID != '')) {
		clearInterval(intervalID);		
	};
	
	if(interval != 0) {		
		intervalID = setInterval(function() {
			location.href= url;
		}, interval);
	}else{
		intervalID = '';
	}

}
</xsl:text>
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