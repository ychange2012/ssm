$(document).ready(function(){
	var valueArray=new Array();
	getOrderData();
	
	 function getOrderData(){
			$.ajax({
		        type: "POST",
		        async: false,
		        url: "/ssm/command/orderAction",
		        data: {
						ACTION:"queryOrderCount",
					   },
		        dataType: "json",
		        success: function(data){
						   
						   valueArray[0]=data.data[0].count1;
						   valueArray[1]=data.data[0].count2;
						   valueArray[2]=data.data[0].count3;
						   valueArray[3]=data.data[0].count4;
						   valueArray[4]=data.data[0].count5;
						   valueArray[5]=data.data[0].count6;
						   valueArray[6]=data.data[0].count7;
						   valueArray[7]=data.data[0].count8;
						   valueArray[8]=data.data[0].count9;
						   valueArray[9]=data.data[0].count10;
						   valueArray[10]=data.data[0].count11;
						   valueArray[11]=data.data[0].count12;
						   
		                 },
		         error: function(data) {
		                  alert("网络异常");
		                 }
		    });
		}
	 var cosPoints = [
	                  ['Jan', valueArray[0]],
	                  ['Feb', valueArray[1]],
	                   ['Mar', valueArray[2]],
	                  ['Apr', valueArray[3]],
	                   ['May', valueArray[4]],
	                  ['Jun', valueArray[5]],
	                   ['Jul', valueArray[6]],
	                  ['Aug', valueArray[7]],
	                  ['Sept', valueArray[8]],
	                  ['Oct', valueArray[9]],
	                  ['Nov', valueArray[10]],
	                  ['Dec', valueArray[11]]
	                  ];

	                  var plot3 = $.jqplot('chart5', [cosPoints], {
	                      //title: '消费水平',  //标题
	                      //legend: { show: true, location: 'ne' }, //提示工具栏--show：是否显示,location: 显示位置 (e:东,w:西,s:南,n:北,nw:西北,ne:东北,sw:西南,se:东南) 
	                      //series: [{showMarker:true}],
	                     
	                	  axesDefaults: { //轴的刻度值，字体大小，字体类型，字体角度
	                          tickRenderer:  $.jqplot.CanvasAxisLabelRenderer,
	                          // labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
	                          
	                          tickOptions: {
	                              //fontSize: '10pt',
	                              angle: 20
	                          }
	                      },
	                      seriesDefaults: {
	                          //label: '消费值', //分类名称
	                          //color: 'red', //分类在图标中表示（折现，柱状图等）的颜色
	                          //showLine: true, //是否显示图表中的折线（折线图中的折线）  
	                          //markerOptions: {
	                          //    show:true
	                          //}
	                          showMarker: true, //是否显示节点
	                          pointLabels: {
	                              show: true,//数据点标签
	                              // edgeTolerance:1
	                          }
	                      },
	                      axes: {
	                          xaxis: {
	                              label: '月份',
	                              renderer: $.jqplot.CategoryAxisRenderer,
	                              // readerer:$.jqplot.DateAxisRenderer,

	                              // tickInterval: 'lday',
	                              labelOptions: {
	                                  //formatString:'%Y-%m-%d',
	                                  fontSize: '12pt'
	                              }
	                          },
	                          yaxis: {
	                              label: '订单数',
	                              //autoscale: true,
	                              min: 0,
	                              tickOptions: { formatString: '%.0f', fontSize: '12pt' }
	                          }
	                      }
	                  });
   });