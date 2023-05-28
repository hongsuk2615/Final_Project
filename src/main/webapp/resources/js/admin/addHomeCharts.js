 $(function () {
		    var areaChartData = {
		      labels  : ['5/18', '05/19', '05/20', '05/21', '05/22', '05/23', '05/24', '05/25'],
		      datasets: [
		        {
				  lineTension		  :  0,
		          backgroundColor     : 'rgba(60,141,188,0.9)',
		          borderColor         : 'rgba(60,141,188,0.8)',
		          pointColor          : '#3b8bba',
		          data                : [28, 15, 32, 19, 30, 27, 20, 18]
		        }
		      ]
		    }

		    var areaChartOptions = {
		      maintainAspectRatio : false,
		      responsive : true,
		      tooltips: {
		          intersect: false,
		          mode: 'nearest',
		          axis: 'xy',
		        },
		      legend: {
		        display: false
		      },
		      scales: {
		        xAxes: [{
		          gridLines : {
		            display : true,
		          }
		        }],
		        yAxes: [{
		          gridLines : {
		            display : true,
		          }
		        }]
		      }
		    }

// 		    // This will get the first returned node in the jQuery collection.
// 		    new Chart(areaChartCanvas, {
// 		      type: 'line',
// 		      data: areaChartData,
// 		      options: areaChartOptions
// 		    })
	
	
   //-------------
    //- LINE CHART -
    //--------------
    var lineChartCanvas = $('#lineChart').get(0).getContext('2d')
    var lineChartOptions = $.extend(true, {}, areaChartOptions)
    var lineChartData = $.extend(true, {}, areaChartData)
    lineChartData.datasets[0].fill = false;
    lineChartOptions.datasetFill = false

    var lineChart = new Chart(lineChartCanvas, {
      type: 'line',
      data: lineChartData,
      options: lineChartOptions
    });
    
    
	//-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
	var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: [
          '쉐어하우스',
          '카풀',
          '중고거래',
          '심부름/알바',
          '공동구매',
          '소모임',
          '자유게시판',
      ],
      datasets: [
        {
          data: [700,500,400,600,300,800,60],
          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de', '#000000'],
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
    	  position: 'right'
      }
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions
    });
});