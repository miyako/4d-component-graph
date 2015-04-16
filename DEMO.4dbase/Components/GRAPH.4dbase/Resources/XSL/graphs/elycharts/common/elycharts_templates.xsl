<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
				xmlns:str="http://exslt.org/strings"
				exclude-result-prefixes="xsl str exsl4D math"
                >

<xsl:strip-space elements="*" />
  <xsl:output method="xml" encoding="UTF-8" indent="no" />

<xsl:template name="color-definition">
<xsl:text>
 series : {
	serie1 : {
		color : '270-</xsl:text><xsl:value-of select="$legend1_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend1_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend1_color1" /><xsl:text>'
			}
		}
	},
	serie2 : {
		color : '270-</xsl:text><xsl:value-of select="$legend2_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend2_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend2_color1" /><xsl:text>'
			}
		}
	},
	serie3 : {
		color : '270-</xsl:text><xsl:value-of select="$legend3_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend3_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend3_color1" /><xsl:text>'
			}
		}
	},
	serie4 : {
		color : '270-</xsl:text><xsl:value-of select="$legend4_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend4_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend4_color1" /><xsl:text>'
			}
		}
	},	
	serie5 : {
		color : '270-</xsl:text><xsl:value-of select="$legend5_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend5_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend5_color1" /><xsl:text>'
			}
		}
	},
	serie6 : {
		color : '270-</xsl:text><xsl:value-of select="$legend6_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend6_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend6_color1" /><xsl:text>'
			}
		}
	},
	serie7 : {
		color : '270-</xsl:text><xsl:value-of select="$legend7_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend7_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend7_color1" /><xsl:text>'
			}
		}
	},
	serie8 : {
		color : '270-</xsl:text><xsl:value-of select="$legend8_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend8_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend8_color1" /><xsl:text>'
			}
		}
	},	
	serie9 : {
		color : '270-</xsl:text><xsl:value-of select="$legend9_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend9_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend9_color1" /><xsl:text>'
			}
		}
	},	
	serie10 : {
		color : '270-</xsl:text><xsl:value-of select="$legend10_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend10_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend10_color1" /><xsl:text>'
			}
		}
	},	
	serie11 : {
		color : '270-</xsl:text><xsl:value-of select="$legend11_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend11_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend11_color1" /><xsl:text>'
			}
		}
	},	
	serie12 : {
		color : '270-</xsl:text><xsl:value-of select="$legend12_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend12_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend12_color1" /><xsl:text>'
			}
		}
	},	
	serie13 : {
		color : '270-</xsl:text><xsl:value-of select="$legend13_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend13_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend13_color1" /><xsl:text>'
			}
		}
	},		
	serie14 : {
		color : '270-</xsl:text><xsl:value-of select="$legend14_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend14_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend14_color1" /><xsl:text>'
			}
		}
	},	
	serie15 : {
		color : '270-</xsl:text><xsl:value-of select="$legend15_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend15_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend15_color1" /><xsl:text>'
			}
		}
	},	
	serie16 : {
		color : '270-</xsl:text><xsl:value-of select="$legend16_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend16_color2" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend16_color1" /><xsl:text>'
			}
		}
	}  
 },
</xsl:text>
</xsl:template>

<xsl:template name="color-definition-opaque">
<xsl:text>
 series : {
	serie1 : {
		color : '</xsl:text><xsl:value-of select="$legend1_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend1_color1" /><xsl:text>'
			}
		}
	},
	serie2 : {
		color : '</xsl:text><xsl:value-of select="$legend2_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend2_color1" /><xsl:text>'
			}
		}
	},
	serie3 : {
		color : '</xsl:text><xsl:value-of select="$legend3_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend3_color1" /><xsl:text>'
			}
		}
	},
	serie4 : {
		color : '</xsl:text><xsl:value-of select="$legend4_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend4_color1" /><xsl:text>'
			}
		}
	},	
	serie5 : {
		color : '</xsl:text><xsl:value-of select="$legend5_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend5_color1" /><xsl:text>'
			}
		}
	},
	serie6 : {
		color : '</xsl:text><xsl:value-of select="$legend6_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend6_color1" /><xsl:text>'
			}
		}
	},
	serie7 : {
		color : '</xsl:text><xsl:value-of select="$legend7_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend7_color1" /><xsl:text>'
			}
		}
	},
	serie8 : {
		color : '</xsl:text><xsl:value-of select="$legend8_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend8_color1" /><xsl:text>'
			}
		}
	},	
	serie9 : {
		color : '</xsl:text><xsl:value-of select="$legend9_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend9_color1" /><xsl:text>'
			}
		}
	},	
	serie10 : {
		color : '</xsl:text><xsl:value-of select="$legend10_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend10_color1" /><xsl:text>'
			}
		}
	},	
	serie11 : {
		color : '</xsl:text><xsl:value-of select="$legend11_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend11_color1" /><xsl:text>'
			}
		}
	},	
	serie12 : {
		color : '</xsl:text><xsl:value-of select="$legend12_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend12_color1" /><xsl:text>'
			}
		}
	},	
	serie13 : {
		color : '</xsl:text><xsl:value-of select="$legend13_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend13_color1" /><xsl:text>'
			}
		}
	},		
	serie14 : {
		color : '</xsl:text><xsl:value-of select="$legend14_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend14_color1" /><xsl:text>'
			}
		}
	},	
	serie15 : {
		color : '</xsl:text><xsl:value-of select="$legend15_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend15_color1" /><xsl:text>'
			}
		}
	},	
	serie16 : {
		color : '</xsl:text><xsl:value-of select="$legend16_color1" /><xsl:text>',
		tooltip : {
			frameProps : {
				stroke : '</xsl:text><xsl:value-of select="$legend16_color1" /><xsl:text>'
			}
		}
	}  
 },
</xsl:text>
</xsl:template>

<xsl:template name="color-definition-pie">
<xsl:text>
 defaultSeries : {
	values : [{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend1_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend1_color2" /><xsl:text>'
		}
	},	
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend2_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend2_color2" /><xsl:text>'
		}
	},
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend3_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend3_color2" /><xsl:text>'
		}
	},
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend4_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend4_color2" /><xsl:text>'
		}
	},
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend5_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend5_color2" /><xsl:text>'
		}
	},	
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend6_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend6_color2" /><xsl:text>'
		}
	},
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend7_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend7_color2" /><xsl:text>'
		}
	},
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend8_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend8_color2" /><xsl:text>'
		}
	},				
	{
		plotProps : {
			fill : '270-</xsl:text><xsl:value-of select="$legend16_color1" /><xsl:text>-</xsl:text><xsl:value-of select="$legend16_color2" /><xsl:text>'
		}
	}] 
 },
</xsl:text>
</xsl:template>

<xsl:template name="import-template-chart1">
<xsl:text>
$.elycharts.templates['chart1'] = {
		type : 'line',
		defaultSeries : {
			plotProps : {
				opacity : 0.6
			},
			highlight : {
				overlayProps : {
					fill : 'white',
					opacity : 0.2
				}
			},
			startAnimation : {
				active : true,
				type : 'grow'
			},
			tooltip : {
				frameProps : {
						opacity : 0.8
					},
					offset : [10, 40]
			},
			type : 'bar'
		},
		barMargins : 10,
</xsl:text>
<xsl:call-template name="color-definition" />
<xsl:call-template name="default-axis" />
<xsl:call-template name="features-grid" />
<xsl:text>
};
</xsl:text>	
</xsl:template>

<xsl:template name="import-template-chart2">
<xsl:text>
$.elycharts.templates['chart2'] = {
		type : 'line',
		defaultSeries : {
			plotProps : {
				opacity : 0.6
			},
			highlight : {
				overlayProps : {
					fill : 'white',
					opacity : 0.2
				}
			},
			startAnimation : {
				active : true,
				type : 'grow'
			},
			tooltip : {
				frameProps : {
						opacity : 0.8
					},
					offset : [10, 40]
			},
			type : 'bar',
			stacked : true
		},
		barMargins : 10,
</xsl:text>
<xsl:call-template name="color-definition" />
<xsl:call-template name="default-axis" />
<xsl:call-template name="features-grid" />
<xsl:text>
};
</xsl:text>	
</xsl:template>

<xsl:template name="import-template-chart3">
<xsl:text>
$.elycharts.templates['chart3'] = {
		type : 'line',
		defaultSeries : {
			plotProps : {
				opacity : 0.6
			},
			highlight : {
				overlayProps : {
					fill : 'white',
					opacity : 0.2
				}
			},
			startAnimation : {
				active : true,
				type : 'grow'
			},
			tooltip : {
				frameProps : {
						opacity : 0.8
					},
					offset : [10, 40]
			},
			type : 'bar',
			stacked : true
		},
		barMargins : 10,
</xsl:text>
<xsl:call-template name="color-definition" />
<xsl:call-template name="default-axis" />
<xsl:call-template name="features-grid" />
<xsl:text>
};
</xsl:text>	
</xsl:template>

<xsl:template name="import-template-chart7">
<xsl:text>
$.elycharts.templates['chart7'] = {
	type : 'pie',
	defaultSeries : {
		plotProps : {
			stroke : 'white',
			'stroke-width' : 2,
			opacity : 0.6
		},
		highlight : {
			move : 10
		},  
		tooltip : {
			frameProps : {
				opacity : 0.8
			}
		},
		startAnimation : {
			active : true,
			type : 'avg'
		}
	} 
};
</xsl:text>	
</xsl:template>

<xsl:template name="import-template-chart7-d">
<xsl:text>
$.elycharts.templates['chart7'] = {
	type : 'pie',
	defaultSeries : {
		r : -0.5,
		plotProps : {
			stroke : 'white',
			'stroke-width' : 2,
			opacity : 0.6
		}, 
		tooltip : {
			frameProps : {
				opacity : 0.8
			}
		},
		label : {
			active : true,
			props : {
				fill : 'white'
			}
		},		
		startAnimation : {
			active : true,
			type : 'grow'
		}
	} 
};
</xsl:text>	
</xsl:template>

<xsl:template name="default-axis">
<xsl:text>
	defaultAxis : {
		labels : true
	},
</xsl:text>	
</xsl:template>

<xsl:template name="features-grid">
<xsl:text>
features : {
	grid : {
		draw : [true, false],
		forceBorder : false,
		evenHProps : {
			fill : '</xsl:text><xsl:value-of select="$background_grad_color1" /><xsl:text>',
			opacity : 0.2
		},
		oddHProps : {
			fill : '</xsl:text><xsl:value-of select="$background_grad_color2" /><xsl:text>',
			opacity : 0.2
		}
	}
}
</xsl:text>
</xsl:template>

<xsl:template name="import-template-chart4">
<xsl:text>
$.elycharts.templates['chart4'] = {
		type : 'line',
		defaultSeries : {
			plotProps : {
				'stroke-width' : 4
			},
			dot : true,
			dotProps : {
				stroke : 'white',
				'stroke-width' : 2
			},
			startAnimation : {
				active : true,
				type : 'avg',
				easing : 'bounce'
			},
			tooltip : {
				frameProps : {
						opacity : 0.8
					},
					offset : [10, 50]
			},
			fill : false,
			stacked : false,
			highlight : {
				scale : 2
			}									
		},
</xsl:text>
<xsl:call-template name="color-definition-opaque" />
<xsl:call-template name="default-axis" />
<xsl:call-template name="features-grid" />
<xsl:text>
};	
</xsl:text>	
</xsl:template>

<xsl:template name="import-template-chart5">
<xsl:text>
$.elycharts.templates['chart5'] = {
		type : 'line',
		defaultSeries : {
			plotProps : {
				'stroke-width' : 4
			},
			dot : true,
			dotProps : {
				stroke : 'white',
				'stroke-width' : 2
			},
			startAnimation : {
				active : true,
				type : 'grow',
				easing : 'bounce'
			},
			tooltip : {
				frameProps : {
						opacity : 0.8
					},
					offset : [10, 50]
			},
			fill : true,
			stacked : false,
			highlight : {
				scale : 2
			}									
		},
</xsl:text>
<xsl:call-template name="color-definition-opaque" />
<xsl:call-template name="default-axis" />
<xsl:call-template name="features-grid" />
<xsl:text>
};	
</xsl:text>	
</xsl:template>

<xsl:template name="import-template-chart6">
<xsl:text>
$.elycharts.templates['chart6'] = {
		type : 'line',
		defaultSeries : {
			plotProps : {
				'stroke-width' : 0
			},
			dot : true,
			dotProps : {
				stroke : 'white',
				'stroke-width' : 2
			},
			startAnimation : {
				active : true,
				type : 'grow',
				easing : 'bounce'
			},
			tooltip : {
				frameProps : {
						opacity : 0.8
					},
					offset : [10, 50]
			},
			fill : false,
			stacked : false,
			highlight : {
				scale : 2
			}									
		},
</xsl:text>
<xsl:call-template name="color-definition-opaque" />
<xsl:call-template name="default-axis" />
<xsl:call-template name="features-grid" />
<xsl:text>
};	
</xsl:text>	
</xsl:template>
 
</xsl:stylesheet>