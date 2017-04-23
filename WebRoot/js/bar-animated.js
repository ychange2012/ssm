 $(document).ready(function () {
	 var profit=new Array();
     var price=new Array();
     profitAndPrice();
	 function profitAndPrice(){
			$.ajax({
		        type: "POST",
		        async: false,
		        url: "/ssm/command/orderAction",
		        data: {
						ACTION:"queryTotalPrice",
					   },
		        dataType: "json",
		        success: function(data){
							  profit[0]=data.profit[0].count1;
							  profit[1]=data.profit[0].count2;
							  profit[2]=data.profit[0].count3;
							  profit[3]=data.profit[0].count4;
							  profit[4]=data.profit[0].count5;
							  price[0]=data.price[0].count1;
							  price[1]=data.price[0].count2;
							  price[2]=data.price[0].count3;
							  price[3]=data.price[0].count4;
							  price[4]=data.price[0].count5;
		                 },
		         error: function(data) {
		                  alert("网络异常");
		                 }
		    });
		}
	 
       
        var a1=new Array();
        var b1=new Array();
        getData();
        function getData(){
        	var myDate = new Date();
        	var nowYear=parseInt(myDate.getFullYear().toString());    //获取完整的年份(4位,1970-????)
        	
        	for(i=0;i<5;i++){
        		var temp = new Array();
        		temp[0]=nowYear-4+i;
        		temp[1]=price[i];
        		a1[i]=temp;
        		var temp2 = new Array();
        		temp2[0]=nowYear-4+i;
        		temp2[1]=profit[i];
        		b1[i]=temp2;
        	}
        }
        plot1 = $.jqplot("chart1", [b1, a1], {
            // Turns on animatino for all series in this plot.
            animate: true,
            // Will animate plot on calls to plot1.replot({resetAxes:true})
            animateReplot: true,
            cursor: {
                show: true,
                zoom: true,
                looseZoom: true,
                showTooltip: false
            },
            series:[
                {
                    pointLabels: {
                        show: true
                    },
                    renderer: $.jqplot.BarRenderer,
                    showHighlight: false,
                    yaxis: 'y2axis',
                    rendererOptions: {
                        // Speed up the animation a little bit.
                        // This is a number of milliseconds.  
                        // Default for bar series is 3000.  
                        animation: {
                            speed: 2500
                        },
                        barWidth: 15,
                        barPadding: -15,
                        barMargin: 0,
                        highlightMouseOver: false
                    }
                }, 
                {
                    rendererOptions: {
                        // speed up the animation a little bit.
                        // This is a number of milliseconds.
                        // Default for a line series is 2500.
                        animation: {
                            speed: 2000
                        }
                    }
                }
            ],
            axesDefaults: {
                pad: 0,
                tickOptions: { formatString: '%.0f' }
            },
            axes: {
                // These options will set up the x axis like a category axis.
                xaxis: {
            	renderer: $.jqplot.CategoryAxisRenderer,
                // readerer:$.jqplot.DateAxisRenderer,

                // tickInterval: 'lday',
                labelOptions: {
                    //formatString:'%Y-%m-%d',
                    fontSize: '12pt'
              
                    
                }				
                },
                yaxis: {
                    tickOptions: {
                        formatString: "¥%'d"
                    },
                    rendererOptions: {
                        forceTickAt0: true
                    }
                },
                y2axis: {
                    tickOptions: {
                        formatString: "¥%'d"
                    },
                    rendererOptions: {
                        // align the ticks on the y2 axis with the y axis.
                        alignTicks: true,
                        forceTickAt0: true,
                        tickOptions: { formatString: '%.2f', fontSize: '10pt' }
                    }
                }
            },
            highlighter: {
                show: true, 
                showLabel: true, 
                tooltipAxes: 'y',
                sizeAdjust: 10 , tooltipLocation : 'ne'
            }
        });
      
         });



