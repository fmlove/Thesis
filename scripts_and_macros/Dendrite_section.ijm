setBatchMode(false);//interactive

function main(){
	//---duplicate image, close original, and make all changes on duplicate---
	rename("orig");
	run("Duplicate...", "title=["+getInfo("image.filename")+"_duplicate] duplicate");
	close("orig");
		
	//---resize to avoid cutting off edges during rotation step---
	getDimensions(width, height, channels, slices, frames);
	diagonal = Math.ceil(sqrt(width*width + height*height)); //not sure what ^2 is doing but it's definitely not squared
	run("Canvas Size...", "width=" + diagonal + " height=" + diagonal + " position=Center zero");
		
	//---establish scale and desired length to measure---
	Dialog.createNonBlocking("Select dendrite segment");
	Dialog.addNumber("Scale (pixels/micron)", 6.25);
	Dialog.addNumber("Segment length (microns)", 20);
	Dialog.addNumber("Width for cropping (pixels)", 120);
	Dialog.addMessage("Please use the straight line tool to select a segment of dendrite, then click 'OK'.");
	Dialog.show();
	scale = Dialog.getNumber();
	segment = Dialog.getNumber();
	cropwidth = Dialog.getNumber();
	
	run("Set Scale...", "distance=" + scale + " known=1 unit=μm");
	//still operates in pixels - adjust to pixel length for setting newX/newY
	pixLength = scale*segment;
	
	getSelectionCoordinates(X,Y);//missing ; here?
	Angle = getValue("Angle");
	Length = getValue("Length");
	rAngle = Angle * PI/180;
		
	//---create new line from same starting point to desired length---
	newX = Math.ceil(X[0] + pixLength*cos(rAngle));
	newY = Math.ceil(Y[0] - pixLength*sin(rAngle));
	
	makeLine(X[0], Y[0], newX, newY);
		
	//---confirm new line before cropping---
	Dialog.createNonBlocking("Confirm dendrite segment");
	Dialog.addMessage("Click 'OK' to confirm segment.");
	Dialog.show();
		
	//---rotate and crop image---
	//image
	run("Rotate... ", "angle=" + Math.round(Angle) + " grid=1 interpolation=Bilinear");
	//ROI
	run("Rotate...", "rotate angle=" + Math.round(Angle));
	
	getSelectionCoordinates(rX, rY);
	makeRotatedRectangle(rX[0], rY[0], rX[1], rY[1], cropwidth);
	run("Crop");
}

//---batch runner---
Dialog.create("Batch selection");
Dialog.addCheckbox("Run as batch?", true);
Dialog.show();
batch = Dialog.getCheckbox();

if(batch){
	//TODO - directory selection and iteration
	//main();//placeholder
	dir = getDirectory("Choose a Directory");
	File.makeDirectory(dir + "dendrite_sections");
	
	files = getFileList(dir);
	//exclude directories
	temp = newArray(0);
	for(i = 0; i < files.length; i++){
		if(!endsWith(files[i], "/")&&!endsWith(toLowerCase(files[i]), ".ini")){
			temp = Array.concat(temp,files[i]);
		}
	}
	files = temp;
	print(files.length);
	print(files[0]);
		
	for(i = 0; i < files.length; i++){
		open(dir + files[i]);
		print(getTitle());
		main();
		saveAs("Tiff", dir + "dendrite_sections/" + files[i] + "_DENDRITE.tif");
		close("*");
	}
}
else{
	main();
}
