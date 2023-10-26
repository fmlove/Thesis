setBatchMode(false);//interactive

function main(i){
	//---duplicate fist frame of stack, close original, and make all changes on duplicate---
	rename("orig");
	run("Duplicate...", "title=["+getInfo("image.filename")+"_duplicate] duplicate range=1-1");
	close("orig");
	rename("duplicate");//for closing later and to obscure file name for blind analysis

	//---load and measure ROI, draw transparent over image---
	//loaded in batch runner
	//run("ROI Manager...");
	roiManager("select", 0);
	run("Measure");
	ROI_length = getResult("Length", 0);
	roiManager("Show All");

	//---multipoint tool, dialog to confirm---
	close("Results");
	setTool("multipoint");
		
	Dialog.createNonBlocking("Confirm points");
	Dialog.addMessage("Click 'OK' to confirm points.");
	//TODO - option to skip/exclude?
	Dialog.show();
	
	run("Measure");//will count 1 if no points added - defaults to last active ROI
	//check if any points have been added
	if(selectionType() == -1){//no points added
		count = 0;
	}
	else{
		count = getValue("results.count");
	}
	
	
	//---write filename, point count, ROI length to Table---
	selectWindow("Puncta counts");//TODO pass as parameter
	Table.set("File", i, stacks[i]);
	Table.set("ROI_length", i, ROI_length);
	Table.set("Count", i, count);
	Table.update();
	
	//---close image and extra windows
	close("duplicate");//not working
	//tables handled in batch runner
}





//---batch runner---
dir = getDirectory("Choose a Directory");
File.makeDirectory(dir + "puncta_counts");

Dialog.create("Options");
Dialog.addChoice("File extension", newArray("stk", "tif"), "stk");
Dialog.show();
ext = Dialog.getChoice();

files = getFileList(dir);
//exclude directories
temp_stacks = newArray(0);
temp_ROIs = newArray(0);
for(i = 0; i < files.length; i++){
	if(!endsWith(files[i], "/")&&!endsWith(toLowerCase(files[i]), ".ini")){
		if(endsWith(toLowerCase(files[i]), ".stk")||endsWith(toLowerCase(files[i]), ".tif")){
			temp_stacks = Array.concat(temp_stacks,files[i]);
		}
		//if(endsWith(toLowerCase(files[i]), ".roi")){
		//	temp_ROIs = Array.concat(temp_ROIs,files[i]);
		//}
	}
}
stacks = temp_stacks;
//rois = temp_ROIs//unnecessary?
shuffle(stacks);//random order to reduce bias

//create custom results table
Table.create("Puncta counts");
Table.setColumn("File", newArray(0));
Table.setColumn("ROI_length", newArray(0));
Table.setColumn("Count", newArray(0));
	
for(i = 0; i < stacks.length; i++){
	open(dir + stacks[i]);
	
	//find and open matching ROI
	if(ext == "stk") {roi_name = replace(replace(stacks[i], ext, "roi"), "_W\\d+_T", "");}
	else {roi_name = replace(replace(stacks[i], ext, "roi"), "_ch\\d+.*(?=\\.roi$)", "");}

	roiManager("open", dir + roi_name);
	roiManager("Select", 0);
	roiManager("Rename", "axon");//obscure name for impartiality while tracing

	main(i);
	//Close results, images, etc.//close("*");
	saveAs("Results", dir + "puncta_counts/" + stacks[i] + "_puncta.csv");
	roiManager("reset");	
	run("Clear Results");
}

//save table
selectWindow("Puncta counts");
Table.save(dir + "puncta_counts/counts.csv");

//-------------------------------
//Fisher Yates shuffle, from ImageJ example macro RandomizeArray.txt
function shuffle(array) {
   n = array.length;  // The number of items left to shuffle (loop invariant).
   while (n > 1) {
      k = randomInt(n);     // 0 <= k < n.
      n--;                  // n is now the last pertinent index;
      temp = array[n];  // swap array[n] with array[k] (does nothing if k==n).
      array[n] = array[k];
      array[k] = temp;
   }
}

// returns a random number, 0 <= k < n
function randomInt(n) {
   return n * random();
}