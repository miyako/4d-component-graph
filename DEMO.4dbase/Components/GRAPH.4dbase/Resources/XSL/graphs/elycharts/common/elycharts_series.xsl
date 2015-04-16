<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:strip-space elements="*" />
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:template name="series-column-labels">
<xsl:param name="v" />
	<xsl:text>
		labels: [
		</xsl:text>
			<xsl:for-each select="$v">
				<xsl:variable name="position" select="position()" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:call-template name="escape-string">
					<xsl:with-param name="s" select="."/>
				</xsl:call-template>								
			</xsl:for-each>	
		<xsl:text>
		],	
	</xsl:text>	
</xsl:template>

<xsl:template name="series-column-relative">
<xsl:param name="v" />
	<xsl:text>
		values: {
		</xsl:text>
			<xsl:for-each select="$v">
				<xsl:variable name="position" select="position()" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>				
				<xsl:value-of select="concat('serie', $position, ' : [')" />				
				<xsl:for-each select="/graph/y_values[position() = $position]/s">
					<xsl:variable name="item" select="position()" />
					<xsl:if test="$item != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:choose>
					<xsl:when test="$map_zero_to_null = 1 and @relative = 0">
						<xsl:value-of select="'null'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@relative" />
					</xsl:otherwise>								
					</xsl:choose>
				</xsl:for-each>						
				<xsl:value-of select="']'" />							
			</xsl:for-each>	
		<xsl:text>
		},	
	</xsl:text>	
</xsl:template>

<xsl:template name="series-column">
<xsl:param name="v" />
	<xsl:text>
		values: {
		</xsl:text>
			<xsl:for-each select="$v">
				<xsl:variable name="position" select="position()" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>				
				<xsl:value-of select="concat('serie', $position, ' : [')" />				
				<xsl:for-each select="/graph/y_values[position() = $position]/s">
					<xsl:variable name="item" select="position()" />
					<xsl:if test="$item != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:choose>
					<xsl:when test="$map_zero_to_null = 1 and . = 0">
						<xsl:value-of select="'null'" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="." />
					</xsl:otherwise>								
					</xsl:choose>
				</xsl:for-each>						
				<xsl:value-of select="']'" />							
			</xsl:for-each>	
		<xsl:text>
		},	
	</xsl:text>	
</xsl:template>

<xsl:template name="series-column-tips-relative">
<xsl:param name="v" />
	<xsl:text>
		tooltips: {
		</xsl:text>
			<xsl:for-each select="/graph/legend/v">
				<xsl:variable name="position" select="position()" />
				<xsl:variable name="legend" select="." />							
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:value-of select="concat('serie', $position, ' : [')" />
				<xsl:for-each select="$v">
					<xsl:variable name="item" select="position()" />
					<xsl:variable name="y_value" select="concat(floor(/graph/y_values[position() = $position]/s[position() = $item]/@relative), '%')" />	
					<xsl:variable name="x_value" select="." />
					<xsl:if test="$item != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:call-template name="escape-string">
						<xsl:with-param name="s" select="concat('&lt;b&gt;', $legend, '&lt;/b&gt;', '&lt;br /&gt;' ,$x_value, ' : ', $y_value)"/>
					</xsl:call-template>	
				</xsl:for-each>		
				<xsl:value-of select="']'" />	
			</xsl:for-each>	
		<xsl:text>
		},	
	</xsl:text>	
</xsl:template>

<xsl:template name="series-column-tips">
<xsl:param name="v" />
	<xsl:text>
		tooltips: {
		</xsl:text>
			<xsl:for-each select="/graph/legend/v">
				<xsl:variable name="position" select="position()" />
				<xsl:variable name="legend" select="." />							
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:value-of select="concat('serie', $position, ' : [')" />
				<xsl:for-each select="$v">
					<xsl:variable name="item" select="position()" />
					<xsl:variable name="x_value" select="." />
					<xsl:variable name="y_value" select="/graph/y_values[position() = $position]/s[position() = $item]" />						
					<xsl:if test="$item != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:call-template name="escape-string">
						<xsl:with-param name="s" select="concat('&lt;b&gt;', $legend, '&lt;/b&gt;', '&lt;br /&gt;' ,$x_value, ' : ', $y_value)"/>
					</xsl:call-template>	
				</xsl:for-each>		
				<xsl:value-of select="']'" />	
			</xsl:for-each>	
		<xsl:text>
		},	
	</xsl:text>	
</xsl:template>
 
<xsl:template name="series-pie-multi">
<xsl:param name="v" />
	<xsl:text>
		values: {
			</xsl:text>
			<xsl:for-each select="$v">
				<xsl:variable name="position" select="position()" />	
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>							
				<xsl:value-of select="concat('serie', $position, ': [')" />
				<xsl:variable name="total" select="sum(/graph/y_values/v[position() = $position])" />					
				<xsl:for-each select="/graph/y_values/v[position() = $position]">
					<xsl:variable name="item" select="position()" />
					<xsl:variable name="value" select="." />
						<xsl:if test="$item != 1"><xsl:text>, </xsl:text></xsl:if>
						<xsl:value-of select="$value" />						
				</xsl:for-each>			
				<xsl:value-of select="']'" />				
			</xsl:for-each>	
			<xsl:text>
			},
	</xsl:text>
</xsl:template>
 
<xsl:template name="series-pie-tips-multi">
<xsl:param name="v" />
	<xsl:text>
		tooltips: {
			</xsl:text>
			<xsl:for-each select="$v">
				<xsl:variable name="position" select="position()" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>								
				<xsl:value-of select="concat('serie', $position, ': [')" />
				<xsl:variable name="total" select="sum(/graph/y_values/v[position() = $position])" />					
				<xsl:for-each select="/graph/y_values/v[position() = $position]">
					<xsl:variable name="item" select="position()" />
					<xsl:variable name="value" select="." />
					<xsl:variable name="percentage" select="concat(floor(($value div $total) * 100), '%')" />
					<xsl:variable name="legend" select="/graph/legend_pie/v[position() = $position]" />					
						<xsl:if test="$item != 1"><xsl:text>, </xsl:text></xsl:if>
						<xsl:call-template name="escape-string">
							<xsl:with-param name="s" select="concat('&lt;b&gt;', $legend, '&lt;/b&gt;', '&lt;br /&gt;' ,$value, ' : ', $percentage)"/>
						</xsl:call-template>						
				</xsl:for-each>			
				<xsl:value-of select="']'" />				
			</xsl:for-each>	
			<xsl:text>
			},
	</xsl:text>
</xsl:template>
 
<xsl:template name="series-pie">
<xsl:param name="v" />
<xsl:param name="total" />
	<xsl:text>
		values: {
			</xsl:text>
			<xsl:value-of select="'serie1 : ['" />
			<xsl:for-each select="$v">				
				<xsl:variable name="position" select="position()" />
				<xsl:variable name="value" select="sum(/graph/y_values/v[position() = $position])" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:value-of select="$value" />
			</xsl:for-each>	
			<xsl:value-of select="']'" />
			<xsl:text>
			},
	</xsl:text>
</xsl:template>

<xsl:template name="series-pie-labels">
<xsl:param name="v" />
	<xsl:text>
		labels: [
		</xsl:text>
			<xsl:for-each select="$v">
				<xsl:variable name="position" select="position()" />
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
				<xsl:call-template name="escape-string">
					<xsl:with-param name="s" select="."/>
				</xsl:call-template>								
			</xsl:for-each>	
		<xsl:text>
		],	
	</xsl:text>	
</xsl:template>

<xsl:template name="series-pie-tips">
<xsl:param name="v" />
<xsl:param name="total" />
	<xsl:text>
		tooltips: {
		</xsl:text>
			<xsl:value-of select="'serie1 : ['" />
			<xsl:for-each select="/graph/legend_pie/v">
				<xsl:variable name="position" select="position()" />
				<xsl:variable name="value" select="sum(/graph/y_values/v[position() = $position])" />
				<xsl:variable name="percentage" select="concat(floor(($value div $total) * 100), '%')" />
				<xsl:variable name="legend" select="." />							
				<xsl:if test="$position != 1"><xsl:text>, </xsl:text></xsl:if>
					<xsl:call-template name="escape-string">
						<xsl:with-param name="s" select="concat('&lt;b&gt;', $legend, '&lt;/b&gt;', '&lt;br /&gt;' ,$value, ' : ', $percentage)"/>
					</xsl:call-template>	
			</xsl:for-each>	
			<xsl:value-of select="']'" />				
		<xsl:text>
		},	
	</xsl:text>	
</xsl:template>

</xsl:stylesheet>