setBatchMode("false");

//get open images
img = getList("image.titles");
img_arr = Array.concat(img, "none");

//set channels for merge - clean this up?
Dialog.create("Options");
Dialog.addMessage("Select channels");
Dialog.addChoice("Red", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Green", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Blue", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Gray", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Cyan", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Magenta", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addChoice("Yellow", img_arr, "none");
Dialog.addToSameRow();
Dialog.addString("", "");
Dialog.addCheckbox("Adjust brightness/contrast?", false);
Dialog.addCheckbox("Label images?", true);
Dialog.addString("Font size", 55);
Dialog.addCheckbox("Scalebar?", true);
Dialog.addString("Size", 20);//TODO - units
Dialog.addString("Final scale", 0.5);//TODO - number field?
Dialog.addCheckbox("Pause to annotate?", false);
Dialog.show();

c1 = Dialog.getChoice();
c1_label = Dialog.getString();
c2 = Dialog.getChoice();
c2_label = Dialog.getString();
c3 = Dialog.getChoice();
c3_label = Dialog.getString();
c4 = Dialog.getChoice();
c4_label = Dialog.getString();
c5 = Dialog.getChoice();
c5_label = Dialog.getString();
c6 = Dialog.getChoice();
c6_label = Dialog.getString();
c7 = Dialog.getChoice();
c7_label = Dialog.getString();
BC = Dialog.getCheckbox();
to_label = Dialog.getCheckbox();
label_size = Dialog.getString();
scalebar = Dialog.getCheckbox();
scalebar_size = Dialog.getString();
scale = Dialog.getString();
annotation_pause = Dialog.getCheckbox();

if (BC == true){
	for (i = 0; i < img.length; i++) {
		selectWindow(img[i]);
		autoBC();
	}
}



channelString = "";
if (c1 != "none"){ channelString = channelString + "c1=" + c1 + " "; }
if (c2 != "none"){ channelString = channelString + "c2=" + c2 + " "; }
if (c3 != "none"){ channelString = channelString + "c3=" + c3 + " "; }
if (c4 != "none"){ channelString = channelString + "c4=" + c4 + " "; }
if (c5 != "none"){ channelString = channelString + "c5=" + c5 + " "; }
if (c6 != "none"){ channelString = channelString + "c6=" + c6 + " "; }
if (c7 != "none"){ channelString = channelString + "c7=" + c7 + " "; }

run("Merge Channels...", channelString + "create keep ignore");

//add scalebar if option checked - defaulting to white for now
if(scalebar == true){
	selectWindow("Composite");
	run("Scale Bar...", "width=20 height=18 thickness=" + (5/scale) +" font=14 color=White background=None location=[Lower Left] horizontal hide overlay");
}

run("Flatten");

//label images if option is checked
if(to_label == true){
	setFont("SansSerif", label_size, " antialiased bold");
	buffer = Math.ceil(label_size/10);	
	if (c1 != "none" && c1_label != ""){selectWindow(c1); run("RGB Color"); h = getHeight(); setColor("red"); drawString(c1_label, buffer, h-buffer);}
	if (c2 != "none" && c2_label != ""){selectWindow(c2); run("RGB Color"); h = getHeight(); setColor("green"); drawString(c2_label, buffer, h-buffer);}
	if (c3 != "none" && c3_label != ""){selectWindow(c3); run("RGB Color"); h = getHeight(); setColor("blue"); drawString(c3_label, buffer, h-buffer);}
	if (c4 != "none" && c4_label != ""){selectWindow(c4); run("RGB Color"); h = getHeight(); setColor("gray"); drawString(c4_label, buffer, h-buffer);}
	if (c5 != "none" && c5_label != ""){selectWindow(c5); run("RGB Color"); h = getHeight(); setColor("cyan"); drawString(c5_label, buffer, h-buffer);}
	if (c6 != "none" && c6_label != ""){selectWindow(c6); run("RGB Color"); h = getHeight(); setColor("magenta"); drawString(c6_label, buffer, h-buffer);}
	if (c7 != "none" && c7_label != ""){selectWindow(c7); run("RGB Color"); h = getHeight(); setColor("yellow"); drawString(c7_label, buffer, h-buffer);}
}


run("Images to Stack", "name=Stack title=[] use");
//TODO - make sure order stays consistent - numerical/alphabetical? or by channel?

if(annotation_pause == true){
	Dialog.createNonBlocking("Annotation");
	Dialog.addMessage("Add desired annotations to images, then click \"OK\"");
	Dialog.show();
}

panels = img.length + 1;
run("Make Montage...", "columns=" + panels + " rows=1 scale=" + scale);
saveAs("PNG");//will prompt for name

run("Close All");



/*-------------------------------------------------*/

function autoBC(){
//from Kota Miura and Damien Guimond 
//http://imagej.1557.x6.nabble.com/Auto-Brightness-Contrast-
//and-setMinAndMax-td4968628.html
	AUTO_THRESHOLD = 5000; 
	getRawStatistics(pixcount); 
	limit = pixcount/10; 
	threshold = pixcount/AUTO_THRESHOLD; 
	nBins = 256; 
	getHistogram(values, histA, nBins); 
	i = -1; 
	found = false; 
	do { 
	        counts = histA[++i]; 
	        if (counts > limit) counts = 0; 
	        found = counts > threshold; 
	} while ((!found) && (i < histA.length-1)) 
	hmin = values[i]; 
	i = histA.length; 
	do { 
	        counts = histA[--i]; 
	        if (counts > limit) counts = 0; 
	        found = counts > threshold; 
	} while ((!found) && (i > 0)) 
	hmax = values[i]; 
	setMinAndMax(hmin, hmax); 
	run("Apply LUT"); 
}
