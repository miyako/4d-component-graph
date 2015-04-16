<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:import href="../../default/common/html_common.xsl" />
<xsl:import href="../../default/common/graph_common.xsl" />
<xsl:import href="../../default/common/graph_settings.xsl" />

<xsl:strip-space elements="*" />
<xsl:output method="xml" indent="no" />

<xsl:param name="margin_horizontal" select="0 - ($width div 2)" />
<xsl:param name="margin_vertical" select="0 - ($height div 2)" />

<xsl:template match="/">

<xsl:variable name="jquery-js" select="document('../../scripts/jquery.xml')/scripts/script[@version='1.4.2']" />
<xsl:variable name="raphael-js" select="document('../../scripts/raphael.xml')/scripts/script[@version='1.5.2']" />

<xsl:variable name="raphael-css" select="document('../../styles/raphael.xml')/styles/style[@name='graph']" />

<html>
    <head>
	
		<!-- no meta will cause error on IE -->	
		<meta charset="utf-8" />
		
		<!-- empty title will cause error on IE -->
		<title>GRAPH</title>
		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$jquery-js" />		
		</xsl:call-template>

		<xsl:call-template name="script">
			<xsl:with-param name="node" select="$raphael-js" />		
		</xsl:call-template>

		<script type="text/javascript">			
		<xsl:call-template name="escape-in" />
<xsl:text>
Raphael.fn.pieChart = function (cx, cy, r, values, labels, stroke) {
    var paper = this,
        rad = Math.PI / 180,
        chart = this.set();
    function sector(cx, cy, r, startAngle, endAngle, params) {
        var x1 = cx + r * Math.cos(-startAngle * rad),
            x2 = cx + r * Math.cos(-endAngle * rad),
            y1 = cy + r * Math.sin(-startAngle * rad),
            y2 = cy + r * Math.sin(-endAngle * rad);
        return paper.path([&quot;M&quot;, cx, cy, &quot;L&quot;, x1, y1, &quot;A&quot;, r, r, 0, +(endAngle - startAngle </xsl:text><xsl:value-of select="string('&gt;')" disable-output-escaping="yes" /><xsl:text> 180), 0, x2, y2, &quot;z&quot;]).attr(params);
    }
    var angle = 0,
        total = 0,
        start = 0,
        process = function (j) {
            var value = values[j],
                angleplus = 360 * value / total,
                popangle = angle + (angleplus / 2),
                color = &quot;hsb(&quot; + start + &quot;, 1, .5)&quot;,
                ms = 500,
                delta = 30,
                bcolor = &quot;hsb(&quot; + start + &quot;, 1, 1)&quot;,
                p = sector(cx, cy, r, angle, angle + angleplus, {gradient: &quot;90-&quot; + bcolor + &quot;-&quot; + color, stroke: stroke, &quot;stroke-width&quot;: 3}),
                txt = paper.text(cx + (r + delta + 55) * Math.cos(-popangle * rad), cy + (r + delta + 25) * Math.sin(-popangle * rad), labels[j]).attr({fill: bcolor, stroke: &quot;none&quot;, opacity: 0, &quot;font-family&quot;: 'Arial', &quot;font-size&quot;: &quot;20px&quot;});
            p.mouseover(function () {
                p.animate({scale: [1.1, 1.1, cx, cy]}, ms, &quot;elastic&quot;);
                txt.animate({opacity: 1}, ms, &quot;elastic&quot;);
            }).mouseout(function () {
                p.animate({scale: [1, 1, cx, cy]}, ms, &quot;elastic&quot;);
                txt.animate({opacity: 0}, ms);
            });
            angle += angleplus;
            chart.push(p);
            chart.push(txt);
            start += .1;
        };
    for (var i = 0, ii = values.length; i </xsl:text><xsl:value-of select="string('&lt;')" disable-output-escaping="yes" /><xsl:text> ii; i++) {
        total += values[i];
    }
    for (var i = 0; i </xsl:text><xsl:value-of select="string('&lt;')" disable-output-escaping="yes" /><xsl:text> ii; i++) {
        process(i);
    }
    return chart;
};

(function (raphael) {
    $(function () {
        var values = [],
            labels = [];
        $(&quot;tr&quot;).each(function () {
            values.push(parseInt($(&quot;td&quot;, this).text(), 10));
            labels.push($(&quot;th&quot;, this).text());
        });
        $(&quot;table&quot;).hide();
        raphael(&quot;holder&quot;, </xsl:text><xsl:value-of select="$width" /><xsl:text>, </xsl:text><xsl:value-of select="$height" /><xsl:text>).pieChart(</xsl:text><xsl:value-of select="0 - $margin_horizontal" /><xsl:text>, </xsl:text><xsl:value-of select="0 - $margin_vertical + 10" /><xsl:text>, </xsl:text><xsl:value-of select="$height div 3" /><xsl:text>, values, labels, &quot;#fff&quot;);
    });
})(Raphael.ninja());
</xsl:text>
			<xsl:call-template name="escape-out" />
		
		</script>
	
		<xsl:call-template name="style">
			<xsl:with-param name="node" select="$raphael-css" />		
		</xsl:call-template>
					
		<style type="text/css" media="screen">
			<xsl:text>
            #holder {
                margin: </xsl:text><xsl:value-of select="$margin_vertical - 10" /><xsl:text>px 0 0 </xsl:text><xsl:value-of select="$margin_horizontal" /><xsl:text>px;
                width: </xsl:text><xsl:value-of select="$width" /><xsl:text>px;
                height: </xsl:text><xsl:value-of select="$height" /><xsl:text>px;
            }
			</xsl:text>
        </style>
    </head>
	
    <body>
		<table>
		<xsl:variable name="total" select="sum(/graph/y_values/v)" />
		<xsl:for-each select="/graph/legend/v">
			<xsl:variable name="position" select="position()" />		
		<tr>
			<th><xsl:value-of select="." /></th>
			<td><xsl:value-of select="concat(floor((sum(/graph/y_values[position() = $position]/v) div $total) * 100), '%')" /></td>
		</tr>
		</xsl:for-each>	
		
		<div id="holder"></div>

		</table>
    </body>
	
</html>

</xsl:template>

</xsl:stylesheet>