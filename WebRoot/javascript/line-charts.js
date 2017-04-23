$(document).ready(function(){
       $.jqplot('chart5', [[1, 2, 3, 4, 5, 6, 7, 8, 22]], {
                  //title: "折线图", //图表标题
                 axesDefaults: {
                      labelRenderer: $.jqplot.CanvasAxisLabelRenderer //设置X和Y轴的说明文字的渲染引擎
                  },
                  axes: {
                      xaxis: {
                        //  label: "X轴", //指定X轴的说明文字
                         pad: 0 //指定X轴的缩放因子，当这个值大于1后我们的图表会缩放
                     },
                     yaxis: {
                       //  label: "Y轴" //指定Y轴的说明文字
                     }
                 }
             });
   });