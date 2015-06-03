<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Displaying text directions with <code>setPanel()</code></title>
    <link rel="stylesheet" type="text/css" href="css/style3.css">
        <link rel="stylesheet" type="text/css" href="css/responsive.css">
    
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <style>
      html, body, #map-canvas {
        height: 90%;
        margin: 0px;
        padding: 0px
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
    </style>
    <style>
      #directions-panel {
        height: '';
        float: center;
        width: 390px;
        overflow: auto;
      }

      #map-canvas {
        margin-right: 200px;
      }

      #control {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }

      @media print {
        #map-canvas {
          height: 100px;
          width : 500px;
          margin: 10;
          float : "center";
        }

        #directions-panel {
          float: none;
          width: auto;
        }
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <script>
    
    </script>
    <script>
var directionsDisplay;
var map;
var contentString;
var beachMarker = [];
var directionsService = new google.maps.DirectionsService();
var destinationIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=D|FF0000|000000';
alert(localStorage.getItem('latlang'));
var resultsetlatlng = localStorage.getItem('latlang').split(',');
var resultsetcond;
var infowindow = null;
//==========================================================ajax===============================
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
			  //alert(xmlhttp.responseText);
				resultsetcond = xmlhttp.responseText.split(',');
			  //document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		    }
		  }
		xmlhttp.open("POST","http://localhost:8080/accidnet_data_analysisv2/accidnetController",true);
		xmlhttp.send("getcond");
		
	}

//==============================================================map=============================
function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 7,
    center: new google.maps.LatLng(37.338208,-121.886329)
  };
   map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('directions-panel'));

  var control = document.getElementById('control');
  control.style.display = 'block';
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
  infowindow = new google.maps.InfoWindow({
	  content: "holding..."
	  });
}

function calcRoute() {
  var start = document.getElementById('start').value;
  var end = document.getElementById('end').value;
  var request = {
    origin: start,
    destination: end,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }
  });
  addMarker();
}
function addMarker() { 
	var k=0;
	for(var i=0;i<resultsetlatlng.length; i++){
		var myLatLng = new google.maps.LatLng(resultsetlatlng[i],resultsetlatlng[i+1]);
		i++;
		contentString = resultsetcond[k];
		k++;
		  beachMarker.push(new google.maps.Marker({
	      position: myLatLng,
	      map: map,
	      icon: destinationIcon,
	      information : contentString
	     }));
	}
	////alert(beachMarker.length);
	for (var i = 0; i < beachMarker.length; i++) {
		var marker = beachMarker[i];
		
		google.maps.event.addListener(marker, 'click', function () {
		// where I have added .html to the marker object.
		////alert(resultsetcond[i]);
		infowindow.setContent(this.information);
		infowindow.open(map, this);
		});
		}
	////alert("content"+resultsetcond[1]);
}



google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body><div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <h1><a href="graph1.html">
                        Graphs/Maps
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
                   <a href="map.jsp">MAP</a>
                </li>
                <li>
                   <a href="mapscluster.jsp">Cluster Map</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
  </div>
    <div id="control">
      <strong>Start:</strong>
      <input type = "text" id="start" >             
      <strong>End:</strong>
      <input type = "text" id="end" onchange = "calcRoute();">
      </div>
    <div id="directions-panel"></div>
    <div id="map-canvas"  class ="container-fluid" style="height: 650px" align= "center"></div>
    
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
					<li class="nav-box">
					<a href="mapscluster.jsp">Cluster MAPS</a>
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