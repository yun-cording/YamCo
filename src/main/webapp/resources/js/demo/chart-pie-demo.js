// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
		  type: 'doughnut',
		  data: {
		    labels: ["사용자 레시피", "공공 레시피"],
		    datasets: [{
		      data: doughnutData1,
		      backgroundColor: ['#FF5B5B', 'rgba(255, 91, 91, 0.15)'],
		      hoverBackgroundColor: ['#FF5B5B', 'rgba(255, 91, 91, 0.15)'],
		      hoverBorderColor: "rgba(234, 236, 244, 1)",
		      weight: 5,
		    }],
		  },
		  options: {
		    maintainAspectRatio: false,
		    tooltips: {
	    	  titleMarginBottom: 10,
	          titleFontColor: '#6e707e',
  	          titleFontSize: 14,
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		      callbacks:{
		    	  label: function(tooltipItem, data) {
		                    var dataset = data.datasets[tooltipItem.datasetIndex];
		                    var currentValue = dataset.data[tooltipItem.index];
		                    var label = data.labels[tooltipItem.index];
		                    return  label + ' : ' + currentValue + '회';
		                }
		    	  },
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 40,
		  },
		});
var ctx2 = document.getElementById("myPieChart2");
var myPieChart2 = new Chart(ctx2, {
  type: 'doughnut',
  data: {
    labels: ["오전 방문자", "오후 방문자"],
    datasets: [{
      data: doughnutData2,
      backgroundColor: ['#00B074', 'rgba(0, 176, 116, 0.15)'],
      hoverBackgroundColor: ['#00B074', 'rgba(0, 176, 116, 0.15)'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
        callbacks:{
		    	  label: function(tooltipItem, data) {
		                    var dataset = data.datasets[tooltipItem.datasetIndex];
		                    var currentValue = dataset.data[tooltipItem.index];
		                    var label = data.labels[tooltipItem.index];
		                    return  label + ' : ' + currentValue + '명';
		                }
		    	  },
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 40,
  },
});
var ctx3 = document.getElementById("myPieChart3");
var myPieChart3 = new Chart(ctx3, {
  type: 'doughnut',
  data: {
    labels: ["남성", "여성"],
    datasets: [{
      data: doughnutData3,
      backgroundColor: ['rgba(45, 156, 219, 1)', 'rgba(255, 87, 87, 1)'],
      hoverBackgroundColor: ['rgba(45, 156, 219, 1)', 'rgba(255, 87, 87, 1)'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
        callbacks:{
		    	  label: function(tooltipItem, data) {
		                    var dataset = data.datasets[tooltipItem.datasetIndex];
		                    var currentValue = dataset.data[tooltipItem.index];
		                    var label = data.labels[tooltipItem.index];
		                    return  label + ' : ' + currentValue + '명';
		                }
		    	  },
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 40,
  },
});

