
	// street name list for search
	var GraphUtils = new GraphUtils();
	var streetListSearch = [];
	// colors for graph
	var strColorsJSON ;
	// field showed var
	var images_group = [];
	var images15 = new Array();
	var images14 = new Array();
	var images13 = new Array();
	var district_cb;
	 //skybox
	var texture_placeholder;
	 //init var
	var hemiLight;
	var SCREEN_WIDTH = window.innerWidth;
	var SCREEN_HEIGHT = window.innerHeight;
	var ZOOM_MIN = 15;
	var BAR_WIDTH = 50;
	var BAR_HEIGHT_MULTIPLE = 10;
	var BAR_WIDTH_DATATYPE = BAR_WIDTH/2;
	var BAR_WIDTH_DATATYPE_SPACE = 1;
	var BAR_WIDTH_MULTIPLE = 1;
	var DOME_RADIUS=6000;
	var angularSpeed = 0.01; // revolutions per second
	var lastTime = 0;
	if (!Detector.webgl) Detector.addGetWebGLMessage();
	
	var container, stats;
	var camera, projector,controls, scene, renderer;
	var plane,big_plane,skyDome;
	var group_plane = [];
	var group_cube = [];
	var group_datatype_base = []; 
	 //flag : which graph is showing
	var graphtype_flag = 1; // 1 district , 2 datatype
	var texture, image;
	var strDataURI; // url of map tile
	 //MercatorProjection
	//var proj;
	 //google.maps
	
	
	
	var jsonObj;
	 //get map tile, calculate lat, lng of tile
	var centerPoint;			
	Map.init_tiles();
	 //getCorners(centerPoint,Map.zoom,Map.STATIC_MAP_SIZE,Map.STATIC_MAP_SIZE);
	Map.latLngToCoord(Map.centerLat, Map.centerLng);
	console.log("cube pos :" + Map.x_coord + ":" + Map.y_coord);
	 //Get fieldName
	$(document).ready(function () {	
		//TIMER
	var start = new Date().getTime();
	$.getJSON("colors.json", function(data) {					
		strColorsJSON = data; 
	});
	// handle responsive layout when resize window
	responsive();
	 // Show prgress cycle 
	$("#container").append("<img  src='./images/preloader-w8-cycle-black.gif' style='margin-top: 20%;margin-left:50%'>");
	// SERVLET CALL 			
	//Check All checkbox
	$("#dist_all").change(function () {
	    if (this.checked) {
	        console.log("dist_all checked");
	        $("input[type='checkbox'][name='dist']").prop("checked", true);
	    } else {
	        console.log("dist_all unchecked");
	        $("input[type='checkbox'][name='dist']").prop("checked", false);
	    }
	});
	$("#time_all").change(function () {
	    if (this.checked) {
	        console.log("time_all checked");
	        $("input[type='checkbox'][name='time']").prop("checked", true);
	    } else {
	        console.log("time_all unchecked");
	        $("input[type='checkbox'][name='time']").prop("checked", false);
	    }
	});
	
	$.ajax({
	    url: "./StatsGet",
	    type: "GET",
	    dataType: "text",
	}).success(function (data) {
	    //Remove prgress cycle
	    $("#container").empty();
	    //console.log("done:\n" + data);					
	    jsonObj = eval("(" + data + ")");
		// read street list into streetListSearch
		for(var index = 0; index < jsonObj.streetStats.length;index++){
			streetListSearch.push(jsonObj.streetStats[index].formatted_address);
		}
		console.log("streetListSearch"+streetListSearch);
		$("#streetSearchBox").typeahead({
		  limit: 10   ,
		  local: streetListSearch
		});
		$("#streetSearchBox").focus();
		// dynamically generate field and checkbox
	    for (var index = 0; index < jsonObj.fieldNames.length; index++) {
	        switch (jsonObj.fieldNames[index].type) {
	        case 1:
	            // district fieldName
	            var label = $("<label >").attr({
	                class: 'input-control checkbox'
	            });
	            var input = $("<input >");
	            input.attr({
	                type: 'checkbox',
	                name: 'dist',
	                value: jsonObj.fieldNames[index].id
	            });
	            var span = $("<span  style='overflow:hidden;'>").attr({
	                class: 'helper'
	            });
	            span.append(jsonObj.fieldNames[index].name);
	            input.appendTo(label);
	            span.appendTo(label);
	            label.appendTo(distForm);
	            $("#distForm").append("<br/>");
	            break;
	        case 3:
	            // datatype fieldName
	            var label = $("<label>").attr({
	                class: 'input-control checkbox'
	            });
	            var input = $("<input>");
	            input.attr({
	                type: 'checkbox',
	                name: 'datatype',
	                value: jsonObj.fieldNames[index].id
	            });
	            var span = $("<span>").attr({
	                class: 'helper'
	            });
	            span.append(jsonObj.fieldNames[index].name);
	            input.appendTo(label);
	            span.appendTo(label);
	            label.appendTo(datatype_col);
	            $("#datatype_col").append("<br/>");
	            break;
	        case 4:
	            // datatype fieldName
	            var label = $("<label>").attr({
	                class: 'input-control checkbox'
	            });
	            var input = $("<input>");
	            input.attr({
	                type: 'checkbox',
	                name: 'time',
	                value: jsonObj.fieldNames[index].id
	            });
	            var span = $("<span>").attr({
	                class: 'helper'
	            });
	            span.append(jsonObj.fieldNames[index].name);
	            input.appendTo(label);
	            span.appendTo(label);
	            label.appendTo(time_col);
	            $("#time_col").append("<br/>");
	            break;
	        default:
	            break;
	        }
	    }		
	    $("input[type='checkbox'][name='dist']").prop('checked', true);
	    $("input[type='checkbox'][name='time']").prop('checked', true);
	    $("input[type='checkbox'][name='datatype']").attr("disabled", true);
		$("input[type='checkbox'][name='datatype']").prop('checked', false);	
		$("#datatype_all").prop('checked', true);
		
	    init();
		draw_tiles();
		graph();
	    animate();
		//TIMER
		var end = new Date().getTime();
		var time = end - start;
		console.log('1st load: ' + time);
		// Map.zoom slider
		$("#zoom_slider").on("change", function(e, val){
			start = new Date().getTime();
			console.log("x"+camera.position.x);
			console.log("z"+camera.position.z);
			// which point to Zoom 
				// zoom to where camera looking at
				var vector = new THREE.Vector3( 0, 0, -1 );
				vector.applyEuler( camera.rotation, camera.eulerOrder );
				projector.unprojectVector( vector, camera );
				var raycaster = new THREE.Raycaster( camera.position, vector.sub( camera.position ).normalize() );
	
				var intersects = raycaster.intersectObjects( group_plane );
				var particleMaterial = new THREE.ParticleCanvasMaterial( {
	
					color: 0x000000,
					program: function ( context ) {
	
						context.beginPath();
						context.arc( 0, 0, 1, 0, PI2, true );
						context.closePath();
						context.fill();
	
					}
	
				} );
				if ( intersects.length > 0 ) {
	
					intersects[ 0 ].object.material.color.setHex( Math.random() * 0xffffff );
	
					scene.remove( intersects[ 0 ].object );
					console.log("Camera Looking at"+intersects[ 0 ].object.position.x+":"+intersects[ 0 ].object.position.z);
					console.log("Map.zoom to it");
					Map.coordtoLatLng(intersects[ 0 ].object.position.x,-intersects[ 0 ].object.position.z);
	
				}
			console.log(Map.centerLat+":"+Map.centerLng);
			console.log("zoom_slider changed:"+val);
			
			Map.zoom=val/20+12;
			$("#zoom_slider_text").text(Map.zoom);
			switch (Map.zoom) {
			case 13: case 12:
				BAR_WIDTH_MULTIPLE = 1;
				Map.TILE_MULTIPLE = 9;
				break;
			case 14:
				BAR_WIDTH_MULTIPLE = 0.9;
				Map.TILE_MULTIPLE = 11;
				break;
			case 15:case 16: case 17:
				BAR_WIDTH_MULTIPLE = 0.8;	
				Map.TILE_MULTIPLE = 11;
				break;					
			}
			// xoay xoay on
			//;
			$("#container").empty();
			$("#container").html("<img  src='./images/preloader-w8-cycle-black.gif' style='margin-top: 20%;margin-left:50%'>");
			// xoay xoay off
			init();
			Map.init_tiles(); 
			createScene();	
			draw_tiles();
			centerCamera();
			graph();
			animate();
			//TIMER
			end = new Date().getTime();
			time = end - start;
			console.log('Map.zoom: ' + time);
		});
		// "check all" check box
		 // district check_all
	    $("input[type='checkbox'][name='dist']").change(function () {
	         if ($("input[type='checkbox'][name='dist']:not(:checked)").length == 1) {
	            // 1 cb is unchecked
	            if ($("#dist_all").is(":not(:checked)")) {
	                //and thats dist_all -> check dist_all now
	                $("#dist_all").prop('checked', true);
	            } else {
					//nope, not dist_all -> uncheck dist_all now
	                console.log("uncheck idst_all now");
	                $("#dist_all").prop('checked', false);
	            }
	        }
	        //draw mapgraph
			if(graphtype_flag <= 2){
				drawDistGraph();
			}else{
				drawStreetGraph();
			}
	    });
		//datatype_all
		$("#datatype_all").change(function () {
				//TIMER
				start = new Date().getTime();
	            if ($("#datatype_all").is(":not(:checked)")) {
						console.log("enable datatypes cb");
						$("input[type='checkbox'][name='time']").attr("disabled", false);
						$("input[type='checkbox'][name='datatype']").attr("disabled", false);	
						$("input[type='checkbox'][name='datatype']").prop('checked', true);
	            } else {
	                console.log("disable datatypes cb");
					$("input[type='checkbox'][name='time']").attr("disabled", true);
	                $("input[type='checkbox'][name='datatype']").attr("disabled", true);
					
	            }                        
	        //draw mapgraph
			if(graphtype_flag <= 2){
				drawDistGraph();
			}else{
				drawStreetGraph();
			}
			//TIMER
			end = new Date().getTime();
			time = end - start;
			console.log('datatype: ' + time);
	    });
		// datatype  cb
		$("input[type='checkbox'][name='datatype']").change(function () {                       
	        //draw mapgraph
			if(graphtype_flag <= 2){
				drawDistGraph();
			}else{
				drawStreetGraph();
			}
	    });
		//time cb
		$("input[type='checkbox'][name='time']").change(function () {                       
	        //draw mapgraph
			if(graphtype_flag <= 2){
				drawDistGraph();
			}else{
				drawStreetGraph();
			}
	    });
	    $(window).resize(function () {
	        //console.log("body width:" + $('body').innerWidth());
	        responsive();
	    });
		// street search enter
		$("#streetSearchBox").keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				console.log('You pressed a "enter" key in textbox');	
				drawStreetGraph(1);	
			}
		});
		$(document).keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				console.log('You pressed a "enter" key in somewhere');	
					drawStreetGraph(1);	
				}
				
			});
	    });
	});
	
		
	// reponsive layout when resizing window
	function responsive() {
	    //console.log("body width:" + $('body').innerWidth());
	if ($('body').innerWidth() >= 1340) {
	    $("#districtFormContainer").css("-moz-column-count", "3");
	    $("#districtFormContainer").css("-webkit-column-count", "3");
	    $("#districtFormContainer").css("column-count", "3");
	
	    $("#dataFormContainer").css("-moz-column-count", "3");
	    $("#dataFormContainer").css("-webkit-column-count", "3");
	    $("#dataFormContainer").css("column-count", "3");
	}
	if ($('body').innerWidth() >= 950 && $('body').innerWidth() < 1340) {
	    $("#districtFormContainer").css("-moz-column-count", "2");
	    $("#districtFormContainer").css("-webkit-column-count", "2");
	    $("#districtFormContainer").css("column-count", "2");
	
	    $("#dataFormContainer").css("-moz-column-count", "3");
	    $("#dataFormContainer").css("-webkit-column-count", "3");
	    $("#dataFormContainer").css("column-count", "3");
	}
	if ($('body').innerWidth() < 950) {
	    $("#districtFormContainer").css("-moz-column-count", "1");
	    $("#districtFormContainer").css("-webkit-column-count", "1");
	    $("#districtFormContainer").css("column-count", "1");
	
	    $("#dataFormContainer").css("-moz-column-count", "2");
	    $("#dataFormContainer").css("-webkit-column-count", "2");
	    $("#dataFormContainer").css("column-count", "2");
	}
	if ($('body').innerWidth() < 700) {
	    $("#dataFormContainer").css("-moz-column-count", "1");
	    $("#dataFormContainer").css("-webkit-column-count", "1");
	    $("#dataFormContainer").css("column-count", "1");
	    }
	
	}
	
	
	// Map.zoom 
	function centerCamera(){		
		camera.position.y = 1800;
	    camera.position.z = 1800;
		camera.position.x = 0;
		camera.lookAt(0,0,0); 
	}
	function changeZoomLvl(level){
		
		if((level<=17)&&(level>=12)){
			if(Map.zoom!=level){
			//replace slider  with new one
			$("#zoom_slider").data('slider').val((level-12)*20);
			//(level-12)*20						
			Map.zoom=level;
			
			$("#zoom_slider_text").text(Map.zoom);
			switch (Map.zoom) {
			case 13: case 12:
				//BAR_HEIGHT_MULTIPLE= 1;
				Map.TILE_MULTIPLE = 9;
				break;
			case 14:
				//BAR_HEIGHT_MULTIPLE= 0.9;
				Map.TILE_MULTIPLE = 11;
				break;
			case 15:case 16: case 17:
				//BAR_HEIGHT_MULTIPLE= 0.8;	
				Map.TILE_MULTIPLE = 11;
				break;					
			}
		}
	}else{
		console.log("!12<=Map.zoom:"+level+"<=17");
		}
	}
	// Three js Script 
	function drawStreetGraph(redraw){// redraw = re init tiles or not
	start = new Date().getTime();
	if ($("#datatype_all").is(":not(:checked)")) {
		drawDatatypeStreetGraph(redraw);
	}else{
		drawStreetAllGraph(redraw);
	}
	//TIMER
	end = new Date().getTime();
	time = end - start;
	console.log('search street: ' + time);
	}
	function drawStreetAllGraph(redraw) {// redraw = re init tiles or not
	console.log("function drawStreetAllGraph():"+$("#streetSearchBox").val());
	// if street name in search box is not null
	if($("#streetSearchBox").val()!=""){
		console.log("$('#streetSearchBox').val()"+$("#streetSearchBox").val());
		//search for that name
		for(var index = 0; index < jsonObj.streetStats.length;index++){
			if(jsonObj.streetStats[index].formatted_address==$("#streetSearchBox").val()){
				Map.centerLat = jsonObj.streetStats[index].lat;
				Map.centerLng = jsonObj.streetStats[index].lng;
				console.log("Map.centerLat:"+Map.centerLat);
				console.log("Map.centerLng:"+Map.centerLng);
			}
		}
	}else{ // if not, show the default ( Ho Guom)
		Map.centerLat = 21.02811;
		Map.centerLng = 105.853186;
	}
	//$("input[type='checkbox'][name='datatype']").prop('checked', false);	
	//$("#datatype_all").prop('checked', true);
	switch (Map.zoom) {
	case 13: case 12:
		//BAR_HEIGHT_MULTIPLE= 1;
		Map.TILE_MULTIPLE = 9;
		break;
	case 14:
		//BAR_HEIGHT_MULTIPLE= 0.9;
		Map.TILE_MULTIPLE = 11;
		break;
	case 15:case 16: case 17:
		//BAR_HEIGHT_MULTIPLE= 0.8;	
		Map.TILE_MULTIPLE = 11;
		break;					
	}			
	changeZoomLvl(17);
	console.log("value:"+$("#zoom_slider").attr("data-param-init-value"));
	Map.TILE_MULTIPLE = 11;
	if ((graphtype_flag <= 2)||(redraw=1)) {
	    graphtype_flag = 4;
		console.log("redraw:"+Map.zoom);
		//;
		$("#container").empty();
		$("#container").html("<img  src='./images/preloader-w8-cycle-black.gif' style='margin-top: 20%;margin-left:50%'>");
			Map.init_tiles();
			createScene();
			draw_tiles();
			
	    }
		
	    graphtype_flag = 4;  
		
	    graph();
	    animate();
	}
	function drawDatatypeStreetGraph(redraw) {// redraw = re init tiles or not
	console.log("function drawStreetAllGraph():"+$("#streetSearchBox").val());
	// if street name in search box is not null
	if($("#streetSearchBox").val()!=""){
		console.log("$('#streetSearchBox').val()"+$("#streetSearchBox").val());
		//search for that name
		for(var index = 0; index < jsonObj.streetStats.length;index++){
			if(jsonObj.streetStats[index].formatted_address==$("#streetSearchBox").val()){
				Map.centerLat = jsonObj.streetStats[index].lat;
				Map.centerLng = jsonObj.streetStats[index].lng;
				console.log("Map.centerLat:"+Map.centerLat);
				console.log("Map.centerLng:"+Map.centerLng);
			}
		}
	}else{ // if not, show the default ( Ho Guom)
		Map.centerLat = 21.02811;
		Map.centerLng = 105.853186;
	}
	//$("input[type='checkbox'][name='datatype']").prop('checked', true);	
	//$("#datatype_all").prop('checked', false);
	switch (Map.zoom) {
	case 13: case 12:
		//BAR_HEIGHT_MULTIPLE= 1;
		Map.TILE_MULTIPLE = 9;
		break;
	case 14:
		//BAR_HEIGHT_MULTIPLE= 0.9;
		Map.TILE_MULTIPLE = 11;
		break;
	case 15:case 16: case 17:
		//BAR_HEIGHT_MULTIPLE= 0.8;	
		Map.TILE_MULTIPLE = 11;
		break;					
	}			
	changeZoomLvl(17);
	console.log("value:"+$("#zoom_slider").attr("data-param-init-value"));
	if ((graphtype_flag != 3)||(redraw=1)) {
	    graphtype_flag = 3;
		console.log("redraw:"+Map.zoom);
	    //;
		$("#container").empty();
		$("#container").html("<img  src='./images/preloader-w8-cycle-black.gif' style='margin-top: 20%;margin-left:50%'>");
			Map.init_tiles();
			createScene();
			draw_tiles();
			
	    }
		
	    graphtype_flag = 3;  
		
	    graph();
	    animate();
	}
	function drawDistGraph() {
		if ($("#datatype_all").is(":not(:checked)")) {
			drawDistDatatypeGraph();
		}else{
			drawDistAllGraph();
		}
	}
	function drawDistAllGraph() {
		//$("input[type='checkbox'][name='datatype']").prop('checked', false);	
	//$("#datatype_all").prop('checked', true);
	Map.centerLat = 21.0357;
	Map.centerLng = 105.8261;
	switch (Map.zoom) {
	case 13: case 12:
		BAR_WIDTH_MULTIPLE = 1;
		//BAR_HEIGHT_MULTIPLE= 1;
		Map.TILE_MULTIPLE = 9;
		break;
	case 14:
		BAR_WIDTH_MULTIPLE = 1.3;
		//BAR_HEIGHT_MULTIPLE= 0.9;
		Map.TILE_MULTIPLE = 11;
		break;
	case 15: 
		BAR_WIDTH_MULTIPLE = 1.6;
		//BAR_HEIGHT_MULTIPLE= 0.8;	
		Map.TILE_MULTIPLE = 11;
		break;
	case 16: 
		BAR_WIDTH_MULTIPLE = 1.8;
		//BAR_HEIGHT_MULTIPLE= 0.8;	
		Map.TILE_MULTIPLE = 11;
		break;
	case 17: 
		BAR_WIDTH_MULTIPLE = 2;
		//BAR_HEIGHT_MULTIPLE= 0.8;	
		Map.TILE_MULTIPLE = 11;
		break;					
	}
	changeZoomLvl(13);
	if (graphtype_flag >=3) {
		console.log("redraw:"+Map.zoom);
	    graphtype_flag = 1;
		console.log("Map.init_tiles");
	    //;
		$("#container").empty();
		$("#container").html("<img  src='./images/preloader-w8-cycle-black.gif' style='margin-top: 20%;margin-left:50%'>");
			Map.init_tiles();
			createScene();		
			draw_tiles();
			
	    }						
	    graphtype_flag = 1; 
	    graph();
	    animate();
	}
	
	function drawDistDatatypeGraph() {
		//$("input[type='checkbox'][name='datatype']").prop('checked', true);	
	//$("#datatype_all").prop('checked', false);
	Map.centerLat = 21.0357;
	Map.centerLng = 105.8261;
	switch (Map.zoom) {
	case 13: case 12:
		//BAR_HEIGHT_MULTIPLE= 1;
		Map.TILE_MULTIPLE = 9;
		break;
	case 14:
		//BAR_HEIGHT_MULTIPLE= 0.9;
		Map.TILE_MULTIPLE = 11;
		break;
	case 15:case 16: case 17:
		//BAR_HEIGHT_MULTIPLE= 0.8;	
		Map.TILE_MULTIPLE = 11;
		break;					
	}
	changeZoomLvl(13);
	
	
	if (graphtype_flag >=3) {
		console.log("redraw:"+Map.zoom);
		console.log("Map.init_tiles");
	    graphtype_flag = 2;
	    //;
		$("#container").empty();
		$("#container").html("<img  src='./images/preloader-w8-cycle-black.gif' style='margin-top: 20%;margin-left:50%'>");
			Map.init_tiles();
				
	    }
	    graphtype_flag = 2;
	   	createScene();	
		draw_tiles();
	    graph();
	    animate();
	}
	
	function init() {
		// clear scene if redraw
	if(scene){					
		console.log("scene.children.length:"+scene.children.length);
		console.log("scene.clear();");
		scene.clear();
		console.log("scene.children.length:"+scene.children.length);
		console.log("scene.clear() manual;");
		scene.remove(stats);
		scene.remove(ambientLight);
		scene.remove(directionalLight);
		scene.remove(skyDome);
		scene.remove(big_plane);
		console.log("scene.children.length:"+scene.children.length);
	}
	console.log("init :" + graphtype_flag);
	//CAMERA
	camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 1, 15000);	
	centerCamera();	
	
	//camera.rotation.x = 45 * (Math.PI / 180);
	// set some camera attributes
	//var VIEW_ANGLE = 45,
	//    ASPECT = window.innerWidth / window.innerHeight,
	//    NEAR = 1,
	//    FAR = 110000;
	// PROJECTOR
	projector = new THREE.Projector();
	
	// RENDERER
	renderer = new THREE.WebGLRenderer({
	    antialias: true
	});
	renderer.setSize(window.innerWidth, window.innerHeight);
	// shadow
	renderer.shadowMapEnabled = true;
	renderer.shadowMapSoft = false;
	renderer.gammaInput = true;
	renderer.gammaOutput = true;
	renderer.physicallyBasedShading = true;  
	renderer.shadowMapType=THREE.PCFSoftShadowMap;				
	
	//var maxAnisotropy = renderer.getMaxAnisotropy();
	   
		//SCENE
	scene = new THREE.Scene();
	//scene.fog = new THREE.Fog( 0xffffff, 500, 19000 );
	
	
	
	// CONTROL
	controls = new THREE.OrbitControls( camera );
	controls.addEventListener( 'change', render );
	controls.maxPolarAngle = (Math.PI/2)*90/100; 
	controls.maxDistance = Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/1.4;				
	console.log("controls.maxDistance"+controls.maxDistance);
	//LIGHT
	
	// add subtle ambient lighting
	var ambientLight = new THREE.AmbientLight(0xffffff);
	scene.add(ambientLight);
	// add directional light source
	var directionalLight = new THREE.DirectionalLight(0xffffff,0.1);
	directionalLight.position.set(-1000, 3000, -2000);
	//directionalLight.shadowCameraVisible = true;       
	directionalLight.target.position.set(0, 0, 0);
	directionalLight.castShadow = true;
	directionalLight.shadowDarkness = 0.5;
	directionalLight.shadowCameraNear    =  10;
	directionalLight.shadowCameraFar    =  6000;
	directionalLight.shadowCameraRight     =  3000;
	directionalLight.shadowCameraLeft     = -3000;
	directionalLight.shadowCameraTop      =  3000;
	directionalLight.shadowCameraBottom   = -3000;
	directionalLight.shadowMapWidth=Math.pow(2,12);
	directionalLight.shadowMapHeight=Math.pow(2,12);
	directionalLight.shadowBias=-0.0008;
	scene.add(directionalLight);				
	/*
					//hemiLight
					hemiLight = new THREE.HemisphereLight( 0xffffff, 0xffffff, 0.05 );
					hemiLight.color.setHSL( 0.6, 1, 0.75 );
					hemiLight.groundColor.setHSL( 0.1, 0.8, 0.7 );
					hemiLight.position.y = 500;
					//scene.add( hemiLight );
	*/
	
	
	
	stats = new Stats();
	stats.domElement.style.position = 'absolute';
	stats.domElement.style.top = '0px';
	stats.domElement.style.zIndex = 100;
	
	
	//
	
	
	window.addEventListener('resize', onWindowResize, false);
	}
	
	function createScene(){
	console.log("createScene()");
	skyDome = new THREE.Mesh(new THREE.SphereGeometry( DOME_RADIUS *120/100, 32, 15,0,Math.PI*2 ),new THREE.MeshLambertMaterial({ map: THREE.ImageUtils.loadTexture('images/sky_lightblue_1000.jpg'), side: THREE.BackSide }))
	skyDome.rotation.y = Math.PI;
	scene.add(skyDome);
	
	
	//Axes
	var axes = new THREE.AxisHelper();
	axes.scale.set( 1000, 1000, 1000 );
	//scene.add( axes );
	
	// big/base  plane 
	// material
	big_plane = new THREE.Mesh(new THREE.CircleGeometry( DOME_RADIUS, 20, 0, Math.PI * 2 ), new THREE.MeshLambertMaterial({
	    map: THREE.ImageUtils.loadTexture('images/land.jpg'),	
		overdraw: true
	}));
	big_plane.position.y = -10;
	big_plane.rotation.x = -Math.PI / 2;
	big_plane.rotation.z = Math.PI / 4 + Math.PI / 24;
	//plane.castShadow=true;
	//plane.receiveShadow=true;
	scene.add(big_plane);
	container = document.getElementById('container');
	    while (container.firstChild) {
	        container.removeChild(container.firstChild);
	    }
	    container.appendChild(renderer.domElement);
		container.appendChild(stats.domElement);
	}
	function onWindowResize() {
	
	    camera.aspect = window.innerWidth / window.innerHeight;
	    camera.updateProjectionMatrix();
	
	    renderer.setSize(window.innerWidth, window.innerHeight);
	
	    //controls.handleResize();
	
	    render();
	
	}
	
	function graph() {
	createScene();
	console.log("graph()");
	console.log("scene.children.length:"+scene.children.length);
	// Cube				
	console.log("group_cube.length:"+group_cube.length);
	for (var i = 0; i < group_cube.length; i++) {					
	    scene.remove(group_cube[i]);					
	}
	console.log("scene.children.length:"+scene.children.length);
	group_cube = [];
	// base of datatype graph
	console.log("group_datatype_base.length:"+group_datatype_base.length);
	for (var i = 0; i < group_datatype_base.length; i++) {					
	    scene.remove(group_datatype_base[i]);					
	}
	console.log("scene.children.length:"+scene.children.length);
	group_datatype_base = [];
	// generate a random multipler for startValue of a cube height when starting tweening
	var min = 0.4;
	var max = 1.3;
	var startMultipler;
	switch (graphtype_flag) {
	case 1:
	    console.log("drawDistGraph");
	    //console.log(jsonObj.streetStats[jsonObj.streetStats.length-1].datatype_count[jsonObj.streetStats[jsonObj.streetStats.length-1].datatype_count.length-1]);
	
	    // DRAW district graph
		//find max value to set HEIGHT_MULTIPLE
		var max_height=0;					
		for (var index = 0; index < jsonObj.districtStats.length; index++) {
			if(max_height<jsonObj.districtStats[index].data+0.1){
				max_height=jsonObj.districtStats[index].data+0.1;
			}
		}
		
		BAR_HEIGHT_MULTIPLE = (DOME_RADIUS/8)/max_height;
		console.log("max_height:"+max_height);
		console.log("BAR_HEIGHT_MULTIPLE:"+BAR_HEIGHT_MULTIPLE);
		console.log("BAR_WIDTH:"+BAR_WIDTH);
		console.log("BAR_WIDTH_MULTIPLE:"+BAR_WIDTH_MULTIPLE);
		//loop through Stats Item to draw
		var randomColorSet=GraphUtils.randomSet(jsonObj.districtStats.length);			
		console.log("randomColorSet:"+randomColorSet);
	    for (var index = 0; index < jsonObj.districtStats.length; index++) {
	    	Map.latLngToCoord(jsonObj.districtStats[index].lat, jsonObj.districtStats[index].lng);
	        //console.log("district_id:"+jsonObj.districtStats[index].district_id);
	        //console.log("checkbox is:"+$("input[type='checkbox'][value="+jsonObj.districtStats[index].district_id+"]").is(':checked'));
	        if ($("input[type='checkbox'][value=" + jsonObj.districtStats[index].district_id + "][name='dist']").is(':checked')
			&&Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2&&Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2) {
	            
	            //console.log(jsonObj.districtStats[index].data);	
	            // random startMultipler
	            startMultipler = Math.random() * (max - min) + min;
	            var geometry = new THREE.CubeGeometry(1, 1, 1);			
						
				//console.log(randomColorSet[index]);
	            for (var i = 0; i < geometry.faces.length; i++) {
	                geometry.faces[i].color.setHex(randomColorSet[index]);
	            }
	
	            var material = new THREE.MeshLambertMaterial({
	                vertexColors: THREE.FaceColors
	            });
	            var cube = new THREE.Mesh(geometry, material);
	            cube.scale.x = BAR_WIDTH*BAR_WIDTH_MULTIPLE;
	            cube.scale.y = (jsonObj.districtStats[index].data + 0.1) * BAR_HEIGHT_MULTIPLE * startMultipler;
	            cube.scale.z = BAR_WIDTH*BAR_WIDTH_MULTIPLE;
	            cube.position.z = -Map.y_coord;
	            cube.position.x = Map.x_coord;
	            cube.position.y = cube.scale.y / 2;
				//shadow
				cube.castShadow=true;
				cube.receiveShadow=true;
	            // tween
	            var cubeItem = {
	                y: (jsonObj.districtStats[index].data + 0.1) * BAR_HEIGHT_MULTIPLE * startMultipler,
	                mesh: cube
	            };
	
	            var updateCallback = function () {
	                this.mesh.scale.y = this.y;
	                this.mesh.position.y = this.mesh.scale.y / 2;
	            }
	            var tween = new TWEEN.Tween(cubeItem)
	                .to({
	                y: jsonObj.districtStats[index].data * BAR_HEIGHT_MULTIPLE
	            }, 2000)
	                .delay(0)
	                .onUpdate(updateCallback)
	                .easing(TWEEN.Easing.Elastic.Out)
	                .start();
	            group_cube.push(cube);
	            scene.add(cube);
	        }
	    }
	    break;
	case 2:
	    console.log("drawDatatypeGraph");
	    console.log("data:");
	    // draw datatype stats graph
	    var countSurveyTXT = 0,
	        countSurveyIMG = 0,
	        countSurveyAUD = 0,
	        countSurveyVID = 0,
	        curDistrict;
		//find max value to set HEIGHT_MULTIPLE
		var max_height=0;					
		for (var index = 0; index < jsonObj.districtStats.length; index++) {
			if(max_height<jsonObj.districtStats[index].data+0.1){
				max_height=jsonObj.districtStats[index].data+0.1;
			}
		}
		BAR_HEIGHT_MULTIPLE = (DOME_RADIUS/8)/max_height;
		console.log("max_height:"+max_height);
		console.log("BAR_HEIGHT_MULTIPLE:"+BAR_HEIGHT_MULTIPLE);
		console.log("BAR_WIDTH:"+BAR_WIDTH);
		console.log("BAR_WIDTH_MULTIPLE:"+BAR_WIDTH_MULTIPLE);
	    //loop thourgh dataTypeStats Item
		var randomColorSet=GraphUtils.randomSet(18);	
		console.log("randomColorSet:"+randomColorSet);
	    for (var index = 0; index < jsonObj.dataTypeStats.length; index++) {
	        countSurveyTXT = 0.1, countSurveyIMG = 0.1, countSurveyAUD = 0.1, countSurveyVID = 0.1, curDistrict = jsonObj.dataTypeStats[index].district_id;
	
	        Map.latLngToCoord(jsonObj.dataTypeStats[index].lat, jsonObj.dataTypeStats[index].lng);
	        // random startMultipler
	        startMultipler = Math.random() * (max - min) + min;
	        // for each dataType item , loop thourgh each district , count & add to countSurvey
	        while (index < jsonObj.dataTypeStats.length && curDistrict == jsonObj.dataTypeStats[index].district_id) {
	
	            // if its time-checkbox is checked , count that data
	            if ($("input[type='checkbox'][value=" + jsonObj.dataTypeStats[index].time_id + "][name='time']").is(':checked')) { // count only checked_time 
	                //console.log("index:"+index);
	                //console.log("jsonObj.dataTypeStats[index].datatype:"+jsonObj.dataTypeStats[index].datatype_id);
	                //if(jsonObj.dataTypeStats[index].datatype_id==1){
	                //	countSurveyTXT++;
	                //}
	                switch (jsonObj.dataTypeStats[index].datatype_id) {
	                case 1:
	                    countSurveyTXT += jsonObj.dataTypeStats[index].data;
	                    break;
	                case 2:
	                    countSurveyIMG += jsonObj.dataTypeStats[index].data;
	                    break;
	                case 3:
	                    countSurveyAUD += jsonObj.dataTypeStats[index].data;
	                    break;
	                case 4:
	                    countSurveyVID += jsonObj.dataTypeStats[index].data;
	                    break;
	                default:
	                    console.log(jsonObj.dataTypeStats[index].data);
	                    break;
	                }
	
	            }
	            // increase index
	            index++;
	        }
	
			//draw base of graph
			if (Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2&&Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2) {
				plane = new THREE.Mesh(new THREE.CubeGeometry( BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE * 6,BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE * 6 , 1, 1), new THREE.MeshLambertMaterial({
				map: THREE.ImageUtils.loadTexture('images/datatype_graph_base.jpg'),	
					overdraw: true,
					opacity: 0.8,
					transparent: true
				}));
				plane.position.y = 5;
				plane.position.x=Map.x_coord;
				plane.position.z=-Map.y_coord;
				plane.rotation.x = -Math.PI / 2;
				plane.rotation.z = 0;
				//plane.castShadow=true;
				plane.receiveShadow=true;
				group_datatype_base.push(plane);
				scene.add(plane);
			}
	        for (var datatype_index = 1; datatype_index <= 4; datatype_index++) {
	            // draw only checked_datatype and checked_district and inside map
	            if ($("input[type='checkbox'][value=" + datatype_index + "][name='datatype']").is(':checked') && $("input[type='checkbox'][value=" + jsonObj.dataTypeStats[index - 1].district_id + "][name='dist']").is(':checked')
				&&Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2&&Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2) {
	                //console.log("curDistrict:"+curDistrict);
	                //console.log("jsonObj.dataTypeStats[index-1].district_id :"+jsonObj.dataTypeStats[index-1].district_id );
	                //bar position
	                switch (datatype_index) {
	                case 1:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0x850A0A);
	                    }
	                    var material = new THREE.MeshPhongMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyTXT * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.z = -(Map.y_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.y = cube.scale.y / 2;
						//shadow
						cube.castShadow=true;
						cube.receiveShadow=true;
	                    // tween
	                    var cubeItem = {
	                        y: countSurveyTXT * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                        //console.log("cube.scale.y:" + this.mesh.scale.y);
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyTXT * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                case 2:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0xE79819);
	                    }
	                    var material = new THREE.MeshLambertMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyIMG * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    
						cube.position.z = -(Map.y_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.y = cube.scale.y / 2;
						//shadow
						cube.castShadow=true;
						cube.receiveShadow=true;
	                    // tween
	                    var cubeItem = {
	                        y: countSurveyIMG * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyIMG * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                case 3:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0x7C80F2);
	                    }
	                    var material = new THREE.MeshLambertMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyAUD * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.z = -(Map.y_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.y = cube.scale.y / 2;
						//shadow
						cube.castShadow=true;
						cube.receiveShadow=true;
	                    // tween
	                    var cubeItem = {
	                        y: countSurveyAUD * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                        //console.log("cube.scale.y:" + this.mesh.scale.y);
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyAUD * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                case 4:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0x00F0A8);
	                    }
	                    var material = new THREE.MeshLambertMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyVID * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
						cube.position.z = -(Map.y_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	
	                    cube.position.y = cube.scale.y / 2;
	                    
	                    //shadow
						cube.castShadow=true;
						cube.receiveShadow=true;
						// tween
	                    var cubeItem = {
	                        y: countSurveyVID * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                        //console.log("cube.scale.y:" + this.mesh.scale.y);
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyVID * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                default:
	                    console.log("countSurvey:" + countSurveyTXT + ":" + countSurveyIMG + ":" + countSurveyAUD + ":" + countSurveyVID);
	                    break;
	                }
	            }
	
	        }
	
	
	
	
	    }
	    break;
	case 3:
		var count=0;
	    console.log("drawDatatypeStreetGraph");
	    // draw district graph
	    // draw datatype stats graph
		
		//find max value to set HEIGHT_MULTIPLE
		var max_height=0;					
		console.log("jsonObj.streetStats.length:"+jsonObj.streetStats.length);
		for (var index = 0; index < jsonObj.streetStats.length; index++) {
			Map.latLngToCoord(jsonObj.streetStats[index].lat, jsonObj.streetStats[index].lng);
			if ((Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2&&Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2)
			   &&(max_height<jsonObj.streetStats[index].count+0.1)){
				max_height=jsonObj.streetStats[index].count+0.1;
			}
		}
		BAR_HEIGHT_MULTIPLE = (DOME_RADIUS/8)/max_height; 
		
		/*
		//loop thourgh dataTypeStats Item
	    for (var index = 0; index < jsonObj.streetStats.length; index++) {
	        var countSurveyTXT = 0,
	            countSurveyIMG = 0,
	            countSurveyAUD = 0,
	            countSurveyVID = 0,
	            curStreet;
	        countSurveyTXT = 0.1, countSurveyIMG = 0.1, countSurveyAUD = 0.1, countSurveyVID = 0.1, curStreet = jsonObj.streetStats[index].street_id;
	        var datatypejsonObj = eval(jsonObj.streetStats[index].datatype_count);                
			
	        // for each dataType item , loop thourgh each district , count & add to countSurvey
	
	        for (var i = 0; i < datatypejsonObj.length; i++) {
	            for (var j = 0; j < datatypejsonObj[0].length; j++) {
	                // if its time-checkbox is checked , count that data
	                if ($("input[type='checkbox'][value=" + j + "][name='time']").is(':checked')) { // count only checked_time 
	                    //console.log("index:"+index);
	                    //console.log("jsonObj.dataTypeStats[index].datatype:"+jsonObj.dataTypeStats[index].datatype_id);
	                    //if(jsonObj.dataTypeStats[index].datatype_id==1){
	                    //	countSurveyTXT++;
	                    //}
	                    //console.log("datatypejsonObj[" + i + "][" + j + "].count" + datatypejsonObj[i][j]);
	                    switch (i) {
	                    case 0:
	                        countSurveyTXT += datatypejsonObj[i][j];
	                        break;
	                    case 1:
	                        countSurveyIMG += datatypejsonObj[i][j];
	                        break;
	                    case 2:
	                        countSurveyAUD += datatypejsonObj[i][j];
	                        break;
	                    case 3:
	                        countSurveyVID += datatypejsonObj[i][j];
	                        break;
	                    default:
	                        console.log(datatypejsonObj[i][j]);
	                        break;
	                    }
	
	                }
	            }
	
	        }
			if(max_height<countSurveyTXT){
				max_height=countSurveyTXT
			}if(max_height<countSurveyIMG){
				max_height=countSurveyIMG
			}if(max_height<countSurveyAUD){
				max_height=countSurveyAUD
			}if(max_height<countSurveyVID){
				max_height=countSurveyVID
			}
			
		}
		*/
		console.log("max_height:"+max_height);
		console.log("BAR_HEIGHT_MULTIPLE:"+BAR_HEIGHT_MULTIPLE);
		console.log("BAR_WIDTH:"+BAR_WIDTH);
		console.log("BAR_WIDTH_MULTIPLE:"+BAR_WIDTH_MULTIPLE);
	    //loop thourgh dataTypeStats Item
	    for (var index = 0; index < jsonObj.streetStats.length; index++) {
	        var countSurveyTXT = 0,
	            countSurveyIMG = 0,
	            countSurveyAUD = 0,
	            countSurveyVID = 0,
	            curStreet;
	        countSurveyTXT = 0.1, countSurveyIMG = 0.1, countSurveyAUD = 0.1, countSurveyVID = 0.1, curStreet = jsonObj.streetStats[index].street_id;
	        var datatypejsonObj = eval(jsonObj.streetStats[index].datatype_count);
	        Map.latLngToCoord(jsonObj.streetStats[index].lat, jsonObj.streetStats[index].lng);
	        // random startMultipler
	        startMultipler = Math.random() * (max - min) + min;
			
	        // for each dataType item , loop thourgh each district , count & add to countSurvey
	
	        for (var i = 0; i < datatypejsonObj.length; i++) {
	            for (var j = 0; j < datatypejsonObj[0].length; j++) {
	                // if its time-checkbox is checked , count that data
	                if ($("input[type='checkbox'][value=" + j + "][name='time']").is(':checked')) { // count only checked_time 
	                    //console.log("index:"+index);
	                    //console.log("jsonObj.dataTypeStats[index].datatype:"+jsonObj.dataTypeStats[index].datatype_id);
	                    //if(jsonObj.dataTypeStats[index].datatype_id==1){
	                    //	countSurveyTXT++;
	                    //}
	                    //console.log("datatypejsonObj[" + i + "][" + j + "].count" + datatypejsonObj[i][j]);
	                    switch (i) {
	                    case 0:
	                        countSurveyTXT += datatypejsonObj[i][j];
	                        break;
	                    case 1:
	                        countSurveyIMG += datatypejsonObj[i][j];
	                        break;
	                    case 2:
	                        countSurveyAUD += datatypejsonObj[i][j];
	                        break;
	                    case 3:
	                        countSurveyVID += datatypejsonObj[i][j];
	                        break;
	                    default:
	                        console.log(datatypejsonObj[i][j]);
	                        break;
	                    }
	
	                }
	            }
	
	        }
			
			//console.log("countSurveyTXT"+countSurveyTXT);
			//console.log("countSurveyIMG"+countSurveyIMG);
			//console.log("countSurveyAUD"+countSurveyAUD);
			//console.log("countSurveyVID"+countSurveyVID);
			//var randomColorSet=GraphUtils.randomSet(jsonObj.districtStats.length);	
			//draw base of graph
			if (Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2&&Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2) {
				plane = new THREE.Mesh(new THREE.CubeGeometry( BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE * 6,BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE * 6 , 1, 1), new THREE.MeshLambertMaterial({
				map: THREE.ImageUtils.loadTexture('images/datatype_graph_base.jpg'),	
					overdraw: true,
					opacity: 0.8,
					transparent: true
				}));
				plane.position.y = 5;
				plane.position.x=Map.x_coord;
				plane.position.z=-Map.y_coord;
				plane.rotation.x = -Math.PI / 2;
				plane.rotation.z = 0;
				//plane.castShadow=true;
				plane.receiveShadow=true;
				group_datatype_base.push(plane);
				scene.add(plane);	
			}						
	        for (var datatype_index = 1; datatype_index <= 4; datatype_index++) {
				
	            // draw only checked_datatype & checked_district & inside map
	            if ($("input[type='checkbox'][value=" + datatype_index + "][name='datatype']").is(':checked') && $("input[type='checkbox'][value=" + jsonObj.streetStats[index].district_id + "][name='dist']").is(':checked')
				&&(Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2)&&(Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2)) {
					count++;
	                //console.log("jsonObj.streetStats[index-1].district_id :"+jsonObj.streetStats[index].district_id );
	                //bar position
					
	                switch (datatype_index) {
	                case 1:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0x850A0A);
	                    }
	                    var material = new THREE.MeshLambertMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyTXT * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.z = -(Map.y_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.y = cube.scale.y / 2;
						//shadow
						cube.castShadow=true;
						//cube.receiveShadow=true;
	                    // tween
	                    var cubeItem = {
	                        y: countSurveyTXT * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                        //console.log("cube.scale.y:" + this.mesh.scale.y);
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyTXT * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                case 2:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0xE79819);
	                    }
	                    var material = new THREE.MeshLambertMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyIMG * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    
						cube.position.z = -(Map.y_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.y = cube.scale.y / 2;
						//shadow
						cube.castShadow=true;
						//cube.receiveShadow=true;
	                    // tween
	                    var cubeItem = {
	                        y: countSurveyIMG * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyIMG * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                case 3:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0x7C80F2);
	                    }
	                    var material = new THREE.MeshLambertMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyAUD * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.z = -(Map.y_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.y = cube.scale.y / 2;
						//shadow
						cube.castShadow=true;
						//cube.receiveShadow=true;
	                    // tween
	                    var cubeItem = {
	                        y: countSurveyAUD * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                        //console.log("cube.scale.y:" + this.mesh.scale.y);
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyAUD * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                case 4:
	                    var geometry = new THREE.CubeGeometry(1, 1, 1);
	                    for (var i = 0; i < geometry.faces.length; i++) {
	                        geometry.faces[i].color.setHex(0x00F0A8);
	                    }
	                    var material = new THREE.MeshLambertMaterial({
	                        vertexColors: THREE.FaceColors
	                    });
	                    var cube = new THREE.Mesh(geometry, material);
	                    cube.scale.x = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.scale.y = countSurveyVID * BAR_HEIGHT_MULTIPLE * startMultipler;
	                    cube.scale.z = BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    
						cube.position.z = -(Map.y_coord + BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE);
	                    cube.position.x = Map.x_coord - BAR_WIDTH_DATATYPE_SPACE * BAR_WIDTH_DATATYPE * BAR_WIDTH_MULTIPLE;
	                    cube.position.y = cube.scale.y / 2;
						//shadow
						cube.castShadow=true;
						//cube.receiveShadow=true;
	                    // tween
	                    var cubeItem = {
	                        y: countSurveyVID * BAR_HEIGHT_MULTIPLE * startMultipler,
	                        mesh: cube
	                    };
	
	                    var updateCallback = function () {
	                        this.mesh.scale.y = this.y;
	                        this.mesh.position.y = this.mesh.scale.y / 2;
	                        //console.log("cube.scale.y:" + this.mesh.scale.y);
	                    }
	                    var tween = new TWEEN.Tween(cubeItem)
	                        .to({
	                        y: countSurveyVID * BAR_HEIGHT_MULTIPLE
	                    }, 2000)
	                        .delay(0)
	                        .onUpdate(updateCallback)
	                        .easing(TWEEN.Easing.Elastic.Out)
	                        .start();
	                    group_cube.push(cube);
	                    scene.add(cube);
	                    break;
	                default:
	                    //console.log("countSurvey:" + countSurveyTXT + ":" + countSurveyIMG + ":" + countSurveyAUD + ":" + countSurveyVID);
	                    break;
	                }
	            }else{
				/*
					var temp_bool = $("input[type='checkbox'][value=" + datatype_index + "][name='datatype']").is(':checked');
					console.log("cb datatype "+datatype_index+"is: "+ temp_bool );
					temp_bool = $("input[type='checkbox'][value=" + jsonObj.streetStats[index].district_id + "][name='dist']").is(':checked');
					console.log("cb district "+jsonObj.streetStats[index].district_id+"is: "+ temp_bool );
					console.log("x:y  "+Map.x_coord+":"+Map.y_coord);
					*/
				}
	
	        }                   
	    }
		console.log("cube count:"+count);
	    break;
	case 4:
	var count=0;
	    console.log("drawStreetAllGraph");
		
	    //console.log(jsonObj.streetStats[jsonObj.streetStats.length-1].datatype_count[jsonObj.streetStats[jsonObj.streetStats.length-1].datatype_count.length-1]);
	
	    // DRAW district graph
		//find max value to set HEIGHT_MULTIPLE
		var max_height=0;					
		console.log("jsonObj.streetStats.length:"+jsonObj.streetStats.length);
		for (var index = 0; index < jsonObj.streetStats.length; index++) {
			Map.latLngToCoord(jsonObj.streetStats[index].lat, jsonObj.streetStats[index].lng);
			if ((Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2&&Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2)
			   &&(max_height<jsonObj.streetStats[index].count+0.1)){
				max_height=jsonObj.streetStats[index].count+0.1;
			}
		}
		BAR_HEIGHT_MULTIPLE = (DOME_RADIUS/8)/max_height;
		console.log("max_height:"+max_height);
		console.log("BAR_HEIGHT_MULTIPLE:"+BAR_HEIGHT_MULTIPLE);
		console.log("BAR_WIDTH:"+BAR_WIDTH);
		console.log("BAR_WIDTH_MULTIPLE:"+BAR_WIDTH_MULTIPLE);
		//loop through Stats Item to draw					
	    for (var index = 0; index < jsonObj.streetStats.length; index++) {
	
	        //console.log("district_id:"+jsonObj.streetStats[index].district_id);
	        //console.log("checkbox is:"+$("input[type='checkbox'][value="+jsonObj.streetStats[index].district_id+"]").is(':checked'));
	        // draw if street is inside map and district is checked
			Map.latLngToCoord(jsonObj.streetStats[index].lat, jsonObj.streetStats[index].lng);
			if ($("input[type='checkbox'][value=" + jsonObj.streetStats[index].district_id + "][name='dist']").is(':checked')
			&&Math.abs(Map.x_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2&&Math.abs(Map.y_coord)<Map.STATIC_MAP_SIZE*Map.TILE_MULTIPLE/2) {                            
	            count++;
				//console.log(jsonObj.streetStats[index].data);	
	            // random startMultipler
	            startMultipler = Math.random() * (max - min) + min;
	            var geometry = new THREE.CubeGeometry(1, 1, 1);			
						
				//console.log("BAR_WIDTH"+BAR_WIDTH);
				// create material color based on average
			    var scale = ( jsonObj.streetStats[index].count / max_height ) * 255;
			    var mathColor = GraphUtils.gradient(Math.round(scale),255);
	            for (var i = 0; i < geometry.faces.length; i++) {
					geometry.faces[i].color.setHex(mathColor);
				}
				var material = new THREE.MeshLambertMaterial({
					vertexColors: THREE.FaceColors
				});
				var cube = new THREE.Mesh(geometry, material);
	            cube.scale.x = BAR_WIDTH;
	            cube.scale.y = (jsonObj.streetStats[index].count + 0.1) * BAR_HEIGHT_MULTIPLE * startMultipler;
	            cube.scale.z = BAR_WIDTH;
	            cube.position.z = -Map.y_coord;
	            cube.position.x = Map.x_coord;
	            cube.position.y = cube.scale.y / 2;
				//shadow
				cube.castShadow=true;
				cube.receiveShadow=true;
	            // tween
	            var cubeItem = {
	                y: (jsonObj.streetStats[index].count + 0.1) * BAR_HEIGHT_MULTIPLE * startMultipler,
	                mesh: cube
	            };
	
	            var updateCallback = function () {
	                this.mesh.scale.y = this.y;
	                this.mesh.position.y = this.mesh.scale.y / 2;
	            }
	            var tween = new TWEEN.Tween(cubeItem)
	                .to({
	                y: jsonObj.streetStats[index].count * BAR_HEIGHT_MULTIPLE
	            }, 2000)
	                .delay(0)
	                .onUpdate(updateCallback)
	                .easing(TWEEN.Easing.Elastic.Out)
	                .start();
	            group_cube.push(cube);
	            scene.add(cube);
	        }else{
			}
	    }
		console.log("cube count:"+count);
	        break;
		default:
	        break;
	    }
	}
	
	function animate() {
	    requestAnimationFrame(animate);
	    //tween
	TWEEN.update();
	//Map.zoom
	if(camera.position.y<40){
		camera.position.y=50;
	}
	if(camera.position.x>controls.maxDistance){
		camera.position.x=controls.maxDistance-100;
	}
	if(camera.position.z>controls.maxDistance){
		camera.position.z=controls.maxDistance-100;
	}
	if(camera.position.y<500&&camera){
	}
	
	// update
	
	var date = new Date();
	var time = date.getTime();
	var timeDiff = time - lastTime;
	var angleChange = angularSpeed * timeDiff * 2 * Math.PI / 1000;
	//plane.rotation.z += angleChange;
	//cube.rotation.z += angleChange;
	
	    lastTime = time;
	
	    render();
	    update();
	
	
	}
	
	function update() {
	    //controls.panSpeed = camera.position.y/1000;
	//console.log("cam.pos.y:spd"+camera.position.y+":"+controls.panSpeed);
	controls.update();
	//camera.position.z = Math.max( camera.position.z, 50);
	    stats.update();
	}
	
	function render() {
	    renderer.render(scene, camera);
	    //console.log(camera.position.x+":"+camera.position.y+":"+camera.position.z);		
	//console.log("rot"+camera.rotation.x+":"+camera.rotation.y+":"+camera.rotation.z);
	}
	
	
	 //skybox
	
	function loadTexture(path) {
	
	    var texture = new THREE.Texture(texture_placeholder);
	    var material = new THREE.MeshLambertMaterial({
	        map: texture,
	        overdraw: true
	    });
	
	    var image = new Image();
	    image.onload = function () {
	
	        texture.needsUpdate = true;
	        material.map.image = this;
	
	        render();
	
	    };
	    image.src = path;
	
	    return material;
	
	}
	 
	/*
	            function Map.init_tiles() {
					console.log("init_tile:"+Map.zoom);
					//console.log("Map.centerLat:"+Map.centerLat);
					//console.log("Map.centerLng:"+Map.centerLng);
	                //proj = new MercatorProjection();
	                G = google.maps;
	                // get x y of the tile in selected lat-lng	
					//console.log("long2tile("+Map.centerLng+", "+Map.zoom+"):" + long2tile(Map.centerLng, Map.zoom));
	                //console.log("lat2tile("+Map.centerLat+", "+Map.zoom+"):" + lat2tile(Map.centerLat, Map.zoom));
	                x_tile = long2tile(Map.centerLng, Map.zoom);
	                y_tile = lat2tile(Map.centerLat, Map.zoom);
	                //get lat - lng of the center of the tile image fetched
	                tile_center_lng = tile2long(x_tile + 0.5, Map.zoom); // + 0.5 to return center point , return NW corner by default 
	                tile_center_lat = tile2lat(y_tile + 0.5, Map.zoom);
	                NWLng = tile2long(x_tile, Map.zoom);
	                NWLat = tile2lat(y_tile, Map.zoom);
	                //SELat = tile2long(x_tile+1,Map.zoom);
	                //SELng = tile2lat(x_tile+1,Map.zoom);
	                //strDataURI = "http://b.tile.openstreetmap.org/"+Map.zoom+"/"+x_tile+"/"+y_tile+".png";
	                console.log("x_tile :" + long2tile(Map.centerLng, Map.zoom));
	                console.log("y_tile :" + lat2tile(Map.centerLat, Map.zoom));
	                console.log("tile center long:" + tile2long(x_tile + 0.5, Map.zoom));
	                console.log("tile center lat :" + tile2lat(y_tile + 0.5, Map.zoom));
	                //console.log("tile NW long:" + tile2long(x_tile, Map.zoom));
	                //console.log("tile NW lat :" + tile2lat(y_tile, Map.zoom));
	                centerPoint = new G.LatLng(tile_center_lat, tile_center_lng);
			    }
				*/
	function draw_tiles() {			
		// plane	
	for (var i = 0; i < group_plane.length; i++) {
	    scene.remove(group_plane[i]);
	}
	group_plane = []
	//group_plane.castShadow=true;
	//group_plane.receiveShadow=true;
	
	// plane
	for (var i = -(Map.TILE_MULTIPLE - 1) / 2; i <= (Map.TILE_MULTIPLE - 1) / 2; i++) {
	    for (var j = -(Map.TILE_MULTIPLE - 1) / 2; j <= (Map.TILE_MULTIPLE - 1) / 2; j++) {
	
	
	        //texture
	        //image = document.getElementById("myCanvas");
	
	        //imageContext = image.getContext( '2d' );
	        //imageContext.fillStyle = '#FF0000';
	        //imageContext.fillRect(0,0,150,75);
	
	        texture = new THREE.Texture(image);
	        // material
	        var material = new THREE.MeshLambertMaterial({
	            map: THREE.ImageUtils.loadTexture(Map.getURL(i, j)),
	            //map: texture
	            
	            overdraw: true,
	            opacity: 1,
	            transparent: false
	        });
			//material.castShadow=true;
			//material.receiveShadow=true;
	        //console.log(Map.getURL(i,j));
	        plane = new THREE.Mesh(new THREE.PlaneGeometry(Map.STATIC_MAP_SIZE, Map.STATIC_MAP_SIZE, 1, 1), material);
	        plane.overdraw = true;
	        plane.doubleSided = true;
	        plane.position.z = -j * Map.STATIC_MAP_SIZE;
	        plane.position.x = i * Map.STATIC_MAP_SIZE;
	        plane.rotation.x = -Math.PI / 2;
	        plane.material.side = THREE.DoubleSide;
			//plane.castShadow=true;
				plane.receiveShadow=true;
	            group_plane.push(plane);
				scene.add(plane);
	        }
	    }
	    
	}
	//MAP UTIL
	/*
	function getCorners(center, Map.zoom, mapWidth, mapHeight) {
	    var scale = Math.pow(2, Map.zoom);
	    var centerPx = proj.fromLatLngToPoint(center);
	    var SWPoint = {
	        x: (centerPx.x - (mapWidth / 2) / scale),
	        y: (centerPx.y + (mapHeight / 2) / scale)
	    };
	    SWLatLng = proj.fromPointToLatLng(SWPoint);
	    //console.log('SW: ' + SWLatLng);
	    var NEPoint = {
	        x: (centerPx.x + (mapWidth / 2) / scale),
	        y: (centerPx.y - (mapHeight / 2) / scale)
	    };
	    NELatLng = proj.fromPointToLatLng(NEPoint);
	    //console.log(' NE: '+ NELatLng);
	}
	
	 // GET URL OF TILE
	
	function Map.getURL(x_offset, y_offset) {
	    var temp_x = x_tile + x_offset;
	    var temp_y = y_tile - y_offset; // map tile aray count from top left , coord count from left botom
	    // select random server
	    var servers = [
	            "a",
	            "b",
	            "c"
	    ];
	    var server = servers[Math.floor(Math.random() * servers.length)];
	    return "http://" + server + ".tile.openstreetmap.org/" + Map.zoom + "/" + temp_x + "/" + temp_y + ".png";
	}
	 // draw canvas	
	 // utils function
	
	function long2tile(lon, Map.zoom) {
		lon = parseFloat(lon);
	    return (Math.floor((lon + 180) / 360 * Math.pow(2, Map.zoom)));
	}
	
	function lat2tile(lat, Map.zoom) {
		lat = parseFloat(lat);
	    return (Math.floor((1 - Math.log(Math.tan(lat * Math.PI / 180) + 1 / Math.cos(lat * Math.PI / 180)) / Math.PI) / 2 * Math.pow(2, Map.zoom)));
	}
	
	function tile2long(x, z) {
	    return (x / Math.pow(2, z) * 360 - 180);
	}
	
	function tile2lat(y, z) {
	    var n = Math.PI - 2 * Math.PI * y / Math.pow(2, z);
	    return (180 / Math.PI * Math.atan(0.5 * (Math.exp(n) - Math.exp(-n))));
	}
	
	 // convert LatLng to coordination in the scene
	
	function Map.latLngToCoord(lat, lng) {
	    //console.log(' PLANE_HEIGHT: '+ PLANE_HEIGHT);
	    //console.log(' PLANE_WIDTH: '+ PLANE_WIDTH);
	    //console.log(' centerPoint.lat(): '+ centerPoint.lat());
	    //console.log(' centerPoint.lng(): '+ centerPoint.lng());
	    //console.log(' NWLat: '+ NWLat);
	    //console.log(' NWLng: '+ NWLng);
	    Map.y_coord = (Map.STATIC_MAP_SIZE / 2) * ((lat - centerPoint.lat()) / (NWLat - centerPoint.lat()));
	    Map.x_coord = (Map.STATIC_MAP_SIZE / 2) * ((lng - centerPoint.lng()) / (centerPoint.lng() - NWLng));
	}
	function CoordtoLatLng(x, y) {
	    //console.log(' PLANE_HEIGHT: '+ PLANE_HEIGHT);
	    //console.log(' PLANE_WIDTH: '+ PLANE_WIDTH);
	    //console.log(' centerPoint.lat(): '+ centerPoint.lat());
	    //console.log(' centerPoint.lng(): '+ centerPoint.lng());
	    console.log(' NWLat: '+ NWLat);
	    console.log(' NWLng: '+ NWLng);
		Map.centerLat = (y/(Map.STATIC_MAP_SIZE / 2))*(NWLat - centerPoint.lat()) + centerPoint.lat();
		Map.centerLng = (x/(Map.STATIC_MAP_SIZE / 2))*(centerPoint.lng() - NWLng) + centerPoint.lng();            
	}
	*/
	THREE.Object3D.prototype.clear = function(){
		var children = this.children;
		for(var i = children.length-1;i>=0;i--){
			var child = children[i];
			child.clear();
			this.remove(child);
		};
	};