<!DOCTYPE html>

<!-- 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
AUTHOR	:: Data Miners
PROJECT	:: Big Data Analytics on Road Accidents
VERSION	:: 0.01
THEME	:: Dark (Youtube Background)
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-->

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Accident Analysis</title>
	
	<!-- FONT-AWESOME ICON -->
	<link rel="stylesheet" type="text/css" href="lib/font-awesome-4.3.0/css/font-awesome.min.css">

	<!-- GOOGLE FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

	<!-- PLUGINS SCRIPT -->
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/YTPlayer.css">

	<!-- CORE STYLESHEETS -->
	<link rel="stylesheet" type="text/css" href="lib/bootstrap-3.3.4-dist/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="lib/bootstrap-3.3.4-dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
	<script type="text/javascript">
	window.onpaint = getData();
	function getData(){
		var xmlhttp;
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
			  //alert('resposetxt::'+xmlhttp.responseText);
				if (typeof(Storage) != "undefined") {
					localStorage.clear();
					 // Store
				    localStorage.setItem("latlang",xmlhttp.responseText);				    
				}
			  //document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		    }
		  }//cmpe239-kal-env.elasticbeanstalk.com/accidnetController
		xmlhttp.open("POST","http://localhost:8080/accidnet_data_analysisv2/accidnetController",true);
		xmlhttp.send("getdata");
		
	}
	
	</script>

</head>
<body>

	<!-- PAGE-LOADER -->
	<div id="loader-wrapper">
	    <div id="loader"></div>
		<div id="ie9-loader"><img src="images/ie9-loader.GIF" alt="loader"></div>
	</div>
	<!-- PAGE-LODER END -->

	<!-- MAIN-WRAPPER -->
	<div class="main-wrapper bg-wrapper" Data- Mining="images/main-bg.jpg">
		
		<!-- BACKGROUND-OVERLAY -->
		<div class="overlay"></div>

		<!-- PAGE-WRAPPER -->
		<div class="page-wrapper home-page vm">
			
			<!-- HOME PAGE -->
			<div id="home" class="vm-item">
				<div class="container">

		 			<!-- TAG-LINE -->
		 			<div class="tag-line">
		 				<section class="cd-intro">
							<h1 class="cd-headline zoom">
								<span class="cd-words-wrapper">
									<b class="is-visible">
										Thousands of drivers met with accidents everyday  <span class="bold">and hundreds of lose their lives. </span>   
									</b>
									<b>
										<span class="bold">This project is step forward in saving as much lives as we can</span>  
									</b>
									<b>
										<span class="bold">How to avoid Accidents</span> Come, Explore  <span class="bold"> and learn from the past.</span> 
									</b>
								</span>
							</h1>
						</section>
		 			</div>

				</div>

				<!-- <!-- COUNTDOWN CLOCK -->
				

				
			</div>
			<!-- HOME PAGE END -->

			<!-- AJAX PAGES-WRAPPER -->
			<div class="ajax-page-wrp vm-item">
				
			</div>
			<!-- AJAX PAGES-WRAPPER END -->

		</div>
		<!-- PAGE-WRAPPER END -->

		<!-- FRONT DISPLAY -->
		<div class="front-display">

			<!-- LOGO -->
 			<div class="logo">
 				<a href="index.html"><img src="images/logo.png" alt="Logo"></a>
 			</div>

 			<!-- SOCIAL-ICON -->
			<ul class="social-icon">
				<li>
					<a class="vhm" href="https://www.facebook.com/cmpe239">
						<i class="fa fa-facebook vhm-item"></i>
					</a>
				</li>
				<li>
					<a class="vhm" href="#">
						<i class="fa fa-twitter vhm-item"></i>
					</a>
				</li>
				<li>
					<a class="vhm" href="#">
						<i class="fa fa-google-plus vhm-item"></i>
					</a>
				</li>
			</ul>

			

			<!-- NAVIGATION -->
			<nav>
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
	
		</div>
		<!-- FRONT DISPLAY END -->

		<!-- BACKGROUND VIDEO -->
		<a id="bgndVideo" class="player" data-property="{videoURL:'https://youtu.be/-nM2LvoyCYM',containment:'.main-wrapper',showControls:true, autoPlay:true, loop:true, vol:50, mute:true, startAt:10, opacity:1, addRaster:true, quality:'default', optimizeDisplay:true}">My video</a>

	</div>
	<!-- MAIN-WRAPPER END -->

	<!-- DEFAULT SCRIPTS -->
	<script src="js/jquery-1.11.2.min.js"></script>

	<!-- PLUGIN SCRIPT -->
	<script src="js/plugins.js"></script>
	<script src="js/jquery.mb.YTPlayer.min.js"></script>
	<script src="js/jquery.backstretch.js"></script>
	<script src="js/jquery.lwtCountdown-1.0.js"></script>
	<script src="js/main.js"></script>	
	<script src="js/notifyMe.js"></script>	

	<!-- COMMON SCRIPT -->
	<script src="js/video-bg.js"></script>
	<script src="js/common.js"></script>

</body>
</html>