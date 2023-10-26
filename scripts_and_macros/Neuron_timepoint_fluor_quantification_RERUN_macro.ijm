//select hyperstacks directory
stacks_dir = getDirectory("Choose the directory containing stack files");
stacks_list =  getFileList(stacks_dir);

//select ROIs directory
ROIs_dir = getDirectory("Choose the directory containing ROI ZIP files");
ROIs_list = getFileList(ROIs_dir);

//select output directory
out_dir = getDirectory("Choose location to save results");

//---match names, report number of matches-----
//technically unnecessary, remove this block if running slowly

//_ROIs.zip added to end of stack name, including .tif
matches_count = 0;
st_matches = newArray();
for (i = 0; i < stacks_list.length; i++) {
	st = stacks_list[i];
	st_roi = Array.filter(ROIs_list, st + "_ROIs.zip");
	if (st_roi.length > 0){
		matches_count++;
		st_matches = Array.concat(st_matches, st);
	}
}

Dialog.createNonBlocking("Press OK to continue");
Dialog.addMessage("There are " + matches_count + " stacks with available ROI files.  Do you want to continue?");
Dialog.show();
//-----



//pick projection type, channel to measure
proj_options = newArray("Sum Slices", "Max Intensity", "Average Intensity");

Dialog.createNonBlocking("Settings");
Dialog.addNumber("Channel to measure", 1, 0, 3, "");
Dialog.addRadioButtonGroup("Projection type", proj_options, 1, 2, "Sum Slices");
Dialog.addString("Output file suffix", "_new");
Dialog.show();

ch = Dialog.getNumber();
proj = Dialog.getRadioButton();
suffix = Dialog.getString();

ch = parseInt(ch);

//***BATCH***
setBatchMode(false);//runs into issues with results table not clearing if run in batch mode, for no apparent reason
for (i = 0; i < st_matches.length; i++) {
	st = st_matches[i];
	//open hyperstack, create projection
	open(stacks_dir + st);
	run("Z Project...", "projection=[" + proj + "]");//should stay selected
	//open ROIs
	roiManager("Open", ROIs_dir + st + "_ROIs.zip");
	//loop through and move all ROIs to measurement channel
	for (j = 0; j < roiManager("count"); j++) {
		roiManager("Select", j);
		RoiManager.setPosition(ch);
	}
	//measure, save results
	run("Set Measurements...", "area mean standard modal min integrated median display redirect=None decimal=3");
	roiManager("Deselect");//make sure everything is measured
	roiManager("Measure");
	saveAs("Results", out_dir + st + suffix + "_Results.csv");
	
	close("*");//image windows
	close("Roi Manager");
	close("Results");//BUG - ending up with wrong ROI matches, multiple results copies in some
}
//***********


