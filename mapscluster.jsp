<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style3.css">
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/Fluster2.packed.js"></script>
<script type="text/javascript">
var resultlatlng = localStorage.getItem("latlang").split(',');
 
//alert(resultlatlng);
////alert(resultlatlng[3]);
// OnLoad function ...
function initialize() {
  	
	// Create a new map with some default settings
    var myLatlng = new google.maps.LatLng(38.8833,-77.0167);
    var myOptions = {
      zoom: 3,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	
	// Initialize Fluster and give it a existing map
	var fluster = new Fluster2(map);
	////alert(resultlatlng[0]);
	for(var i = 0; i < resultlatlng.length; i++)
	{
		var pos = [
			resultlatlng[i],
			resultlatlng[i+1]
		];
		
		// Create a new marker. Don't add it to the map!
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(pos[0], pos[1]),
			title: 'Marker ' + i
		});
		i++;
		// Add the marker to the Fluster
		fluster.addMarker(marker);
	}
	
	// Set styles
	// These are the same styles as default, assignment is only for demonstration ...
	fluster.styles = {
		// This style will be used for clusters with more than 0 markers
		0: {
			image: 'http://gmaps-utility-library.googlecode.com/svn/trunk/markerclusterer/1.0/images/m1.png',
			textColor: '#FFFFFF',
			width: 53,
			height: 52
		},
		// This style will be used for clusters with more than 10 markers
		10: {
			image: 'http://gmaps-utility-library.googlecode.com/svn/trunk/markerclusterer/1.0/images/m2.png',
			textColor: '#FFFFFF',
			width: 56,
			height: 55
		},
		20: {
			image: 'http://gmaps-utility-library.googlecode.com/svn/trunk/markerclusterer/1.0/images/m3.png',
			textColor: '#FFFFFF',
			width: 66,
			height: 65
		}
	};
	
	// Initialize Fluster
	// This will set event handlers on the map and calculate clusters the first time.
	fluster.initialize();
	
}

</script>

</head>
<body onload="initialize()"><div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper" >
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
<div align ="justify" id="map_canvas" style="width: 1250px; height: 650px; left: ;" ></div>
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
						<a href="index.jsp">Home</a>
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
					<li class="nav-box">
						<a href="map.jsp">MAPS</a>
					</li>
					<li class="nav-box">
						<a href="graph1.html">Graphs</a>
					</li>
				</ul>
			</nav>
</body>
</html>