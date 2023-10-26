setBatchMode(false);//not all macros/plugins used work in batch mode

//create dialog and get options for processing
dir = getDirectory("Choose a Directory");
File.makeDirectory(dir + "kymographs");

Dialog.create("Options");
Dialog.addChoice("File extension", newArray("stk", "tif"), "stk");
Dialog.addString("Experiment prefix", "");
Dialog.addChoice("ROI format", newArray("roi", "rgn"), "roi");
Dialog.addNumber("Line width", 5);
Dialog.addCheckbox("Brightness/contrast adjustment?", true);
Dialog.addCheckbox("Background subtraction?", false);
Dialog.addNumber("Rolling ball radius", 20.0);
Dialog.addMessage("\n");
Dialog.addCheckbox("Bleach correction?", true);
Dialog.addMessage("This will increase processing \ntime by roughly 30 mintues per \nstack, but will produce much \ncleaner kymographs");
Dialog.show()

ext = "." + Dialog.getChoice();
pref = Dialog.getString();
roi = "." + Dialog.getChoice();
lwd = Dialog.getNumber();
bc = Dialog.getCheckbox();
bgsubtract = Dialog.getCheckbox();
bgradius = Dialog.getNumber();
bleach = Dialog.getCheckbox();

files = getFileList(dir);
stacks = newArray(0);

print(ext);
print(files.length);

//select stacks for processing
for(i = 0; i < files.length; i++){
	if(endsWith(toLowerCase(files[i]), ext)){
		stacks = Array.concat(stacks,files[i]);
	}
}

print(stacks.length);


for(i = 0; i < stacks.length; i++){
	showProgress(i, stacks.length);

	//check for matching ROI before starting
	roi_name = replace(replace(replace(stacks[i], pref, ""), ext, roi), "_W\\d+( .{2})?_T", "");
	print(stacks[i]);
	print(roi_name);

	if(File.exists(dir + roi_name)){
		
		open(dir + stacks[i]);
		
		//create duplicate for processing, no edits on original stack file
		rename("orig");
		run("Duplicate...", "title=["+stacks[i]+"_duplicate] duplicate");
		close("orig");
	
		//bleach correction
		if(bleach == true){
			run("Bleach Correction", "correction=[Histogram Matching]");
			rename(stacks[i]+"_duplicate");//renaming new corrected file to match 'original' duplicate
			close("duplicate");//closing 'original' duplicate
		}
	
		//select and open ROI file for kymograph
		
		if(roi == ".rgn"){
			run("Metamorph ROI", "open=[" + dir + roi_name + "]" );
		}
		else{
			roiManager("open", dir + roi_name);
		}
	
		
		if(roiManager("count") == 1){//TODO - handle multiple ROIs
	
			createKymograph(lwd, 0);
	
			//background subtraction
			if(bgsubtract == true){
				run("Subtract Background...", "rolling=" + bgradius + " light");//TODO - adjust for optional inversion
			}
	
			//contrast adjustment
			if(bc == true){
				autoBC();
			}
			//file saving
			selectWindow("Kymograph");
			save(dir + "kymographs/" + stacks[i] + "_kymograph.tif");
		}
		roiManager("reset");

	}
	
	run("Close All");
}


function createKymograph(lwd, roiNo){
	
	//run("KymographBuilder", "input=" + stacks[i]+"_duplicate");
		//broken with new imageJ update
		
	roiManager("select", roiNo);
	run("Multi Kymograph", "linewidth=" + lwd);
	selectWindow("Kymograph");
	
	rename("Kymograph");//ensure that window name is consistent - might change with plugin updates
	
	run("Invert");//TODO - make optional
	
	/*KymographBuilder sometimes adds a line of saturated pixels to the far right, 
	which throws off contrast adjustment.  Cropping to avoid*/
	/*getDimensions(w, h, c, s, f);
	makeRectangle(0, 0, w-1, h);
	run("Crop");
	*/
	setOption("ScaleConversions", true);
	run("16-bit");//"Apply LUT" in autoBC doesn't work on 32 bit produced by MultipleKymograph
}

function autoBC(){//from Kota Miura and Damien Guimond http://imagej.1557.x6.nabble.com/Auto-Brightness-Contrast-and-setMinAndMax-td4968628.html
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
