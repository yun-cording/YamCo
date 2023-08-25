// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["접속자수", ""],
    datasets: [{
      data: [81, 19],
      backgroundColor: ['#FF5B5B', 'rgba(255, 91, 91, 0.15)'],
      hoverBackgroundColor: ['#FF5B5B', 'rgba(255, 91, 91, 0.15)'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
      weight: 5,
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
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
var ctx = document.getElementById("myPieChart2");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["접속자수", "공백"],
    datasets: [{
      data: [22, 78],
      backgroundColor: ['#00B074', 'rgba(0, 176, 116, 0.15)'],
      hoverBackgroundColor: ['#00B074', 'rgba(0, 176, 116, 0.15)'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
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
var ctx = document.getElementById("myPieChart3");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["접속자수", "공백"],
    datasets: [{
      data: [62, 38],
      backgroundColor: ['rgba(45, 156, 219, 1)', 'rgba(45, 156, 219, 0.15)'],
      hoverBackgroundColor: ['rgba(45, 156, 219, 1)', 'rgba(45, 156, 219, 0.15)'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
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

