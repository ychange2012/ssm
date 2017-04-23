$(document).ready(function(){
	var data2 =new Array();
	getPercent();
	function getPercent(){
		$.ajax({
	        type: "POST",
	        async: false,
	        url: "/ssm/command/orderAction",
	        data: {
					ACTION:"queryTypePercent",
				   },
	        dataType: "json",
	        success: function(data){
						for(i=0;i<data.data.length;i++){
						var temp = new Array();
						temp[0]=data.data[i].TYPE_NAME;
						temp[1]=data.data[i].PERCENT;
						data2[i]=temp;
						}
	                 },
	         error: function(data) {
	                  alert("网络异常");
	                 }
	    });
	}
  
  var plot1 = jQuery.jqplot ('chart7', [data2], 
    { 
      seriesDefaults: {
        // Make this a pie chart.
        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions: {
          // Put data labels on the pie slices.
          // By default, labels show the percentage of the slice.
          showDataLabels: true
        }
      }, 
      legend: { show:true, location: 'e', showSwatches: true}
    }
  );
});