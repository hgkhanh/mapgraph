function ColorUtils() {
    this.colorList = [
	
	 "0xEB8787",
 "0x8A0DA6",
 "0xD67CF2",
 "0x7C80F2",
 "0x2914E7",
 "0x172083",
 "0xA8FAFF",
 "0x00F0A8",
 "0x17838B",
 "0x95ED9B",
 "0x34DD1A",
 "0x08641C",
 "0xE7EB98",
 "0xEBF709",
 "0xE79819",
 "0xDF220E",
 "0x850A0A",
 "0xE1E9EC",
 "0x5E5068"
	
	];
}
ColorUtils.prototype.gradient=function (length, maxLength) {

	var i = (length * 255 / maxLength);
	var r = i;
	var g = (255-(i));
	var b = 50;

	var rgb = "0x"+toHex(r)+toHex(g)+toHex(b);
	return rgb;
};

ColorUtils.prototype.toHex=function(n) {
 n = parseInt(n,10);
 if (isNaN(n)) return "00";
 n = Math.max(0,Math.min(n,255));
 return "0123456789ABCDEF".charAt((n-n%16)/16)
	  + "0123456789ABCDEF".charAt(n%16);
};

ColorUtils.prototype.ArrayShuffle=function() {
	  var d,
	  c,
	  b = this.colorList.length;
	   while (b) {
		c = Math.floor(Math.random() * b);
		d = colorList[--b];
		colorList[b] = colorList[c];
		colorList[c] = d
	   }
	   return colorList;
};
ColorUtils.prototype.randomSet=function(setLength) {				
	//console.log(strColorsJSON);
	var jsonObject = strColorsJSON;
	var colorsSet = [];
	for(var index=0;index<jsonObject.colors.length;index++){
		colorsSet.push(jsonObject.colors[index]);
	}	
	var resultSet=[];				
	//shuffle array 'colorsSet' then select the first 'setLength' items
	ArrayShuffle(colorsSet);
	//console.log("shuffle:"+colorsSet);
	for(var index=0;index<setLength;index++){
		resultSet.push(colorsSet[index]);
	}
	//console.log("resultSet:"+resultSet);
	return resultSet;
};