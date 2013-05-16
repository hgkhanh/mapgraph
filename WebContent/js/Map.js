var Map ={ 
	zoom: 13,
	x_tile: 0,  // OpenStreetMap Static Map Tile URL parameter
	y_tile: 0,
	x_coord: 0, // temporary  point
	y_coord: 0,
	centerLat: 21.0357,  // map center point
	centerLng: 105.8261,
	STATIC_MAP_SIZE: 512,
	TILE_MULTIPLE: 9,
	NWLng:0,
	NWLat:0,
	
	
	init_tiles: function() {
		console.log("init_tile:"+this.zoom);
		//console.log("Map.centerLat:"+Map.centerLat);
		//console.log("Map.centerLng:"+Map.centerLng);
		//proj = new MercatorProjection();
		// get x y of the tile in selected lat-lng	
		//console.log("long2tile("+Map.centerLng+"; "+this.zoom+"):" + long2tile(Map.centerLng; this.zoom));
		//console.log("lat2tile("+Map.centerLat+"; "+this.zoom+"):" + lat2tile(Map.centerLat; this.zoom));
		this.x_tile = this.long2tile(this.centerLng);
		this.y_tile = this.lat2tile(this.centerLat);
		//get lat - lng of the center of the tile image fetched
		this.centerLng = this.tile2long(this.x_tile + 0.5); // + 0.5 to return center point ; return NW corner by default 
		this.centerLat = this.tile2lat(this.y_tile + 0.5);
		this.NWLng = this.tile2long(this.x_tile);
		this.NWLat = this.tile2lat(this.y_tile);
		//SELat = tile2long(x_tile+1;this.zoom);
		//SELng = tile2lat(x_tile+1;this.zoom);
		//strDataURI = "http://b.tile.openstreetmap.org/"+this.zoom+"/"+x_tile+"/"+y_tile+".png";
		console.log("x_tile :" + this.long2tile(this.centerLng));
		console.log("y_tile :" + this.lat2tile(this.centerLat));
		console.log("tile center long:" + this.tile2long(this.x_tile + 0.5));
		console.log("tile center lat :" + this.tile2lat(this.y_tile + 0.5));
		//console.log("tile NW long:" + tile2long(x_tile; this.zoom));
		//console.log("tile NW lat :" + tile2lat(y_tile; this.zoom));		
	},
	
	
	/**
	Convert x;y (URL parameter) to Lat and Lng
	*/
	coordtoLatLng: function(x, y) {
		console.log(' NWLat: '+ this.NWLat);
		console.log(' NWLng: '+ this.NWLng);
		this.centerLat = (y/(this.STATIC_MAP_SIZE / 2))*(this.NWLat - this.centerLat) + this.centerLat;
		this.centerLng = (x/(this.STATIC_MAP_SIZE / 2))*(this.centerLng - this.NWLng) + this.centerLng;            
	},
	/**
	Convert Lat and Lng to x;y (URL parameter) to 
	*/
	latLngToCoord: function(lat, lng) {
		this.y_coord = (this.STATIC_MAP_SIZE / 2) * ((lat - this.centerLat) / (this.NWLat - this.centerLat));
		this.x_coord = (this.STATIC_MAP_SIZE / 2) * ((lng - this.centerLng) / (this.centerLng - this.NWLng));
	},
	
	/**
	Given long;this.zoom ; find x
	*/
	long2tile: function(lon) {
		lon = parseFloat(lon);
		return (Math.floor((lon + 180) / 360 * Math.pow(2, this.zoom)));
	},
	/**
	Given lat;this.zoom ; find y
	*/
	lat2tile: function(lat) {
		lat = parseFloat(lat);
		return (Math.floor((1 - Math.log(Math.tan(lat * Math.PI / 180) + 1 / Math.cos(lat * Math.PI / 180)) / Math.PI) / 2 * Math.pow(2, this.zoom)));
	},

	/**
	Given x;this.zoom(URL parameter) ; find longitude
	*/
	tile2long: function(x) {
		return (x / Math.pow(2, this.zoom) * 360 - 180);
	},
	/**
	Given y;this.zoom(URL parameter) ; find lat
	*/
	tile2lat: function(y) {
		var n = Math.PI - 2 * Math.PI * y / Math.pow(2, this.zoom);
		return (180 / Math.PI * Math.atan(0.5 * (Math.exp(n) - Math.exp(-n))));
	},
	
	/**
	Generate a OpenStreetMap Static Map Tile URL from x;y parameter
	*/
	getURL: function(x_offset, y_offset) {
		var temp_x = this.x_tile + x_offset;
		var temp_y = this.y_tile - y_offset; // map tile aray count from top left ; coord count from left botom
		// select random server
		var servers = [
				"a",
				"b",
				"c"
		];
		var server = servers[Math.floor(Math.random() * servers.length)];
		return "http://" + server + ".tile.openstreetmap.org/" + this.zoom + "/" + temp_x + "/" + temp_y + ".png";
	}
	
	
}