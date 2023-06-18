let boardCategory = [];
let boardDailyNumber = [];
let joinDates = [];
let userNumbers = [];

 $(function () {
 	
 	$.ajax({
 		url : '/thrifty/admin/getData',
 		dataType : 'json',
 		success : function(result){
 			let jsonData = result;
 			jsonData.dailyBoard.forEach(function(item){
				    boardCategory.push(item.category);
				    boardDailyNumber.push(item.number);
				})
			jsonData.dailyUser.forEach(function(item){
				    joinDates.push(item.today);
				    userNumbers.push(item.todayCount);
				})
				makeChart();		
 		}
 		
 	});
 	
 	function makeChart(){
		    var areaChartData = {
		      labels  : joinDates,
		      datasets: [
		        {
				  lineTension		  :  0,
		          backgroundColor     : 'rgba(60,141,188,0.9)',
		          borderColor         : 'rgba(60,141,188,0.8)',
		          pointColor          : '#3b8bba',
		          data                : userNumbers
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
		          },
				  ticks: {
					beginAtZero: true
				  }
				  
		        }]
		      }
		    }
	
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
	var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: boardCategory,
      datasets: [
        {
          data: boardDailyNumber,
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

    new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions
    });
    }
});