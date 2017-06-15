
<%@page import="java.util.List"%>
<%@page import="servlet.Hotel"%>
<%@page import="servlet.Hotel"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Hotels Offers</title>


	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,300' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="/css/superfish.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="/css/flexslider.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/css/magnific-popup.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="/css/bootstrap-datepicker.min.css">
	<!-- CS Select -->
	<link rel="stylesheet" href="/css/cs-select.css">
	<link rel="stylesheet" href="/css/cs-skin-border.css">
	
	<link rel="stylesheet" href="/css/style.css">


	<!-- Modernizr JS -->
	<script src="/Scripts/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">

		<header id="fh5co-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
					<h1 id="fh5co-logo"><a href="index.jsp"><i class="icon-home"></i>Hotel<span>offers</span></a></h1>
				</div>
			</div>
		</header>

		<!-- end:header-top -->

		<div id="fh5co-search-map">
			<div class="search-property" style="width: 30%">
				<div class="s-holder">
					<h2>Search Properties</h2>
					<div class="row">
                                            <form method="GET" action="HotelsController">
						<div class="col-xxs-12 col-xs-12">
							<div class="input-field">
								<label for="from">Destination City:</label>
								<input type="text" class="form-control" name="DestinationCity" placeholder="City.."/>
							</div>
						</div>
						<div class="col-xxs-12 col-xs-12">
							<section>
								<label for="class">Min Trip Date</label>
								<input type="text" class="form-control" name="MinTripDate" placeholder="Min Date.."/>
							</section>
						</div>
						<div class="col-xxs-12 col-xs-12">
							<section>
								<label for="class">Max Trip Date</label>
								<input type="text" class="form-control" name="MaxTripDate" placeholder="Max Date.."/>
							</section>
						</div>
						<div class="col-xxs-12 col-xs-12">
							<div class="input-field">
								<label for="from">Length of stay:</label>
								<input type="text" class="form-control" name="lengthOfStay" placeholder="length.."/>
							</div>
						</div>
						
                                                                   <div class="col-xxs-12 col-xs-12">
							<section>
								<label for="class">Guest Rating:</label>
								<div class="wide">
                                                                    <label for="class">Min</label>
									<select class="cs-select cs-select-half cs-skin-border input-half" name="MinGuestRating">
										<option value="0" disabled selected>Any</option>
										<option value="1">1</option>
										<option value="2">2</option>
                                                                                <option value="3">3</option>
										<option value="4">4</option>
                                                                                <option value="5">5</option>
									</select>
                                                                    <label for="class">Max</label>
									<select class="cs-select cs-select-half cs-skin-border input-half" name="MaxGuestRating">
										<option value="0" disabled selected>Any</option>
										<option value="1">1</option>
										<option value="2">2</option>
                                                                                <option value="3">3</option>
										<option value="4">4</option>
                                                                                <option value="5">5</option>
									</select>
								</div>
							</section>
						</div>
						
						
						<div class="col-xxs-12 col-xs-12 text-center">
							<p><button type="submit" class="btn btn-primary btn-lg" href="#">Search</button></p>
						</div>
                                               </form>
					</div>
				</div>
			</div>
                    
                     <%                           
                List<Hotel> Hotels=(List<Hotel>)(request.getAttribute("Hotels"));
               
                for(Hotel hotel : Hotels){
                    out.println("<div class=\"col-md-2 animate-box fadeInUp animated\"> <div class=\"property\">");                    
                    out.println("<a href=\"/HotelsController?show=" +hotel.info.hotelId+"\" target=\"_blank\" class=\"fh5co-property\">");
                    out.println("<img src="+hotel.info.hotelImageUrl+" style=\"margin-left:70px;margin-top:90px;width:40%\">");
                    out.println("<ul class=\"list-details\">");
                    out.println("<li>"+hotel.info.hotelName+"</li><br>");
                    out.println("<li> city: "+hotel.info.hotelCity+"</li>");
                    out.println("<li> rating :"+hotel.info.hotelGuestReviewRating+"</li>"); 
                    out.println("</ul></a></div></div>");
                }
                %>
                   
                </div></div></div>
		<footer>
			<div id="footer">
				<div class="container">
					<div class="row row-bottom-padded-md">
						<div class="col-md-3">
							<h3 class="section-title">About Homestate</h3>
							<p>Welcome to the most popular site for Hotels reservation offers.</p>
						</div>
						
						<div class="col-md-3 col-md-push-1">
							<h3 class="section-title">Links</h3>
							<ul>
								<li><a href="#">Home</a></li>
							</ul>
						</div>

						<div class="col-md-3">
							<h3 class="section-title">Information</h3>
							<ul>
								<li><a href="#">Terms &amp; Condition</a></li>
								<li><a href="#">License</a></li>
								<li><a href="#">Privacy &amp; Policy</a></li>
								<li><a href="#">Contact Us</a></li>
							</ul>
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="fh5co-social-icons">
								<a href="#"><i class="icon-twitter2"></i></a>
								<a href="#"><i class="icon-facebook2"></i></a>
								<a href="#"><i class="icon-instagram"></i></a>
								<a href="#"><i class="icon-dribbble2"></i></a>
								<a href="#"><i class="icon-youtube"></i></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>

	

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->


	<script src="/Scripts/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/Scripts/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/Scripts/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/Scripts/jquery.waypoints.min.js"></script>
	<script src="/Scripts/sticky.js"></script>
	<!-- Superfish -->
	<script src="/Scripts/hoverIntent.js"></script>
	<script src="/Scripts/superfish.js"></script>
	<!-- Flexslider -->
	<script src="/Scripts/jquery.flexslider-min.js"></script>
	<!-- Date Picker -->
	<script src="/Scripts/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script src="/Scripts/classie.js"></script>
	<script src="/Scripts/selectFx.js"></script>

	
	<!-- Main JS -->
	<script src="/Scripts/main.js"></script>

	</body>
</html>

