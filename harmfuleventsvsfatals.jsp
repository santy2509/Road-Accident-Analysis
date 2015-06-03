<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Harmful Events VS Fatals</title>
<link rel="stylesheet" type="text/css" href="css/style2.css">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">
		var data;
		//window.onpaint = getData();
		function getData(){
			var xmlhttp;
			var state =  document.getElementById('state').value;
			var values;
			var points;
			var datax;
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
				 //alert(xmlhttp.responseText);	
				  data = xmlhttp.responseText.split(':');
				  var dat=data[2].split(';');
				  var dat1=[];
				  for(var i= 0; i<dat.length;i++){
					   dat1.push(dat[i].toString().replace('=',":")+"<br>");
				  }
				  
				  document.getElementById("fpgrowth").innerHTML ='<br><br>'+dat1;
				  //alert(data[0]+"::"+data[1]);
				  values = data[0].replace('[','').replace(']','').split(',');
				  points = data[1].replace('[','').replace(']','').split(',');
				  //alert(values);
				  //alert(points)
				  datax = points.map(Number);
				  	
				  $(function () {
				        $('#container').highcharts({
				            chart: {
				                type: 'bar'
				            },
				            title: {
				                text: 'Harmful Events VS Deaths'
				            },
				            subtitle: {
				                text: 'Source: Wikipedia.org'
				            },
				            xAxis: {
				                categories: values,
				                title: {
				                    text: null
				                }
				            },
				            yAxis: {
				                min: 0,
				                title: {
				                    text: 'Population (millions)',
				                    align: 'high'
				                },
				                labels: {
				                    overflow: 'justify'
				                }
				            },
				            tooltip: {
				                valueSuffix: ' millions'
				            },
				            plotOptions: {
				                bar: {
				                    dataLabels: {
				                        enabled: true
				                    }
				                }
				            },
				            legend: {
				                layout: 'vertical',
				                align: 'right',
				                verticalAlign: 'top',
				                x: -40,
				                y: 100,
				                floating: true,
				                borderWidth: 1,
				                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor || '#FFFFFF'),
				                shadow: true
				            },
				            credits: {
				                enabled: false
				            },
				            series: [{
				                name: 'Total Fatals',
				                data: datax
				            }]
				        });
				    });
				    
				     }
}
			xmlhttp.open("POST","http://localhost:8080/accidnet_data_analysisv2/accidnetController",true);
			xmlhttp.send("harmfulevvsfatal:"+state);
			
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
                   <a href="harmfuleventsvsfatals.jsp">States VS Harmful Events</a>
                </li>
                <li>
                <div id ="fpgrowth"><br><br></div>
                </li>
            </ul>
        </div>
        <div id="watever">
        <a> Please enter your state</a>
<input type ="text" id="state" onchange="getData()">
</div>

<div id="container" style="height: 600px "></div>



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
			
	</body>
</html>