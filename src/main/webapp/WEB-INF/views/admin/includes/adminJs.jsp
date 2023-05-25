<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="/thrifty/resources/js/admin/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/thrifty/resources/js/admin/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/thrifty/resources/js/admin/adminlte.min.js"></script>
<script src="/thrifty/resources/js/admin/Chart.min.js"></script>
<script>
	 $(function () {
// 		    /* ChartJS
// 		     * -------
// 		     * Here we will create a few charts using ChartJS
// 		     */

// 		    //--------------
// 		    //- AREA CHART -
// 		    //--------------

// 		    // Get context with jQuery - using jQuery's .get() method.
// 		    var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

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
});
  </script>