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
	<xsl:variable name="google-jsapi-js" select="document('../../scripts/google.xml')/scripts/script[@id='jsapi' and @version='1.0']" />
	<xsl:variable name="google-corechart-js" select="document('../../scripts/google.xml')/scripts/script[@id='visualization' and @package='corechart' and @version='1.0']" />

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$google-jsapi-js" />		
		</xsl:call-template>

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$google-corechart-js" />		
		</xsl:call-template>
						
</xsl:template>

<xsl:template name="set-options">
<xsl:param name="mode" />
	<xsl:text>
	var options = {
					'title':</xsl:text><xsl:call-template name="escape-string"><xsl:with-param name="s" select="$title"/></xsl:call-template><xsl:text>,
					'legend':'</xsl:text><xsl:value-of select="$legend_position" /><xsl:text>',
					'width':</xsl:text><xsl:value-of select="$width - 25" /><xsl:text>,
					'height':</xsl:text><xsl:value-of select="$height - 25" /><xsl:text>,
					'backgroundColor':{
							stroke:'</xsl:text><xsl:value-of select="$plot_stroke_color" /><xsl:text>',
							strokeWidth:</xsl:text><xsl:value-of select="$border_width" /><xsl:text>,
							fill:'</xsl:text><xsl:value-of select="$plot_fill_color" /><xsl:text>'
						},
</xsl:text>						
<xsl:choose>
<xsl:when test="$mode='pie'">
<xsl:text>
					'is3D':</xsl:text><xsl:value-of select="$is3D" /><xsl:text>,
					'pieResidueSliceLabel':</xsl:text><xsl:call-template name="escape-string"><xsl:with-param name="s" select="$pie_residue_slice_label"/></xsl:call-template><xsl:text>,
					'pieResidueSliceColor':'</xsl:text><xsl:value-of select="$pie_residue_slice_color" /><xsl:text>',
					'reverseCategories':</xsl:text><xsl:value-of select="$reverse_categories" /><xsl:text>,					
					'pieSliceText':'</xsl:text><xsl:value-of select="$pie_slice_text" /><xsl:text>',
					'sliceVisibilityThreshold':</xsl:text><xsl:value-of select="$slice_visibility_threshold" /><xsl:text>,			
					'chartArea':{
						left:'5%',
						top:0,
						width:'90%',
						height:'90%'
					},
</xsl:text>	
</xsl:when>
<xsl:when test="$mode='column'">
<xsl:text>
					'chartArea':{
						left:'7%',
						top:'7%',
						width:'86%',
						height:'75%'
					},
</xsl:text>	
</xsl:when>
<xsl:when test="$mode='area'">
<xsl:text>
					'chartArea':{
						left:'7%',
						top:'7%',
						width:'86%',
						height:'75%'
					},
</xsl:text>	
</xsl:when>
<xsl:when test="$mode='line'">
<xsl:text>
					'chartArea':{
						left:'7%',
						top:'7%',
						width:'86%',
						height:'75%'
					},
</xsl:text>	
</xsl:when>
<xsl:when test="$mode='bar'">
<xsl:text>
					'chartArea':{
						left:'15%',
						top:'7%',
						width:'85%',
						height:'75%'
					},
</xsl:text>	
</xsl:when>
</xsl:choose>
<xsl:text>						

					'colors':[
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
					'</xsl:text><xsl:value-of select="$legend16_color1" /><xsl:text>'					
					],
					'fontSize':</xsl:text><xsl:value-of select="$font_size" /><xsl:text>,
					'fontName':</xsl:text><xsl:call-template name="escape-string"><xsl:with-param name="s" select="$font_family"/></xsl:call-template><xsl:text>,
					'titleTextStyle':{
						color:'</xsl:text><xsl:value-of select="$title_color" /><xsl:text>',
						fontName:</xsl:text><xsl:call-template name="escape-string"><xsl:with-param name="s" select="$title_font_family"/></xsl:call-template><xsl:text>,
						fontSize:</xsl:text><xsl:value-of select="$title_font_size" /><xsl:text>
					},					
					'legendTextStyle':{
						color:'</xsl:text><xsl:value-of select="$legend_color" /><xsl:text>',
						fontName:</xsl:text><xsl:call-template name="escape-string"><xsl:with-param name="s" select="$legend_font_family"/></xsl:call-template><xsl:text>,
						fontSize:</xsl:text><xsl:value-of select="$legend_font_size" /><xsl:text>
					},
					'tooltipText':'</xsl:text><xsl:value-of select="$tooltip_text" /><xsl:text>',
					'tooltipTextStyle':{
						color:'</xsl:text><xsl:value-of select="$tooltip_font_color" /><xsl:text>',
						fontName:</xsl:text><xsl:call-template name="escape-string"><xsl:with-param name="s" select="$tooltip_font_family"/></xsl:call-template><xsl:text>,
						fontSize:</xsl:text><xsl:value-of select="$tooltip_font_size" /><xsl:text>
					}
				 
				 };	
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