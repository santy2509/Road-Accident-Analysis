<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>States VS Accidents</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Accident Analysis</title>
	
	<!-- FONT-AWESOME ICON -->
	<link rel="stylesheet" type="text/css" href="lib/font-awesome-4.3.0/css/font-awesome.min.css">

	<!-- GOOGLE FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<!-- PLUGINS SCRIPT -->
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/YTPlayer.css">

	<!-- CORE STYLESHEETS -->
	<link rel="stylesheet" type="text/css" href="lib/bootstrap-3.3.4-dist/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="lib/bootstrap-3.3.4-dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style1.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">
		var data;
		window.onpaint = getData();
		function getData(){
			var xmlhttp;
			var datax;
			var intdatay;
			var datay;
			
			if (window.XMLHttpRequest)
			  {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			  }
			else
			  {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }
			xmlhttp.onreadystatechange=function()
			  {
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)
			    {
					//alert("responsetxt:"+xmlhttp.responseText);
				 	data = 	xmlhttp.responseText.split(':');
				 	//alert(data[0]);
				 	//alert(data[1]);
				 	datax=data[0].replace('[','').replace(']','').split(',');
				 	intdatay=data[1].replace('[','').replace(']','').split(',');
				 	//alert(intdatay[0]);
				 	datay = intdatay.map(Number);
				 	//alert(datay);
				  //document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
				 	$(function () {
				        $('#container').highcharts({
				            chart: {
				                type: 'column'
				            },
				            title: {
				                text: 'States VS Accidents'
				            },
				            subtitle: {
				                text: ''
				            },
				            xAxis: {
				                categories: datax				                    
				            },
				            yAxis: {
				                min: 0,
				                title: {
				                    text: 'Number of Accidents'
				                }
				            },
				            tooltip: {
				                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				                    '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
				                footerFormat: '</table>',
				                shared: true,
				                useHTML: true
				            },
				            plotOptions: {
				                column: {
				                    pointPadding: 0.2,
				                    borderWidth: 0
				                }
				            },
				            series: [{
				                
				                data: datay
				    
				            }]
				        });
				    });
				    
			    }
			  }
			xmlhttp.open("POST","http://localhost:8080/accidnet_data_analysisv2/accidnetController",true);
			xmlhttp.send("statevsacc");
			
		}

		</script>
	</head>
	<body>

<script src="${pageContext.request.contextPath}/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/js/highcharts-3d.js"></script>
<script src="${pageContext.request.contextPath}/js/modules/exporting.js"></script>
  <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <h1><a href="graph1.html">
                        Graphs
                    </a></h1>
                </li>
                <li>
                    <a href="statevsaccidentsgraph.jsp">StateVSAccidents</a>
                </li>
                <li>
                    <a href="alignmentvsaccidents.jsp">AlignmentVSAccidents</a>
                </li>
                <li>
                    <a href="graph1.html">Drunk Drive VS Accidents</a>
                </li>
                <li>
                   <br>
                </li>
                <li>
                   <a href="harmfuleventsvsfatals.jsp">States VS Harmful Events</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

<div id="container" style="height: 400px"></div>
			<br>
				<br>
<br><br><br>


			<!-- NAVIGATION -->
					<nav align= "center">
				<ul class="navigation-wrp">
					<li class="nav-box">
						<a href="index.jsp">Home</a>
					</li>
					<li class="nav-box">
						<a href="about.html">About Us</a>
					</li>
					<li class="nav-box">
						<a href="contact.html">Contact Us</a>
					</li>
					<li class="nav-box">
						<a href="graph1.html">Graphs</a>
					</li>
					
					<li class="nav-box">
					<a href="map.jsp">MAPS</a>
					</li>
				</ul>
			</nav>

			<!-- MOBILE-NAVIGATION -->
			<div class="mobile-icon vhm">
				<i class="fa fa-bars vhm-item"></i>
			</div>
			<nav class="nav-outter-wrp">
				<ul class="navigation-wrp mob">
					<li class="nav-box">
						<a href="index.html">Home</a>
					</li>
					<li class="nav-box">
						<a href="about.html">About Us</a>
					</li>
					<li class="nav-box">
						<a href="contact.html">Contact Us</a>
					</li>
					<li class="nav-box">
						<a href="subscribe.html">subscribe</a>
					</li>
				</ul>
			</nav>
			</div>
	</body>
</html>