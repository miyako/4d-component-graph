<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

  <!-- top-level parameters -->
				
  <xsl:param name="settings" select="/graph/settings" /> 
    				
  <!-- viewport properties --> 
  <xsl:param name="viewport_color" select="$settings/@viewport_color" />
  <xsl:param name="viewport_opacity" select="$settings/@viewport_opacity" />
  <xsl:param name="viewport_height" select="$settings/@viewport_height" />
  <xsl:param name="viewport_width" select="$settings/@viewport_width" /> 	
  
  <!-- font properties -->
  <xsl:param name="font_color" select="$settings/@font_color" />
  <xsl:param name="font_family" select="$settings/@font_family" />
  <xsl:param name="font_size" select="$settings/@font_size" />
  <xsl:param name="font_width" select="$font_size div 2" />
  <xsl:param name="font_descent" select="$font_size div 10" />  
  <xsl:param name="font_weight" select="$settings/@font_weight" />
  <xsl:param name="font_style" select="$settings/@font_style" />
  <xsl:param name="font_decoration" select="$settings/@font_decoration" />  
  <xsl:param name="font_filter" select="'none'" /> 

  <!-- layout properties -->
  <xsl:param name="base_margin" select="$settings/@base_margin" />  
  
  <!-- title properties -->
  <xsl:param name="title_color"             select="$settings/@title_font_color" />
  <xsl:param name="title_font_family"       select="$settings/@title_font_family" />
  <xsl:param name="title_font_size"         select="$settings/@title_font_size" />
  <xsl:param name="title_font_width"        select="$title_font_size div 2" />
  <xsl:param name="title_font_descent"      select="$title_font_size div 10" />
  <xsl:param name="title_font_weight"       select="$settings/@title_font_weight" />
  <xsl:param name="title_font_style"        select="$settings/@title_font_style" />
  <xsl:param name="title_font_decoration"   select="$settings/@title_font_decoration" />
  <xsl:param name="title_font_filter"       select="$font_filter" />    
  <xsl:param name="title"					select="$settings/@title" />
  <xsl:param name="title_len"				select="$settings/@title_len" />
  <xsl:param name="title_margin"            select="$settings/@title_margin" />
  <xsl:param name="title_border_visible"      select="number($settings/@title_border_visible)" />
  <xsl:param name="title_border_margin"       select="$settings/@title_border_margin" />
  <xsl:param name="title_border_fill_color"   select="$settings/@title_border_fill_color" />
  <xsl:param name="title_border_fill_opacity" select="$settings/@title_border_fill_opacity" />
  <xsl:param name="title_border_stroke_color" select="$settings/@title_border_stroke_color" />
  <xsl:param name="title_border_stroke_width" select="$settings/@title_border_stroke_width" />  

  <!-- grid properties -->
  <xsl:param name="x_grid_color" select="$settings/@x_grid_color" />
  <xsl:param name="x_grid_width" select="$settings/@x_grid_width" />

  <xsl:param name="y_grid_color" select="$settings/@y_grid_color" />
  <xsl:param name="y_grid_width" select="$settings/@y_grid_width" />

  <!-- axis properties -->
  <xsl:param name="axis_color" select="$settings/@axis_color" />
  <xsl:param name="axis_y0_color" select="$settings/@axis_y0_color" />
  <xsl:param name="axis_width" select="$settings/@axis_width" />

  <!-- x label properties -->
  <xsl:param name="x_label_color"            select="$font_color" />   
  <xsl:param name="x_label_font_family"      select="$font_family" />
  <xsl:param name="x_label_font_size"        select="$font_size" />
  <xsl:param name="x_label_font_width"       select="$x_label_font_size div 2" />
  <xsl:param name="x_label_font_descent"     select="$x_label_font_size div 10" />
  <xsl:param name="x_label_font_weight"      select="$font_weight" />
  <xsl:param name="x_label_font_style"       select="$font_style" />
  <xsl:param name="x_label_font_decoration"  select="$font_decoration" /> 
  <xsl:param name="x_label_font_filter"      select="$font_filter" />

  <xsl:param name="x_label_border_visible"      select="number($settings/@x_label_border_visible)" />
  <xsl:param name="x_label_border_margin"       select="$settings/@x_label_border_margin" />
  <xsl:param name="x_label_border_fill_color"   select="$settings/@x_label_border_fill_color" />
  <xsl:param name="x_label_border_fill_opacity" select="$settings/@x_label_border_fill_opacity" />
  <xsl:param name="x_label_border_stroke_color" select="$settings/@x_label_border_stroke_color" />
  <xsl:param name="x_label_border_stroke_width" select="$settings/@x_label_border_stroke_width" />

  <!-- y label properties -->
  
  <xsl:param name="y_label_color"            select="$font_color" />
  <xsl:param name="y_label_font_family"      select="$font_family" />
  <xsl:param name="y_label_font_size"        select="$font_size" />
  <xsl:param name="y_label_font_width"       select="$y_label_font_size div 2" />
  <xsl:param name="y_label_font_descent"     select="$y_label_font_size div 10" />
  <xsl:param name="y_label_font_weight"      select="$font_weight" />
  <xsl:param name="y_label_font_style"       select="$font_style" />
  <xsl:param name="y_label_font_decoration"  select="$font_decoration" />
  <xsl:param name="y_label_font_filter"      select="$font_filter" />

  <xsl:param name="y_label_border_visible"      select="number($settings/@y_label_border_visible)" />
  <xsl:param name="y_label_border_margin"       select="$settings/@y_label_border_margin" />
  <xsl:param name="y_label_border_fill_color"   select="$settings/@y_label_border_fill_color" />
  <xsl:param name="y_label_border_fill_opacity" select="$settings/@y_label_border_fill_opacity" />
  <xsl:param name="y_label_border_stroke_color" select="$settings/@y_label_border_stroke_color" />
  <xsl:param name="y_label_border_stroke_width" select="$settings/@y_label_border_stroke_width" />
      
  <!-- legend properties -->
  <xsl:param name="legend_color"            select="$font_color" />
  <xsl:param name="legend_font_family"      select="$font_family" />
  <xsl:param name="legend_font_size"        select="$settings/@legend_font_size" />
  <xsl:param name="legend_font_width"       select="$legend_font_size div 2" />
  <xsl:param name="legend_font_descent"     select="$legend_font_size div 10" />
  <xsl:param name="legend_font_weight"      select="$font_weight" />
  <xsl:param name="legend_font_style"       select="$font_style" />
  <xsl:param name="legend_font_decoration"  select="$font_decoration" /> 
  <xsl:param name="legend_font_filter"      select="$font_filter" />
  <xsl:param name="legend_bullet_size" select="$settings/@legend_bullet_size" /> 
  <xsl:param name="legend_bullet_filter" select="'none'"/>
    
  <!-- column bars properties -->
  <xsl:param name="bar_size" select="$settings/@bar_size"/>
  <xsl:param name="bar_size_min" select="$settings/@bar_size_min"/>
  <xsl:param name="bar_r" select="$settings/@bar_r"/>
  <xsl:param name="bar_filter" select="'none'"/>	
	    
  <xsl:param name="legend_rect_fill_color" select="$settings/@legend_rect_fill_color" />
  <xsl:param name="legend_rect_fill_opacity" select="$settings/@legend_rect_fill_opacity" />
  <xsl:param name="legend_rect_stroke_color" select="$settings/@legend_rect_stroke_color" />
  <xsl:param name="legend_rect_stroke_width" select="$settings/@legend_rect_stroke_width" />
  <xsl:param name="legend_rect_filter" select="'none'"/>  

  <!-- background properties -->
  <xsl:param name="background_visible" select="number($settings/@background_visible)"/>
    
  <!-- label format properties -->
  <xsl:param name="label_format_number" select="$settings/@label_format_number" />
  <xsl:param name="label_format_date"   select="$settings/@label_format_date" />
  <xsl:param name="label_format_time"   select="$settings/@label_format_time" />
  
  <xsl:param name="x_label_format_number" select="$label_format_number" />
  <xsl:param name="x_label_format_date"   select="$label_format_date" />
  <xsl:param name="x_label_format_time"   select="$label_format_time" />

  <xsl:param name="y_label_format_number" select="$label_format_number" />
  <xsl:param name="y_label_format_date"   select="$label_format_date" />
  <xsl:param name="y_label_format_time"   select="$label_format_time" />	

  <!-- line bullet properties -->
  <xsl:param name="line_bullet_r" select="$settings/@line_bullet_r" />
  <xsl:param name="line_stroke_width" select="$settings/@line_stroke_width" />
  <xsl:param name="line_bullet_visible" select="$settings/@line_bullet_visible" />

  <!-- area properties -->
  <xsl:param name="area_opacity" select="$settings/@area_opacity" />
  <xsl:param name="area_stroke_width" select="$settings/@area_stroke_width" />
  <xsl:param name="area_stroke_color" select="$settings/@area_stroke_color" />

  <!-- highcharts properties -->			
  <xsl:param name="map_zero_to_null" select="number($settings/@map_zero_to_null)" />			
  <xsl:param name="subtitle" select="$settings/@subtitle" />
  <xsl:param name="y_label_title" select="$settings/@y_label_title" /> 
  <xsl:param name="fill_opacity" select="$settings/@fill_opacity" />
  <xsl:param name="datalabels_enabled" select="number($settings/@datalabels_enabled)" />	   
  <xsl:param name="legend_visible" select="number($settings/@legend_visible)" />
  <xsl:param name="legend_shadow" select="number($settings/@legend_shadow)" />	
  <xsl:param name="legend_floating" select="number($settings/@legend_floating)" />	  
  <xsl:param name="mousetracking_enabled" select="number($settings/@mousetracking_enabled)" />	
      	
  <xsl:param name="background_grad_color1" select="$settings/@background_grad_color1"/>
  <xsl:param name="background_grad_color2" select="$settings/@background_grad_color2"/>
  <xsl:param name="background_grad_color3" select="$settings/@background_grad_color3"/>
  <xsl:param name="background_grad_color4" select="$settings/@background_grad_color4"/>
																													
  <xsl:param name="grad1_color1" select="$settings/@grad1_color1"/>
  <xsl:param name="grad1_color2" select="$settings/@grad1_color2"/>

  <xsl:param name="grad2_color1" select="$settings/@grad2_color1"/>
  <xsl:param name="grad2_color2" select="$settings/@grad2_color2"/>

  <xsl:param name="grad3_color1" select="$settings/@grad3_color1"/>
  <xsl:param name="grad3_color2" select="$settings/@grad3_color2"/>

  <xsl:param name="grad4_color1" select="$settings/@grad4_color1"/>
  <xsl:param name="grad4_color2" select="$settings/@grad4_color2"/>

  <xsl:param name="legend1_color1" select="$settings/@legend1_color1"/>
  <xsl:param name="legend1_color2" select="$settings/@legend1_color2"/>

  <xsl:param name="legend2_color1" select="$settings/@legend2_color1"/>
  <xsl:param name="legend2_color2" select="$settings/@legend2_color2"/>

  <xsl:param name="legend3_color1" select="$settings/@legend3_color1"/>
  <xsl:param name="legend3_color2" select="$settings/@legend3_color2"/>

  <xsl:param name="legend4_color1" select="$settings/@legend4_color1"/>
  <xsl:param name="legend4_color2" select="$settings/@legend4_color2"/>

  <xsl:param name="legend5_color1" select="$settings/@legend5_color1"/>
  <xsl:param name="legend5_color2" select="$settings/@legend5_color2"/>

  <xsl:param name="legend6_color1" select="$settings/@legend6_color1"/>
  <xsl:param name="legend6_color2" select="$settings/@legend6_color2"/>

  <xsl:param name="legend7_color1" select="$settings/@legend7_color1"/>
  <xsl:param name="legend7_color2" select="$settings/@legend7_color2"/>

  <xsl:param name="legend8_color1" select="$settings/@legend8_color1"/>
  <xsl:param name="legend8_color2" select="$settings/@legend8_color2"/>

  <xsl:param name="legend9_color1" select="$settings/@legend9_color1"/>
  <xsl:param name="legend9_color2" select="$settings/@legend9_color2"/>

  <xsl:param name="legend10_color1" select="$settings/@legend10_color1"/>
  <xsl:param name="legend10_color2" select="$settings/@legend10_color2"/>

  <xsl:param name="legend11_color1" select="$settings/@legend11_color1"/>
  <xsl:param name="legend11_color2" select="$settings/@legend11_color2"/>

  <xsl:param name="legend12_color1" select="$settings/@legend12_color1"/>
  <xsl:param name="legend12_color2" select="$settings/@legend12_color2"/>

  <xsl:param name="legend13_color1" select="$settings/@legend13_color1"/>
  <xsl:param name="legend13_color2" select="$settings/@legend13_color2"/>

  <xsl:param name="legend14_color1" select="$settings/@legend14_color1"/>
  <xsl:param name="legend14_color2" select="$settings/@legend14_color2"/>

  <xsl:param name="legend15_color1" select="$settings/@legend15_color1"/>
  <xsl:param name="legend15_color2" select="$settings/@legend15_color2"/>

  <xsl:param name="legend16_color1" select="$settings/@legend16_color1"/>
  <xsl:param name="legend16_color2" select="$settings/@legend16_color2"/>
   
	<!-- pie properties -->
	<xsl:param name="pie_size_min" select="$settings/@pie_size_min"/>
	<xsl:param name="pie_filter"  select="$settings/@pie_filter"/>
	<xsl:param name="pie_ellipse"  select="$settings/@pie_ellipse"/>

	<xsl:param name="pie_offset1" select="$settings/@pie_offset1"/>
	<xsl:param name="pie_offset2" select="$settings/@pie_offset2"/>

	<xsl:param name="pie_focal_x" select="$settings/@pie_focal_x"/>
	<xsl:param name="pie_focal_y" select="$settings/@pie_focal_y"/>

	<xsl:param name="pie_label_color"             select="$font_color" />
	<xsl:param name="pie_label_font_family"       select="$font_family" />
	<xsl:param name="pie_label_font_weight"       select="$font_weight" />
	<xsl:param name="pie_label_font_style"        select="$font_style" />
	<xsl:param name="pie_label_font_decoration"   select="$font_decoration" />
	<xsl:param name="pie_label_font_filter"       select="$font_filter" />
	
	<!-- shadow properties -->
	<xsl:param name="shadow_visible"          select="$settings/@shadow_visible"/>
	<xsl:param name="shadow_color"            select="$settings/@shadow_color"/>
	<xsl:param name="shadow_offset_x"         select="$settings/@shadow_offset_x"/>
	<xsl:param name="shadow_offset_y"         select="$settings/@shadow_offset_y"/>

	<!-- pie label properties -->
	<xsl:param name="pie_label_visible"           select="$settings/@pie_label_visible" />
	<xsl:param name="pie_label_font_size"         select="$settings/@pie_label_font_size" />
	<xsl:param name="pie_label_font_width"        select="$pie_label_font_size div 2" />
	<xsl:param name="pie_label_font_descent"      select="$pie_label_font_size div 10" />
	<xsl:param name="pie_label_format"            select="$settings/@pie_label_format" />

	<xsl:param name="pie_label_border_visible"      select="$settings/@pie_label_border_visible" />
	<xsl:param name="pie_label_border_margin"       select="$settings/@pie_label_border_margin" />
	<xsl:param name="pie_label_border_fill_color"   select="$settings/@pie_label_border_fill_color" />
	<xsl:param name="pie_label_border_fill_opacity" select="$settings/@pie_label_border_fill_opacity" />
	<xsl:param name="pie_label_border_stroke_color" select="$settings/@pie_label_border_stroke_color" />
	<xsl:param name="pie_label_border_stroke_width" select="$settings/@pie_label_border_stroke_width" />																																																			 																																																	

	<xsl:param name="background_image_width" select="$settings/@background_image_width" />
	<xsl:param name="background_image_height" select="$settings/@background_image_height" />
	<xsl:param name="background_image_data" select="$settings/@background_image_data" />
		
	<!-- for highcharts -->

<xsl:param name="format" select="'html'" />
<xsl:param name="width" select="$settings/@width" />
<xsl:param name="height" select="$settings/@height" />

<xsl:param name="plot_background_color" select="$settings/@plot_background_color" />
<xsl:param name="plot_border_width" select="$settings/@plot_border_width" />
<xsl:param name="plot_shadow" select="$settings/@plot_shadow" />
<xsl:param name="border_width" select="$settings/@border_width" />

<xsl:param name="title_vertical_align" select="$settings/@title_vertical_align" />
<xsl:param name="title_align" select="$settings/@title_align" />
<xsl:param name="title_floating" select="$settings/@title_floating" />
<xsl:param name="title_x" select="$settings/@title_x" />
<xsl:param name="title_y" select="$settings/@title_y" />

<xsl:param name="subtitle_align" select="$settings/@subtitle_align" />
<xsl:param name="subtitle_vertical_align" select="$settings/@subtitle_vertical_align" />
<xsl:param name="subtitle_floating" select="$settings/@subtitle_floating" />
<xsl:param name="subtitle_x" select="$settings/@subtitle_x" />
<xsl:param name="subtitle_y" select="$settings/@subtitle_y" />
<xsl:param name="subtitle_color" select="$settings/@subtitle_color" />
<xsl:param name="subtitle_font_size" select="$settings/@subtitle_font_size" />
<xsl:param name="subtitle_font_style" select="$settings/@subtitle_font_style" />
<xsl:param name="subtitle_font_decoration" select="$settings/@subtitle_font_decoration" />
<xsl:param name="subtitle_font_family" select="$settings/@subtitle_font_family" />
<xsl:param name="subtitle_font_weight" select="$settings/@subtitle_font_weight" />

	<!-- for google -->

<xsl:param name="is3D" select="$settings/@is3D" />
<xsl:param name="plot_stroke_color" select="$settings/@plot_stroke_color" />
<xsl:param name="plot_fill_color" select="$settings/@plot_fill_color" />
<xsl:param name="legend_position" select="$settings/@legend_position" />
<xsl:param name="tooltip_text" select="$settings/@tooltip_text" />
<xsl:param name="tooltip_font_color" select="$settings/@tooltip_font_color" />
<xsl:param name="tooltip_font_family" select="$settings/@tooltip_font_family" />
<xsl:param name="tooltip_font_size" select="$settings/@tooltip_font_size" />

<xsl:param name="pie_slice_text" select="$settings/@pie_slice_text" />
<xsl:param name="reverse_categories" select="$settings/@reverse_categories" />
<xsl:param name="slice_visibility_threshold" select="$settings/@slice_visibility_threshold" />
<xsl:param name="pie_residue_slice_color" select="$settings/@pie_residue_slice_color" />
<xsl:param name="pie_residue_slice_label" select="$settings/@pie_residue_slice_label" />

</xsl:stylesheet>