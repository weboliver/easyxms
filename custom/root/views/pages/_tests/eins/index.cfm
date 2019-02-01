<!DOCTYPE html>
<html>
<head>
	<!-- Global Style Sheets -->
	<link rel="stylesheet" type="text/css" href="/res/jquery/jquery-ui-1.11.4/jquery-ui.min.css"/>
	<link rel="stylesheet" type="text/css" href="/res/bootstrap/3.3.6/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="/res/easyxms/css/easyxms.css"/>

	<!-- Javascript Libraries -->
	<script type="text/javascript" src="/res/jquery/jquery-2.2.2.min.js"></script>
	<script type="text/javascript" src="/res/jquery/jquery-ui-1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/res/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/res/angular/js/angular.min.js"></script>

	<!-- Custom Javascript Libaries -->
	<script language="javascript" src="/res/easyxms/js/my.js"></script>


	<script type="text/javascript">
	$( document ).ready(function() {

		bindElement("#testme", function(){
			alert('Content added! Current content:' + '\n\n' + this.innerHTML);
		});

	});

	function changeme() {
    	$("#testme").text("was anderes");
	}
	</script>
</head>
<body>


<div id="testme">leer</div>
<input type="button" onclick="changeme();">
</body>
</html>