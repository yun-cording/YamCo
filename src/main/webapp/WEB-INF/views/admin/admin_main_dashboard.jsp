<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_main_dashboard</title>
<link rel="stylesheet"
	href="resources/css/admin/admin_main_dashboard.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([ [ '요일', '조회수' ],
				[ '일요일', 10 ], [ '월요일', 320 ], [ '화요일', 160 ], [ '수요일', 40 ],
				[ '목요일', 640 ], [ '금요일', 80 ], [ '토요일', 20 ] ]);

		var options = {
			// 			title : '조회수',
			// 			hAxis : {
			// 				title : '조회수',
			// 				titleTextStyle : {
			// 					color : '#333'
			// 				}
			// 			},
			chartArea : {
				width : '90%',
				height : '90%'
			},
			vAxis : {
				gridlines : {
					count : 1
				},
				textPosition : 'none'
			},
			legend : {
				position : 'none'
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<table class="dash_table">
			<tr>
			<td></td>
			<td></td>
			<tr>
			<tr>
			<td><div id="chart_div"></div></td>
			<td></td>
			<tr>
	</table>
	
</body>
</html>
