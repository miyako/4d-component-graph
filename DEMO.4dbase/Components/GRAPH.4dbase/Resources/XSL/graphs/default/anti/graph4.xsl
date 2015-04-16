<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >
				
  <xsl:import href="../common/graph_common.xsl" />
  <xsl:import href="../common/graph_settings.xsl" />
  
  <xsl:strip-space elements="*" />
  <xsl:output method="xml" encoding="UTF-8" indent="no" media-type="image/svg"/>

  <xsl:param name="grad_x1" select="0"/>
  <xsl:param name="grad_y1" select="0"/>
  <xsl:param name="grad_x2" select="0"/>
  <xsl:param name="grad_y2" select="1"/>
  <xsl:param name="grad_units" select="'objectBoundingBox'"/>

  <!-- filter properties -->
  <xsl:param name="filter_shadow_deviation" select="1"/>

  <!-- match root element -->
  <xsl:template match="graph">
    <!-- global constants-->

    <!-- legend properties -->
    <xsl:variable name="legend_max_car" select="exsl4D:max-string-length(x_values/v)+2"/>
    <xsl:variable name="legend_label_width" select="$legend_max_car*$legend_font_width"/>
    <xsl:variable name="legend_box_width" select="number(boolean(x_values/v[1]))*($base_margin+$legend_bullet_size+$base_margin+$legend_label_width+$base_margin)"/>
    <xsl:variable name="legend_box_height" select="$base_margin+(($legend_bullet_size+$base_margin)*count(x_values/v))"/>

    <!-- axis x labels properties -->
    <xsl:variable name="x_values_count" select="count(legend/v)"/>
    <xsl:variable name="x_label_max_car" select="exsl4D:max-value-length(legend/v,$x_label_format_number,$x_label_format_date,$x_label_format_time)"/>
    <xsl:variable name="x_label_width" select="$x_label_font_width*$x_label_max_car"/>

    <!-- axis y labels properties -->
    <xsl:variable name="y_label_max_car" select="exsl4D:max-value-length(y_grid_values/v,$y_label_format_number,$y_label_format_date,$y_label_format_time)"/>
    <xsl:variable name="y_label_width" select="$y_label_font_width*$y_label_max_car"/>
    <xsl:variable name="y_label_count" select="count(y_grid_values/v)" />

    <xsl:variable name="y_values_count" select="count(y_values[1]/s)" />

    <!-- graph margins -->
    <xsl:variable name="graph_left_margin" select="$y_label_width+($base_margin*2)" />
    <xsl:variable name="graph_right_margin" select="(($legend_box_width+$base_margin)*number(boolean(x_values/v)))+$base_margin"/>
    <xsl:variable name="graph_top_margin" select="(number(boolean($title))*($title_font_size+$title_margin))+$y_label_font_size+$base_margin" />
    <xsl:variable name="graph_bottom_margin" select="$x_label_font_size+($base_margin*2)" />

    <!-- graph bars properties -->
    <xsl:variable name="bar_prop" select="number($viewport_width &gt; 0)" />
    <xsl:variable name="data_group_width_min" select="exsl4D:max($x_label_width+$base_margin,($base_margin*4)+($bar_size_min))"/>
    <xsl:variable name="temp_width" select="exsl4D:max($viewport_width,(($data_group_width_min*$x_values_count)+$graph_left_margin+$graph_right_margin))" />
    <xsl:variable name="bar_width" select="($bar_size*(1 - $bar_prop))+((((($temp_width - $graph_left_margin - $graph_right_margin) div $x_values_count) - ($base_margin*4)))*$bar_prop)" />
    
    <xsl:variable name="bar_group_width" select="$bar_width"/>
    <xsl:variable name="data_group_width_base" select="($base_margin*4)+$bar_group_width"/>
    <xsl:variable name="data_group_width" select="exsl4D:max($data_group_width_base,$data_group_width_min)"/>
    <xsl:variable name="bar_group_offset" select="($data_group_width - $bar_group_width) div 2"/>

    <!-- viewbox properties -->
    <xsl:variable name="viewbox_width" select="($data_group_width*$x_values_count)+$graph_left_margin+$graph_right_margin" />
    <xsl:variable name="viewbox_height" select="exsl4D:max($viewport_height,$graph_top_margin+$legend_box_height+$graph_bottom_margin)" />

    <xsl:variable name="legend_box_x" select="$viewbox_width - $graph_right_margin + $base_margin"/>
    <xsl:variable name="legend_box_y" select="$graph_top_margin"/>
    <xsl:variable name="legend_bullet_x" select="$legend_box_x + $base_margin"/>
    <xsl:variable name="legend_bullet_y" select="$legend_box_y + $base_margin"/>
    <xsl:variable name="legend_label_x" select="$legend_bullet_x + $legend_bullet_size + $base_margin"/>
    <xsl:variable name="legend_label_y" select="$legend_bullet_y + $legend_bullet_size - (($legend_bullet_size - $legend_font_size) div 2) - $legend_font_descent"/>
    <xsl:variable name="legend_step_y" select="$legend_bullet_size+$base_margin"/>

    <!-- title properties -->
    <xsl:variable name="title_max_car" select="string-length($title)"/>
    <xsl:variable name="title_label_width" select="$title_max_car*$title_font_width"/>
    <xsl:variable name="title_pos_y" select="$base_margin+$title_font_size" />
    <xsl:variable name="title_pos_x" select="$graph_left_margin + (($viewbox_width - $graph_left_margin - $graph_right_margin) div 2)"/>

    <xsl:variable name="y_max" select="number(settings/y_max)"/>
    <xsl:variable name="y_min" select="number(settings/y_min)"/>
	<xsl:variable name="y_scale" select="($viewbox_height - $graph_top_margin - $graph_bottom_margin) div exsl4D:max(0.000000000001,$y_max - $y_min)"/>

	  <!-- create svg root element-->
    <svg id="ID_svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 {$viewbox_width} {$viewbox_height}" viewport-fill="{$viewport_color}" viewport-fill-opacity="{$viewport_opacity}">

      <xsl:variable name="y0" select="$viewbox_height - $graph_bottom_margin + ($y_min*$y_scale)" />

      <xsl:comment>gradient styles</xsl:comment>
      <defs >
        <xsl:call-template name="bar_gradient_defs">
          <xsl:with-param name="bar1_color1" select="$legend1_color1"/>
          <xsl:with-param name="bar1_color2" select="$legend1_color2"/>
          <xsl:with-param name="bar2_color1" select="$legend2_color1"/>
          <xsl:with-param name="bar2_color2" select="$legend2_color2"/>
          <xsl:with-param name="bar3_color1" select="$legend3_color1"/>
          <xsl:with-param name="bar3_color2" select="$legend3_color2"/>
          <xsl:with-param name="bar4_color1" select="$legend4_color1"/>
          <xsl:with-param name="bar4_color2" select="$legend4_color2"/>
          <xsl:with-param name="bar5_color1" select="$legend5_color1"/>
          <xsl:with-param name="bar5_color2" select="$legend5_color2"/>
          <xsl:with-param name="bar6_color1" select="$legend6_color1"/>
          <xsl:with-param name="bar6_color2" select="$legend6_color2"/>
          <xsl:with-param name="bar7_color1" select="$legend7_color1"/>
          <xsl:with-param name="bar7_color2" select="$legend7_color2"/>
          <xsl:with-param name="bar8_color1" select="$legend8_color1"/>
          <xsl:with-param name="bar8_color2" select="$legend8_color2"/>
		  
          <xsl:with-param name="bar9_color1" select="$legend9_color1"/>
          <xsl:with-param name="bar9_color2" select="$legend9_color2"/>
          <xsl:with-param name="bar10_color1" select="$legend10_color1"/>
          <xsl:with-param name="bar10_color2" select="$legend10_color2"/>
          <xsl:with-param name="bar11_color1" select="$legend11_color1"/>
          <xsl:with-param name="bar11_color2" select="$legend11_color2"/>
          <xsl:with-param name="bar12_color1" select="$legend12_color1"/>
          <xsl:with-param name="bar12_color2" select="$legend12_color2"/>
          <xsl:with-param name="bar13_color1" select="$legend13_color1"/>
          <xsl:with-param name="bar13_color2" select="$legend13_color2"/>
          <xsl:with-param name="bar14_color1" select="$legend14_color1"/>
          <xsl:with-param name="bar14_color2" select="$legend14_color2"/>
          <xsl:with-param name="bar15_color1" select="$legend15_color1"/>
          <xsl:with-param name="bar15_color2" select="$legend15_color2"/>
          <xsl:with-param name="bar16_color1" select="$legend16_color1"/>
          <xsl:with-param name="bar16_color2" select="$legend16_color2"/>			  
        </xsl:call-template>
        <xsl:call-template name="gradient_defs">
          <xsl:with-param name="grad1_color1" select="$grad1_color1"/>
          <xsl:with-param name="grad1_color2" select="$grad1_color2"/>
          <xsl:with-param name="grad2_color1" select="$grad2_color1"/>
          <xsl:with-param name="grad2_color2" select="$grad2_color2"/>
          <xsl:with-param name="grad3_color1" select="$grad3_color1"/>
          <xsl:with-param name="grad3_color2" select="$grad3_color2"/>
          <xsl:with-param name="grad4_color1" select="$grad4_color1"/>
          <xsl:with-param name="grad4_color2" select="$grad4_color2"/>
          <xsl:with-param name="x1" select="$grad_x1"/>
          <xsl:with-param name="x2" select="$grad_x2"/>
          <xsl:with-param name="y1" select="$grad_y1"/>
          <xsl:with-param name="y2" select="$grad_y2"/>
          <xsl:with-param name="units" select="$grad_units"/>
        </xsl:call-template>
        <xsl:call-template name="line_gradient_defs">
          <xsl:with-param name="line1_color1" select="$legend1_color1"/>
          <xsl:with-param name="line1_color2" select="$legend1_color2"/>
          <xsl:with-param name="line2_color1" select="$legend2_color1"/>
          <xsl:with-param name="line2_color2" select="$legend2_color2"/>
          <xsl:with-param name="line3_color1" select="$legend3_color1"/>
          <xsl:with-param name="line3_color2" select="$legend3_color2"/>
          <xsl:with-param name="line4_color1" select="$legend4_color1"/>
          <xsl:with-param name="line4_color2" select="$legend4_color2"/>
          <xsl:with-param name="line5_color1" select="$legend5_color1"/>
          <xsl:with-param name="line5_color2" select="$legend5_color2"/>
          <xsl:with-param name="line6_color1" select="$legend6_color1"/>
          <xsl:with-param name="line6_color2" select="$legend6_color2"/>
          <xsl:with-param name="line7_color1" select="$legend7_color1"/>
          <xsl:with-param name="line7_color2" select="$legend7_color2"/>
          <xsl:with-param name="line8_color1" select="$legend8_color1"/>
          <xsl:with-param name="line8_color2" select="$legend8_color2"/>
		  
          <xsl:with-param name="line9_color1" select="$legend9_color1"/>
          <xsl:with-param name="line9_color2" select="$legend9_color2"/>
          <xsl:with-param name="line10_color1" select="$legend10_color1"/>
          <xsl:with-param name="line10_color2" select="$legend10_color2"/>
          <xsl:with-param name="line11_color1" select="$legend11_color1"/>
          <xsl:with-param name="line11_color2" select="$legend11_color2"/>
          <xsl:with-param name="line12_color1" select="$legend12_color1"/>
          <xsl:with-param name="line12_color2" select="$legend12_color2"/>
          <xsl:with-param name="line13_color1" select="$legend13_color1"/>
          <xsl:with-param name="line13_color2" select="$legend13_color2"/>
          <xsl:with-param name="line14_color1" select="$legend14_color1"/>
          <xsl:with-param name="line14_color2" select="$legend14_color2"/>
          <xsl:with-param name="line15_color1" select="$legend15_color1"/>
          <xsl:with-param name="line15_color2" select="$legend15_color2"/>
          <xsl:with-param name="line16_color1" select="$legend16_color1"/>
          <xsl:with-param name="line16_color2" select="$legend16_color2"/>			  
        </xsl:call-template>
        <xsl:call-template name="bkgd_gradient_defs">
          <xsl:with-param name="color1" select="$background_grad_color1"/>
          <xsl:with-param name="color2" select="$background_grad_color2"/>
          <xsl:with-param name="color3" select="$background_grad_color3"/> 
          <xsl:with-param name="color4" select="$background_grad_color4"/>
          <xsl:with-param name="y1" select="$graph_top_margin"/>
          <xsl:with-param name="y2" select="$viewbox_height - $graph_bottom_margin"/>
          <xsl:with-param name="y0" select="$y0"/>
        </xsl:call-template>
        <xsl:call-template name="filter_defs">
          <xsl:with-param name="shadow_deviation" select="$filter_shadow_deviation" />
        </xsl:call-template>
        <clipPath id="ID_graph_clip">
          <rect x="{$graph_left_margin}"
                y="{$graph_top_margin}"
                width="{$data_group_width * $x_values_count}"
                height="{$viewbox_height - $graph_top_margin - $graph_bottom_margin}" />
        </clipPath>
      </defs>

      <xsl:comment>global stroke and font styles</xsl:comment>
      <g id="ID_globals" style="fill:{$font_color};stroke:none;font-family:{$font_family};font-size:{$font_size}px;font-weight:{$font_weight};font-style:{$font_style};text-decoration:{$font_decoration}">

        <xsl:comment>draw title</xsl:comment>
        <xsl:if test="$title_max_car &gt; 0">
          <g id="ID_title" style="fill:{$title_color};stroke:none;font-family:{$title_font_family};font-size:{$title_font_size}px;font-weight:{$title_font_weight};font-style:{$title_font_style};text-decoration:{$title_font_decoration};filter:{$title_font_filter}" >
            <xsl:call-template name="label_align_middle">
              <xsl:with-param name="x"                      select="$title_pos_x" />
              <xsl:with-param name="y"                      select="$title_pos_y" />
              <xsl:with-param name="text"                   select="$title"/>
              <xsl:with-param name="len"                    select="$title_len"/>
              <xsl:with-param name="font_size"              select="$title_font_size"/>
              <xsl:with-param name="font_descent"           select="$title_font_descent"/>

              <xsl:with-param name="border_visible"         select="$title_border_visible" />
              <xsl:with-param name="border_margin"          select="$title_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$title_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$title_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$title_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$title_border_stroke_width" />
            </xsl:call-template>
          </g>
        </xsl:if>

        <xsl:comment>draw legend</xsl:comment>
        <xsl:if test="x_values/v" >
          <g id="ID_legend" filter="{$legend_rect_filter}">
            <xsl:comment>draw legend border</xsl:comment>
            <xsl:call-template name="legend_border">
              <xsl:with-param name="x" select="$legend_box_x" />
              <xsl:with-param name="y" select="$legend_box_y" />
              <xsl:with-param name="width" select="$legend_box_width" />
              <xsl:with-param name="height" select="$legend_box_height" />
              <xsl:with-param name="fill-color" select="$legend_rect_fill_color" />
              <xsl:with-param name="fill-opacity" select="$legend_rect_fill_opacity" />
              <xsl:with-param name="stroke-color" select="$legend_rect_stroke_color" />
              <xsl:with-param name="stroke-width" select="$legend_rect_stroke_width" />
            </xsl:call-template>
            <xsl:comment>draw legend bullets</xsl:comment>
            <g id="ID_legend_bullets" stroke="NONE">
              <xsl:for-each select="x_values/v">
                <xsl:call-template name="legend_bullet">
                  <xsl:with-param name="x" select="$legend_bullet_x" />
                  <xsl:with-param name="y" select="$legend_bullet_y+$legend_step_y*(position()-1)" />
                  <xsl:with-param name="width" select="$legend_bullet_size" />
                  <xsl:with-param name="height" select="$legend_bullet_size" />
                  <xsl:with-param name="fill" select="concat('url(#ID_bar_grad',string(position()),')')" />
                  <xsl:with-param name="filter" select="$legend_bullet_filter" />
				  <xsl:with-param name="id" select="concat('ID_legend_bullets_', position(), '#', 'legend', position() ,'_color')" />				  
                </xsl:call-template>
              </xsl:for-each>
            </g>
            <xsl:comment>draw legend labels</xsl:comment>
            <g id="ID_legend_labels" style="fill:{$legend_color};stroke:none;font-family:{$legend_font_family};font-size:{$legend_font_size}px;font-weight:{$legend_font_weight};font-style:{$legend_font_style};text-decoration:{$legend_font_decoration};filter:{$legend_font_filter};text-anchor:start">
              <xsl:for-each select="x_values/v">
                <text x="{$legend_label_x}" y="{$legend_label_y+$legend_step_y*(position()-1)}" >
                  <xsl:value-of select="text()"/>
                </text>
              </xsl:for-each>
            </g>
          </g>
        </xsl:if>

        <xsl:comment>draw graph background</xsl:comment>
        <xsl:if test="$background_visible">
          <xsl:call-template name="graph_background">
            <xsl:with-param name="x" select="$graph_left_margin" />
            <xsl:with-param name="y" select="$graph_top_margin" />
            <xsl:with-param name="width" select="$viewbox_width - $graph_right_margin - $graph_left_margin" />
            <xsl:with-param name="height" select="$viewbox_height - $graph_bottom_margin - $graph_top_margin"/>
            <xsl:with-param name="y0" select="$y0"/>
            <xsl:with-param name="top_fill" select="'url(#ID_bkgd_grad1)'"/>
            <xsl:with-param name="bottom_fill" select="'url(#ID_bkgd_grad2)'"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:comment>draw x grid lines</xsl:comment>
        <xsl:for-each select="settings/x_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_x_grid" stroke="{$x_grid_color}" stroke-width="{$x_grid_width}">
              <xsl:for-each select="../../legend/v">
                <xsl:variable name="x_line_pos" select="$graph_left_margin+($data_group_width*position())" />
                <line x1="{$x_line_pos}" y1="{$graph_top_margin}" x2="{$x_line_pos}" y2="{$viewbox_height - $graph_bottom_margin}"/>
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>

        <xsl:comment>draw y grid lines</xsl:comment>
        <xsl:for-each select="settings/y_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_y_grid" stroke="{$y_grid_color}" stroke-width="{$y_grid_width}">
              <xsl:for-each select="../../y_grid_values/s">
                <xsl:variable name="y_line_pos" select="$viewbox_height - $graph_bottom_margin - ((number(text()) - $y_min)*$y_scale)" />
                <line x1="{$graph_left_margin}" y1="{$y_line_pos}" x2="{$viewbox_width - $graph_right_margin}" y2="{$y_line_pos}" />
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>

        <xsl:comment>draw axis x labels</xsl:comment>
        <g id="ID_x_values" style="fill:{$x_label_color};stroke:none;font-family:{$x_label_font_family};font-size:{$x_label_font_size}px;font-weight:{$x_label_font_weight};font-style:{$x_label_font_style};text-decoration:{$x_label_font_decoration};filter:{$x_label_font_filter}">
          <xsl:for-each select="legend/v">
            <xsl:variable name="pos"
              select="$graph_left_margin+($data_group_width*(position()-1))+($data_group_width div 2)"/>

            <!-- create label text element -->
            <xsl:call-template name="label_align_middle">
              <xsl:with-param name="x"                      select="$pos" />
              <xsl:with-param name="y"                      select="$viewbox_height - $base_margin" />
              <xsl:with-param name="text"                   select="exsl4D:format-value(text(),$x_label_format_number,$x_label_format_date,$x_label_format_time)"/>

              <xsl:with-param name="font_size"              select="$x_label_font_size"/>
              <xsl:with-param name="font_descent"           select="$x_label_font_descent"/>

              <xsl:with-param name="border_visible"         select="$x_label_border_visible" />
              <xsl:with-param name="border_margin"          select="$x_label_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$x_label_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$x_label_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$x_label_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$x_label_border_stroke_width" />
            </xsl:call-template>
          </xsl:for-each>
        </g>

        <xsl:comment>draw axis y labels</xsl:comment>
        <g id="ID_y_grid_values" style="fill:{$y_label_color};stroke:none;font-family:{$y_label_font_family};font-size:{$y_label_font_size}px;font-weight:{$y_label_font_weight};font-style:{$y_label_font_style};text-decoration:{$y_label_font_decoration};filter:{$y_label_font_filter}">
          <xsl:for-each select="y_grid_values/s">
            <xsl:variable name="pos" select="position()" />
            <xsl:call-template name="label_align_right">
              <xsl:with-param name="x"                      select="$base_margin+$y_label_width" />
              <xsl:with-param name="y"                      select="$viewbox_height - $graph_bottom_margin - ((number(text()) - $y_min)*$y_scale) + ($font_size div 2)" />
              <xsl:with-param name="text"                   select="exsl4D:format-value(string(../v[$pos]),$y_label_format_number,$y_label_format_date,$y_label_format_time)"/>

              <xsl:with-param name="font_size"              select="$y_label_font_size"/>
              <xsl:with-param name="font_descent"           select="$y_label_font_descent"/>

              <xsl:with-param name="border_visible"         select="$y_label_border_visible" />
              <xsl:with-param name="border_margin"          select="$y_label_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$y_label_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$y_label_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$y_label_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$y_label_border_stroke_width" />
            </xsl:call-template>
          </xsl:for-each>
        </g>

 
        <xsl:comment>draw lines and bullets</xsl:comment>
        <!--<xsl:variable name="y" select="exsl4D:min($y0 - $bar_height,$y_max*$y_scale)" />-->
        <!--<xsl:with-param name="height" select="exsl4D:min($bar_height,$y_min*$y_scale)" />-->

        <xsl:variable name="ymin"  select="$y0 - ($y_max*$y_scale)" />
        <xsl:variable name="ymax"  select="$y0 - ($y_min*$y_scale)" />

        <!-- set graph clipping -->
        <g clip-path="url(#ID_graph_clip)" fill="none" stroke-width="{$line_stroke_width}">
          
        <!-- draw lines -->
        <xsl:for-each select="y_values[1]/s">
		<xsl:variable name = "position" select="position()" />
				
          <xsl:comment>draw line for data type <xsl:value-of select="string(position())"></xsl:value-of></xsl:comment>

          <!-- local variables--> 
          <xsl:variable name="y_values_index" select="position()"/>

          <!-- get data type color -->
          <xsl:variable name="line_color">
            <xsl:choose>
              <xsl:when test="$y_values_index = 1">
                <xsl:value-of select="$legend1_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 2">
                <xsl:value-of select="$legend2_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 3">
                <xsl:value-of select="$legend3_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 4">
                <xsl:value-of select="$legend4_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 5">
                <xsl:value-of select="$legend5_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 6">
                <xsl:value-of select="$legend6_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 7">
                <xsl:value-of select="$legend7_color1"/>
              </xsl:when>
			  
              <xsl:when test="$y_values_index = 8">
                <xsl:value-of select="$legend8_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 9">
                <xsl:value-of select="$legend9_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 10">
                <xsl:value-of select="$legend10_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 11">
                <xsl:value-of select="$legend11_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 12">
                <xsl:value-of select="$legend12_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 13">
                <xsl:value-of select="$legend13_color1"/>
              </xsl:when>
              <xsl:when test="$y_values_index = 14">
                <xsl:value-of select="$legend14_color1"/>
              </xsl:when>			  
              <xsl:when test="$y_values_index = 15">
                <xsl:value-of select="$legend15_color1"/>
              </xsl:when>
			  			  
              <xsl:otherwise>
                <xsl:value-of select="$legend16_color1"/>
              </xsl:otherwise>
            </xsl:choose>  
          </xsl:variable>
          
          <!-- iterate on y numbers -->
		  <!-- to support more than 8 palette colors -->
          <g id="{concat('ID_line_', position(), '#legend', position(), '_color')}" stroke="url(#ID_line_grad{position()})">

<xsl:choose>
<xsl:when test="count(s) &lt;3">
	<xsl:for-each select="/graph/y_values/s[position() = $position]">
	<!-- the bar x and y position -->
	<xsl:variable name="xpos" select="position()" />
	<xsl:variable name="x2" select="$graph_left_margin+($data_group_width*($xpos - 1))+($data_group_width div 2)"/>
	<xsl:variable name="y2" select="$y0 - (number(text())*$y_scale)"/>
		<!-- the line -->
		
		<xsl:choose>
		<!--<xsl:when test="($map_zero_to_null = 1) and (($xpos - 1) &gt; 0)">-->
			<xsl:when test="false()">			
<!--			<xsl:if test="((number(string(//y_values[$y_values_index]/s[$xpos -1]))) != 0) and ((number(string(//y_values[$y_values_index]/s[$xpos]))) != 0)">	-->
				<xsl:if test="((number(string(//y_values[$xpos -1]/s[y_values_index]))) != 0) and ((number(string(//y_values[$xpos]/s[$y_values_index]))) != 0)">	
				
				
				
					<xsl:variable name="x1" select="$graph_left_margin+($data_group_width*($xpos - 2))+($data_group_width div 2)"/>
					
			<!--	<xsl:variable name="y1" select="$y0 - (number(string(//y_values[$y_values_index]/s[$xpos - 1]))*$y_scale)"/> -->
					<xsl:variable name="y1" select="$y0 - (number(string(//y_values[$xpos - 1]/s[$y_values_index]))*$y_scale)"/>
					<xsl:call-template name="line">
						<xsl:with-param name="x1" select="$x1" />
						<xsl:with-param name="y1" select="$y1" />
						<xsl:with-param name="x2" select="$x2" />
						<xsl:with-param name="y2" select="$y2" />
					</xsl:call-template>
				</xsl:if>
			</xsl:when>	
			<xsl:otherwise>
			<xsl:if test="($xpos - 1) &gt; 0" >
				<xsl:variable name="x1" select="$graph_left_margin+($data_group_width*($xpos - 2))+($data_group_width div 2)"/>
				
		<!--	<xsl:variable name="y1" select="$y0 - (number(string(//y_values[$y_values_index]/s[$xpos - 1]))*$y_scale)"/>-->
				<xsl:variable name="y1" select="$y0 - (number(string(//y_values[$xpos - 1]/s[$y_values_index]))*$y_scale)"/>				
				<xsl:call-template name="line">
					<xsl:with-param name="x1" select="$x1" />
					<xsl:with-param name="y1" select="$y1" />
					<xsl:with-param name="x2" select="$x2" />
					<xsl:with-param name="y2" select="$y2" />
				</xsl:call-template>
			</xsl:if>			
			</xsl:otherwise>						
		</xsl:choose>		
			
	</xsl:for-each>
</xsl:when>

<xsl:otherwise>
	<xsl:element name="path">
		<xsl:attribute name="d">
			<xsl:for-each select="s">		
				<xsl:variable name="xpos" select="position()" />
				<xsl:variable name="x2" select="$graph_left_margin+($data_group_width*($xpos - 1))+($data_group_width div 2)"/>
				<xsl:variable name="y2" select="$y0 - (number(text())*$y_scale)"/>
				<xsl:variable name="x1" select="$graph_left_margin+($data_group_width*($xpos - 2))+($data_group_width div 2)"/>
				
		<!--	<xsl:variable name="y1" select="$y0 - (number(string(//y_values[$y_values_index]/s[$xpos - 1]))*$y_scale)"/>-->
				<xsl:variable name="y1" select="$y0 - (number(string(//y_values[$xpos - 1]/s[$y_values_index]))*$y_scale)"/>				
				<xsl:choose>
					<xsl:when test="position() = 1">
					</xsl:when>
					<xsl:when test="position() = 2">														
						<xsl:choose>
						<!--<xsl:when test="$map_zero_to_null = 1">-->		
							<xsl:when test="false()">									
								<xsl:choose>
							<!--	<xsl:when test="(number(string(//y_values[$y_values_index]/s[$xpos - 1])) = 0) or (number(string(//y_values[$y_values_index]/s[$xpos])) = 0)">-->
									<xsl:when test="(number(string(//y_values[$xpos - 1]/s[$y_values_index])) = 0) or (number(string(//y_values[$xpos]/s[$y_values_index])) = 0)">
									
										<xsl:value-of select="concat('M', $x2, ' ', $y2, ' ')" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('M', $x1, ' ', $y1, ' L', $x2, ' ', $y2, ' ')" />								
									</xsl:otherwise>												
								</xsl:choose>																		
									</xsl:when>		
									<xsl:otherwise>
										<xsl:value-of select="concat('M', $x1, ' ', $y1, ' L', $x2, ' ', $y2, ' ')" />			
									</xsl:otherwise>				
								</xsl:choose>	
					</xsl:when>	
					<xsl:otherwise>
					
						<xsl:choose>
						<!--<xsl:when test="$map_zero_to_null = 1">-->	
							<xsl:when test="false()">									
								<xsl:choose>
								<!-- 4D SVG does not allow void paths -->
						<!--		<xsl:when test="(number(string(//y_values[$y_values_index]/s[$xpos])) = 0) and (position() != last())">-->
									<xsl:when test="(number(string(//y_values[$xpos]/s[$y_values_index])) = 0) and (position() != last())">									
										<xsl:value-of select="concat('M', $x2, ' ', $y2, ' ')" />	
									</xsl:when>	
						<!--		<xsl:when test="(number(string(//y_values[$y_values_index]/s[$xpos - 1])) = 0) and (position() != last())">-->
									<xsl:when test="(number(string(//y_values[$xpos - 1]/s[$y_values_index])) = 0) and (position() != last())">									
										<xsl:value-of select="concat('M', $x2, ' ', $y2, ' ')" />		
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="concat('L', $x2, ' ', $y2, ' ')" />								
									</xsl:otherwise>				
								</xsl:choose>	
							</xsl:when>	
							<xsl:otherwise>
								<xsl:value-of select="concat('L', $x2, ' ', $y2, ' ')" />								
							</xsl:otherwise>										
						</xsl:choose>
																																			
				
					</xsl:otherwise>								
				</xsl:choose>				
			</xsl:for-each>
		</xsl:attribute>
	</xsl:element>	
</xsl:otherwise>
</xsl:choose>


			
          </g>
        </xsl:for-each>

        <!-- draw bullets -->
        <xsl:for-each select="y_values[1]/s">
		<xsl:variable name = "position" select="position()" />
				
          <xsl:comment>draw bullet for data type <xsl:value-of select="string(position())"></xsl:value-of></xsl:comment>

          <!-- local variables-->
          <xsl:variable name="y_values_index" select="position()"/>

          <!-- iterate on y numbers -->
           <g id="{concat('ID_bullet_', position(), '#legend', position(), '_color')}" fill="url(#ID_line_grad{position()})" stroke="none" >
            <xsl:for-each select="/graph/y_values/s[position() = $position]">
              <!-- the bar x and y position -->
              <xsl:variable name="xpos" select="position()" />
              
              <xsl:variable name="x2"
                            select="$graph_left_margin+($data_group_width*($xpos - 1))+($data_group_width div 2)"/>
              <xsl:variable name="y2"
                            select="$y0 - (number(text())*$y_scale)"/>
              
              <!-- the bullet -->
			<xsl:if test="$line_bullet_visible = 1">
              <xsl:if test="(($y2+1) &gt; $ymin) and (($y2 - 1) &lt; $ymax)" >
                <xsl:call-template name="line_bullet">
                  <xsl:with-param name="cx" select="$x2" />
                  <xsl:with-param name="cy" select="$y2" />
                  <xsl:with-param name="r" select="$line_bullet_r" />
                </xsl:call-template>
			</xsl:if>
			</xsl:if>
            </xsl:for-each>
          </g>
        </xsl:for-each>
        </g>
        
        <xsl:comment>draw the axes</xsl:comment>
        <xsl:comment>draw horizontal axes</xsl:comment>
        <g id="ID_x_axis" stroke="{$axis_color}" stroke-width="{$axis_width}" >
          <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$graph_top_margin}" y2="{$graph_top_margin}"/>
          <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$viewbox_height - $graph_bottom_margin}"/>
        </g>
        <xsl:comment>draw y=0 axe</xsl:comment>
        <xsl:if test="$y_min &lt; 0">
          <g id="ID_y0_axis" stroke="{$axis_y0_color}" stroke-width="{$axis_width}" >
            <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$y0}" y2="{$y0}"/>
          </g>
        </xsl:if>
        <xsl:comment>draw vertical axes</xsl:comment>
        <g id="ID_y_axis" stroke="{$axis_color}" stroke-width="{$axis_width}">
          <line x1="{$graph_left_margin}" x2="{$graph_left_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$graph_top_margin}"/>
          <line x1="{$viewbox_width - $graph_right_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$graph_top_margin}"/>
        </g>
      </g>
    </svg>
  </xsl:template>
</xsl:stylesheet>
