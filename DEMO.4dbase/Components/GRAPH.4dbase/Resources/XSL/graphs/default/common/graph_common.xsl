<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >
				
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

  <!-- gradient templates -->
  <xsl:template name="gradient_defs">
    <xsl:param name="grad1_color1" />
    <xsl:param name="grad1_color2" />
    <xsl:param name="grad2_color1" />
    <xsl:param name="grad2_color2" />
    <xsl:param name="grad3_color1" />
    <xsl:param name="grad3_color2" />
    <xsl:param name="grad4_color1" />
    <xsl:param name="grad4_color2" />
    <xsl:param name="shadow_color" select="'black'"/>
    <xsl:param name="x1" select="0"/>
    <xsl:param name="y1" select="0"/>
    <xsl:param name="x2" select="0"/>
    <xsl:param name="y2" select="1"/>
    <xsl:param name="units" select="'objectBoundingBox'"/>
    <linearGradient id="ID_grad1" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$grad1_color1}"  offset="0"/>
      <stop stop-color="{$grad1_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_grad2" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$grad2_color1}"  offset="0"/>
      <stop stop-color="{$grad2_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_grad3" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$grad3_color1}"  offset="0"/>
      <stop stop-color="{$grad3_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_grad4" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$grad4_color1}"  offset="0"/>
      <stop stop-color="{$grad4_color2}"  offset="1"/>
    </linearGradient>
    <radialGradient id="ID_grad_shadow" gradientUnits="objectBoundingBox" cx="0.5" cy="0.5" fx="0.5" fy="0.5" r="0.49" >
      <stop stop-color="{$shadow_color}"  stop-opacity="1.0" offset="0.5"/>
      <stop stop-color="{$shadow_color}"  stop-opacity="0.0" offset="1"/>
    </radialGradient>
  </xsl:template>

  <!-- filter templates -->
  <xsl:template name="filter_defs">
    <xsl:param name="shadow_deviation" select="3"/>
    <filter id="ID_filter_shadow">
      <feGaussianBlur in="SourceGraphic" result="BlurAlpha" stdDeviation="{$shadow_deviation}"/>
      <!--<feOffset dx="3" dy="3" in="BlurAlpha" result="BlurAlpha"/>-->
      <!--<feComposite in="SourceGraphic" in2="BlurAlpha" k1="1" k2="1" k3="1" k4="0" operator="arithmetic" result="Shadow"/>-->
    </filter>
	
	<xsl:if test="string-length($background_image_data) != 0">
		<image id="ID_background_image" x="0" y="0" height="{$background_image_height}" width="{$background_image_width}" xlink:href="{$background_image_data}" />
	</xsl:if>
			
  </xsl:template>


  <!-- legend border template -->
  <xsl:template name="legend_border">
    <xsl:param name="x" select="'0%'"/>
    <xsl:param name="y" select="'0%'"/>
    <xsl:param name="width" select="'100%'"/>
    <xsl:param name="height" select="'100%'"/>
    <xsl:param name="fill-color" select="'none'" />
    <xsl:param name="fill-opacity" select="1" />
    <xsl:param name="stroke-color" select="'black'" />
    <xsl:param name="stroke-width" select="12" />
    <rect id="ID_legend_border" x="{$x}" y="{$y}" width="{$width}" height="{$height}" stroke="{$stroke-color}" stroke-width="{$stroke-width}" fill="{$fill-color}" fill-opacity="{$fill-opacity}" rx="0" ry="0" />
  </xsl:template>

  <!-- legend bullet template -->
  <xsl:template name="legend_bullet">
    <xsl:param name="x" select="'0%'"/>
    <xsl:param name="y" select="'0%'"/>
    <xsl:param name="width" select="'100%'"/>
    <xsl:param name="height" select="'100%'"/>
    <xsl:param name="fill" select="'none'"/>
    <xsl:param name="filter" select="'none'" />
    <xsl:param name="id" />		
    <rect id="{$id}" x="{$x}" y="{$y}" width="{$width}" height="{$height}" fill="{$fill}" filter="{$filter}" rx="0" ry="0" />
  </xsl:template>

  <!-- bar gradient templates -->
  <xsl:template name="bar_gradient_defs">
    <xsl:param name="bar1_color1" />
    <xsl:param name="bar1_color2" />
    <xsl:param name="bar2_color1" />
    <xsl:param name="bar2_color2" />
    <xsl:param name="bar3_color1" />
    <xsl:param name="bar3_color2" />
    <xsl:param name="bar4_color1" />
    <xsl:param name="bar4_color2" />
    <xsl:param name="bar5_color1" />
    <xsl:param name="bar5_color2" />
    <xsl:param name="bar6_color1" />
    <xsl:param name="bar6_color2" />
    <xsl:param name="bar7_color1" />
    <xsl:param name="bar7_color2" />
    <xsl:param name="bar8_color1" />
    <xsl:param name="bar8_color2" />

    <xsl:param name="bar9_color1" />
    <xsl:param name="bar9_color2" />
    <xsl:param name="bar10_color1" />
    <xsl:param name="bar10_color2" />
    <xsl:param name="bar11_color1" />
    <xsl:param name="bar11_color2" />
    <xsl:param name="bar12_color1" />
    <xsl:param name="bar12_color2" />
    <xsl:param name="bar13_color1" />
    <xsl:param name="bar13_color2" />
    <xsl:param name="bar14_color1" />
    <xsl:param name="bar14_color2" />
    <xsl:param name="bar15_color1" />
    <xsl:param name="bar15_color2" />
    <xsl:param name="bar16_color1" />
    <xsl:param name="bar16_color2" />	
    <xsl:param name="x1" select="0"/>
    <xsl:param name="y1" select="0"/>
    <xsl:param name="x2" select="1"/>
    <xsl:param name="y2" select="0"/>
    <xsl:param name="units" select="'objectBoundingBox'"/>
    <linearGradient id="ID_bar_grad1" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar1_color1}"  offset="0"/>
      <stop stop-color="{$bar1_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad2" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar2_color1}"  offset="0"/>
      <stop stop-color="{$bar2_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad3" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar3_color1}"  offset="0"/>
      <stop stop-color="{$bar3_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad4" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar4_color1}"  offset="0"/>
      <stop stop-color="{$bar4_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad5" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar5_color1}"  offset="0"/>
      <stop stop-color="{$bar5_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad6" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar6_color1}"  offset="0"/>
      <stop stop-color="{$bar6_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad7" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar7_color1}"  offset="0"/>
      <stop stop-color="{$bar7_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad8" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar8_color1}"  offset="0"/>
      <stop stop-color="{$bar8_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad9" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar9_color1}"  offset="0"/>
      <stop stop-color="{$bar9_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad10" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar10_color1}"  offset="0"/>
      <stop stop-color="{$bar10_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad11" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar11_color1}"  offset="0"/>
      <stop stop-color="{$bar11_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad12" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar12_color1}"  offset="0"/>
      <stop stop-color="{$bar12_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad13" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar13_color1}"  offset="0"/>
      <stop stop-color="{$bar13_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad14" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar14_color1}"  offset="0"/>
      <stop stop-color="{$bar14_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad15" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar15_color1}"  offset="0"/>
      <stop stop-color="{$bar15_color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bar_grad16" gradientUnits="{$units}" x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}">
      <stop stop-color="{$bar16_color1}"  offset="0"/>
      <stop stop-color="{$bar16_color2}"  offset="1"/>
    </linearGradient>	
  </xsl:template>

  <!-- column bar template -->
  <xsl:template name="bar_1">
    <xsl:param name="bar_index" select="1"/>
    <xsl:param name="x" select="'0%'"/>
    <xsl:param name="y" select="'0%'"/>
    <xsl:param name="width" select="'100%'"/>
    <xsl:param name="height" select="'100%'"/>
    <xsl:param name="r" select="8"/>
    <xsl:param name="filter" select="'none'"/>
    <xsl:param name="id" />	
    <rect id="{$id}" filter="{$filter}" x="{$x}" y="{$y}" width="{$width}" height="{$height}" rx="{$r}" ry="{$r}" />
  </xsl:template>

  <!-- pie gradient templates -->
  <xsl:template name="pie_gradient_defs">
    <xsl:param name="cx" />
    <xsl:param name="cy" />
    <xsl:param name="fx" />
    <xsl:param name="fy" />
    <xsl:param name="r" />
    <xsl:param name="pie1_color1" />
    <xsl:param name="pie1_color2" />
    <xsl:param name="pie2_color1" />
    <xsl:param name="pie2_color2" />
    <xsl:param name="pie3_color1" />
    <xsl:param name="pie3_color2" />
    <xsl:param name="pie4_color1" />
    <xsl:param name="pie4_color2" />
    <xsl:param name="pie5_color1" />
    <xsl:param name="pie5_color2" />
    <xsl:param name="pie6_color1" />
    <xsl:param name="pie6_color2" />
    <xsl:param name="pie7_color1" />
    <xsl:param name="pie7_color2" />
    <xsl:param name="pie8_color1" />
    <xsl:param name="pie8_color2" />

    <xsl:param name="pie9_color1" />
    <xsl:param name="pie9_color2" />
    <xsl:param name="pie10_color1" />
    <xsl:param name="pie10_color2" />
    <xsl:param name="pie11_color1" />
    <xsl:param name="pie11_color2" />
    <xsl:param name="pie12_color1" />
    <xsl:param name="pie12_color2" />
    <xsl:param name="pie13_color1" />
    <xsl:param name="pie13_color2" />
    <xsl:param name="pie14_color1" />
    <xsl:param name="pie14_color2" />
    <xsl:param name="pie15_color1" />
    <xsl:param name="pie15_color2" />
    <xsl:param name="pie16_color1" />
    <xsl:param name="pie16_color2" />
		
    <xsl:param name="pie_offset1" select="0.9"/>
    <xsl:param name="pie_offset2" select="1"/>
    <radialGradient id="ID_pie_grad1" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie1_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie1_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad2" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie2_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie2_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad3" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie3_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie3_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad4" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie4_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie4_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad5" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie5_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie5_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad6" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie6_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie6_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad7" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie7_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie7_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad8" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie8_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie8_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>

    <radialGradient id="ID_pie_grad9" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie9_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie9_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad10" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie10_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie10_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad11" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie11_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie11_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad12" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie12_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie12_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad13" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie13_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie13_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad14" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie14_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie14_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad15" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie15_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie15_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>
    <radialGradient id="ID_pie_grad16" cx="{$cx}" cy="{$cy}" fx="{$fx}" fy="{$fy}" gradientUnits="userSpaceOnUse" r="{$r}">
      <stop stop-color="{$pie16_color1}"  offset="{$pie_offset1}"/>
      <stop stop-color="{$pie16_color2}"  offset="{$pie_offset2}"/>
    </radialGradient>	
  </xsl:template>

  <!-- graph background gradient templates -->
  <xsl:template name="bkgd_gradient_defs">
    <xsl:param name="color1" />
    <xsl:param name="color2" />
    <xsl:param name="color3" />
    <xsl:param name="color4" />
    <xsl:param name="y1" select="0"/>
    <xsl:param name="y2" select="0"/>
    <xsl:param name="y0" select="0"/>
    <linearGradient id="ID_bkgd_grad1" gradientUnits="userSpaceOnUse" x1="0" y1="{$y1}" x2="0" y2="{$y0}">
      <stop stop-color="{$color1}"  offset="0"/>
      <stop stop-color="{$color2}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bkgd_grad2" gradientUnits="userSpaceOnUse" x1="0" y1="{$y0}" x2="0" y2="{$y2}">
      <stop stop-color="{$color2}"  offset="0"/>
      <stop stop-color="{$color1}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bkgd_grad3" gradientUnits="userSpaceOnUse" x1="0" y1="{$y1}" x2="0" y2="{$y0}">
      <stop stop-color="{$color4}"  offset="0"/>
      <stop stop-color="{$color3}"  offset="1"/>
    </linearGradient>
    <linearGradient id="ID_bkgd_grad4" gradientUnits="userSpaceOnUse" x1="0" y1="{$y0}" x2="0" y2="{$y2}">
      <stop stop-color="{$color3}"  offset="0"/>
      <stop stop-color="{$color4}"  offset="1"/>
    </linearGradient>
  </xsl:template>


  <!-- graph background template -->
  <xsl:template name="graph_background">
    <xsl:param name="x" />
    <xsl:param name="y" />
    <xsl:param name="width" />
    <xsl:param name="height" />
    <xsl:param name="y0" />
    <xsl:param name="top_fill" />
    <xsl:param name="bottom_fill" /> 
    <rect x="{$x}" y="{$y}" width="{$width}" height="{$height}" stroke="none" fill="{$top_fill}"/> 
    <!--<rect x="{$x}" y="{$y}" width="{$width}" height="{$y0 - $y}" stroke="none" fill="{$top_fill}"/>-->
    <!--<rect x="{$x}" y="{$y0}" width="{$width}" height="{$y + $height - $y0}" stroke="none" fill="{$bottom_fill}"/>-->

	<xsl:if test="string-length($background_image_data) != 0">
	
	<xsl:variable name="sx" select="($width div $background_image_width)" />
	<xsl:variable name="sy" select="($height div $background_image_height)" />
	<xsl:variable name="tx" select="-(($sx * $x) - $x)" />
	<xsl:variable name="ty" select="-(($sy * $y) - $y)" />
				
		<use 
			height="{$height}" 
			transform="{concat('translate(', $tx, ',', $ty, ') scale(', $sx, ',', $sy, ')')}" 
			width="{$width}" 
			x="{$x}" 
			xlink:href="url(#ID_background_image)" 
			y="{$y}"/>
	</xsl:if>	

  </xsl:template>


  <!-- line gradient defs -->
  <xsl:template name="line_gradient_defs">
    <xsl:param name="line1_color1" />
    <xsl:param name="line1_color2" />
    <xsl:param name="line2_color1" />
    <xsl:param name="line2_color2" />
    <xsl:param name="line3_color1" />
    <xsl:param name="line3_color2" />
    <xsl:param name="line4_color1" />
    <xsl:param name="line4_color2" />
    <xsl:param name="line5_color1" />
    <xsl:param name="line5_color2" />
    <xsl:param name="line6_color1" />
    <xsl:param name="line6_color2" />
    <xsl:param name="line7_color1" />
    <xsl:param name="line7_color2" />
    <xsl:param name="line8_color1" />
    <xsl:param name="line8_color2" />

    <xsl:param name="line9_color1" />
    <xsl:param name="line9_color2" />
    <xsl:param name="line10_color1" />
    <xsl:param name="line10_color2" />
    <xsl:param name="line11_color1" />
    <xsl:param name="line11_color2" />
    <xsl:param name="line12_color1" />
    <xsl:param name="line12_color2" />
    <xsl:param name="line13_color1" />
    <xsl:param name="line13_color2" />
    <xsl:param name="line14_color1" />
    <xsl:param name="line14_color2" />
    <xsl:param name="line15_color1" />
    <xsl:param name="line15_color2" />
    <xsl:param name="line16_color1" />
    <xsl:param name="line16_color2" />
		
    <radialGradient id="ID_line_grad1" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line1_color1}"/>
      <stop offset="100%" stop-color="{$line1_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad2" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line2_color1}"/>
      <stop offset="100%" stop-color="{$line2_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad3" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line3_color1}"/>
      <stop offset="100%" stop-color="{$line3_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad4" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line4_color1}"/>
      <stop offset="100%" stop-color="{$line4_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad5" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line5_color1}"/>
      <stop offset="100%" stop-color="{$line5_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad6" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line6_color1}"/>
      <stop offset="100%" stop-color="{$line6_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad7" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line7_color1}"/>
      <stop offset="100%" stop-color="{$line7_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad8" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line8_color1}"/>
      <stop offset="100%" stop-color="{$line8_color2}"/>
    </radialGradient>

    <radialGradient id="ID_line_grad9" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line9_color1}"/>
      <stop offset="100%" stop-color="{$line9_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad10" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line10_color1}"/>
      <stop offset="100%" stop-color="{$line10_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad11" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line11_color1}"/>
      <stop offset="100%" stop-color="{$line11_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad12" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line12_color1}"/>
      <stop offset="100%" stop-color="{$line12_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad13" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line13_color1}"/>
      <stop offset="100%" stop-color="{$line13_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad14" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line14_color1}"/>
      <stop offset="100%" stop-color="{$line14_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad15" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line15_color1}"/>
      <stop offset="100%" stop-color="{$line15_color2}"/>
    </radialGradient>
    <radialGradient id="ID_line_grad16" gradientUnits="objectBoundingBox" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="{$line16_color1}"/>
      <stop offset="100%" stop-color="{$line16_color2}"/>
    </radialGradient>	
  </xsl:template>

  <!-- line bullet template -->
  <xsl:template name="line_bullet">
    <xsl:param name="cx" />
    <xsl:param name="cy" />
    <xsl:param name="r" />
    <circle cx="{$cx}" cy="{$cy}" r="{$r}" />
  </xsl:template>


  <!-- line template -->
  <xsl:template name="line">
    <xsl:param name="x1" />
    <xsl:param name="y1" />
    <xsl:param name="x2" />
    <xsl:param name="y2" />
    <line x1="{$x1}" y1="{$y1}" x2="{$x2}" y2="{$y2}" />
  </xsl:template>

  <!-- pie piece template -->
  <xsl:template name="pie">
    <xsl:param name="cx" />
    <xsl:param name="cy" />
    <xsl:param name="r" />
    <xsl:param name="start" />
    <xsl:param name="end" />
    <xsl:param name="large_arc" />
    <xsl:param name="fill" />
    <xsl:variable name="startx" select="math:cos($start)*$r"/>
    <xsl:variable name="starty" select="math:sin($start)*$r"/>
    <xsl:variable name="endx"   select="math:cos($end)*$r"/>
    <xsl:variable name="endy"   select="math:sin($end)*$r"/>
    <path d="M{$cx},{$cy} l{$startx},{$starty} A{$r},{$r} 0 {$large_arc},1 {$cx+$endx},{$cy+$endy} z" fill="{$fill}" stroke="{$fill}" stroke-opacity="1" stroke-width="1.5" stroke-dasharray="none"/>
  </xsl:template>

  <!-- circle shadow template -->
  <xsl:template name="circle_shadow">
    <xsl:param name="cx" />
    <xsl:param name="cy" />
    <xsl:param name="r" />
    <xsl:param name="dx" />
    <xsl:param name="dy" />
    <circle cx="{$cx+(($dx*$r) div 100)}" cy="{$cy+(($dy*$r) div 100)}" r="{$r}" fill="url(#ID_grad_shadow)" stroke="none"/>
  </xsl:template>


  <!-- pie piece label template -->
  <xsl:template name="pie_label_percent">
    <xsl:param name="cx" />
    <xsl:param name="cy" />
    <xsl:param name="r" />
    <xsl:param name="sx" />
    <xsl:param name="sy" />
    <xsl:param name="start" />
    <xsl:param name="end" />
    <xsl:param name="pi2" />
    <xsl:param name="format" />

    <xsl:param name="font_size" />
    <xsl:param name="font_descent" />

    <xsl:param name="border_visible" select="1" />
    <xsl:param name="border_margin" select="2" />
    <xsl:param name="border_fill_color" select="'none'" />
    <xsl:param name="border_fill_opacity" select="1" />
    <xsl:param name="border_stroke_color" select="'none'" />
    <xsl:param name="border_stroke_width" select="1" />

    <xsl:variable name="middlex" select="$cx+((math:cos(($start+$end) div 2)*((3*$r) div 2))*$sx)"/>
    <xsl:variable name="middley" select="$cy+((math:sin(($start+$end) div 2)*((3*$r) div 2))*$sy)"/>

    <xsl:call-template name="label_align_middle">
      <xsl:with-param name="x" select="($cx+$middlex) div 2" />
      <xsl:with-param name="y" select="($cy+$middley) div 2" />
      <xsl:with-param name="text" select="exsl4D:format-number(((($end - $start)*100.0) div $pi2),$format)"/>

      <xsl:with-param name="font_size" select="$font_size"/>
      <xsl:with-param name="font_descent" select="$font_descent"/>

      <xsl:with-param name="border_visible" select="$border_visible" />
      <xsl:with-param name="border_margin" select="$border_margin" />
      <xsl:with-param name="border_fill_color" select="$border_fill_color" />
      <xsl:with-param name="border_fill_opacity" select="$border_fill_opacity" />
      <xsl:with-param name="border_stroke_color" select="$border_stroke_color" />
      <xsl:with-param name="border_stroke_width" select="$border_stroke_width" />
    </xsl:call-template>
  </xsl:template>

  <!-- label templates -->
  <xsl:template name="label_align_middle">
    <xsl:param name="x" />
    <xsl:param name="y" />
    <xsl:param name="text" />
    
    <xsl:param name="font_size" />
    <xsl:param name="font_descent" />

    <xsl:param name="border_visible" select="1" />
    <xsl:param name="border_margin" select="2" />
    <xsl:param name="border_fill_color" select="'none'" />
    <xsl:param name="border_fill_opacity" select="1" />
    <xsl:param name="border_stroke_color" select="'none'" />
    <xsl:param name="border_stroke_width" select="1" />

    <xsl:param name="len" select="string-length($text)*($font_size div 2.0)" />
    <!--<xsl:variable name="len" select="string-length($text)*($font_size div 2.0)" />-->
	
    <xsl:variable name="left" select="$x - $border_margin - ($len div 2)"/>
    <xsl:variable name="top" select="$y - $border_margin - $font_size - $font_descent"/>
    <xsl:variable name="width" select="($border_margin*2) + $len"/>
    <xsl:variable name="height" select="(2*$border_margin) + $font_size + $font_descent"/>

    <xsl:if test="boolean($border_visible)">
      <rect x="{$left}" y="{$top}" width="{$width + 5}" height="{$height - 2}" stroke="{$border_stroke_color}" stroke-width="{$border_stroke_width}" fill="{$border_fill_color}" fill-opacity="{$border_fill_opacity}" rx="0" ry="0" />
    </xsl:if>
    <text text-anchor="middle" x="{$x + 3}" y="{$y - $font_descent - 2}">
      <xsl:value-of select="$text"/>
    </text>
  </xsl:template>

  <xsl:template name="label_align_right">
    <xsl:param name="x" />
    <xsl:param name="y" />
    <xsl:param name="text" />

    <xsl:param name="font_size" />
    <xsl:param name="font_descent" />

    <xsl:param name="border_visible" select="1" />
    <xsl:param name="border_margin" select="2" />
    <xsl:param name="border_fill_color" select="'none'" />
    <xsl:param name="border_fill_opacity" select="1" />
    <xsl:param name="border_stroke_color" select="'none'" />
    <xsl:param name="border_stroke_width" select="1" />

    <xsl:variable name="len" select="string-length($text)*($font_size div 2.0)" />
    <xsl:variable name="left" select="$x - $border_margin - $len"/>
    <xsl:variable name="top" select="$y - $border_margin - $font_size - $font_descent"/>
    <xsl:variable name="width" select="($border_margin*2) + $len"/>
    <xsl:variable name="height" select="(2*$border_margin) + $font_size + $font_descent"/>

    <xsl:if test="boolean($border_visible)">
      <rect x="{$left}" y="{$top}" width="{$width}" height="{$height}" stroke="{$border_stroke_color}" stroke-width="{$border_stroke_width}" fill="{$border_fill_color}" fill-opacity="{$border_fill_opacity}" rx="4" ry="4" />
    </xsl:if>
    <text text-anchor="end" x="{$x}" y="{$y - $font_descent}">
      <xsl:value-of select="$text"/>
    </text>
  </xsl:template>

  <xsl:template name="label_align_left">
    <xsl:param name="x" />
    <xsl:param name="y" />
    <xsl:param name="text" />

    <xsl:param name="font_size" />
    <xsl:param name="font_descent" />

    <xsl:param name="border_visible" select="1" />
    <xsl:param name="border_margin" select="2" />
    <xsl:param name="border_fill_color" select="'none'" />
    <xsl:param name="border_fill_opacity" select="1" />
    <xsl:param name="border_stroke_color" select="'none'" />
    <xsl:param name="border_stroke_width" select="1" />

    <xsl:variable name="len" select="string-length($text)*($font_size div 2.0)" />
    <xsl:variable name="left" select="$x - $border_margin"/>
    <xsl:variable name="top" select="$y - $border_margin - $font_size - $font_descent"/>
    <xsl:variable name="width" select="($border_margin*2) + $len"/>
    <xsl:variable name="height" select="(2*$border_margin) + $font_size + $font_descent"/>

    <xsl:if test="boolean($border_visible)">
      <rect x="{$left}" y="{$top}" width="{$width}" height="{$height}" stroke="{$border_stroke_color}" stroke-width="{$border_stroke_width}" fill="{$border_fill_color}" fill-opacity="{$border_fill_opacity}" rx="4" ry="4" />
    </xsl:if>
    <text text-anchor="start" x="{$x}" y="{$y - $font_descent}">
      <xsl:value-of select="$text"/>
    </text>
  </xsl:template>
  
</xsl:stylesheet>
