//open image manually for now

dir = getInfo("image.directory");//directory of image - for saving results
File.makeDirectory(dir + "fluorescence_quantification");
initial_name = getInfo("image.title");

getDimensions(width, height, channels, slices, frames);
channel_options = Array.getSequence(channels + 1);
channel_options = Array.deleteIndex(channel_options, 0);//remove 0 index - readjust after selection
proj_options = newArray("Sum Slices", "Max Intensity");
image_options = newArray("whole cell", "cell body", "growth cone");

Dialog.createNonBlocking("Settings");
Dialog.addChoice("Channel to measure", channel_options);//minor bug - adding .0 to end of each
Dialog.addRadioButtonGroup("Projection type", proj_options, 1, 2, "Sum Slices");
Dialog.addRadioButtonGroup("Image type", image_options, 3, 1, "whole cell");
Dialog.show();

ch = Dialog.getChoice();
proj = Dialog.getRadioButton();
type = Dialog.getRadioButton();

ch = parseInt(ch);//ROI manager handles channels as 1-indexed

run("Z Project...", "projection=["+ proj +"]");

run("ROI Manager...");
roiManager("Show None");

if(type == "cell body" || type == "whole cell"){
	setTool("polygon");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace cell body, then click 'okay'.");
	Dialog.show();
	roiManager("Add");
	roiManager("Select", 0);
	roiManager("Rename", "cell body");

	roiManager("Deselect");
	setTool("polygon");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace nucleus, then click 'okay'.");
	Dialog.show();
	roiManager("Add");
	roiManager("Select", 1);
	roiManager("Rename", "nucleus");

	//create cytoplasm ROI
	roiManager("Select", newArray(0,1));
	roiManager("AND");
	roiManager("Add");
	roiManager("Select", 2);
	roiManager("Rename", "t1");
	
	roiManager("Select", newArray(0,2));
	roiManager("XOR");
	roiManager("Add");
	roiManager("Select", 3);
	roiManager("Rename", "cytoplasm");

	roiManager("Select", 2);
	roiManager("Delete");
	//---

	//duplicate and shift each for background measurement
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace a dendrite, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 3);
	roiManager("Rename", "dendrite 1");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 4);
	roiManager("Rename", "dendrite 1 background");
	roiManager("translate", 10, 10);
	
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace another dendrite, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 5);
	roiManager("Rename", "dendrite 2");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 6);
	roiManager("Rename", "dendrite 2 background");
	roiManager("translate", 10, 10);
	
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace another dendrite, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 7);
	roiManager("Rename", "dendrite 3");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 8);
	roiManager("Rename", "dendrite 3 background");
	roiManager("translate", 10, 10);
	
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace the axon initial segment, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 9);
	roiManager("Rename", "AIS");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 10);
	roiManager("Rename", "AIS background");
	roiManager("translate", 10, 10);
}
if(type == "whole cell"){
	roiManager("Deselect");
	setTool("polyline");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace the full axon, then click 'okay'.");
	Dialog.show();

	roiManager("Add");
	roiManager("Select", 11);
	roiManager("Rename", "axon");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", 12);
	roiManager("Rename", "axon background");
	roiManager("translate", 10, 10);
}
if(type == "growth cone" || type == "whole cell"){
	//check number of ROIs first
	roi_count = roiManager("count");

	roiManager("Deselect");
	setTool("polygon");
	Dialog.createNonBlocking("Select");
	Dialog.addMessage("Trace growth cone, then click 'okay'.");
	Dialog.show();
	
	roiManager("Add");
	roiManager("Select", roi_count);//zero indexed, but count from 1
	roiManager("Rename", "growth cone");
	roiManager("Deselect");
	run("Restore Selection");
	roiManager("Add");
	roiManager("Select", roi_count + 1);
	roiManager("Rename", "growth cone background");
	roiManager("translate", 10, 10);
}

//loop through and move all ROIs to measurement channel
for (i = 0; i < roiManager("count"); i++) {
	roiManager("Select", i);
	RoiManager.setPosition(ch);
}

roiManager("show all with labels");
Dialog.createNonBlocking("Adjustments");
Dialog.addMessage("Adjust background ROIs as necessary, then click 'okay'");
Dialog.show();

//-----MEASUREMENT-----
run("Set Measurements...", "area mean standard modal min integrated median display redirect=None decimal=3");
roiManager("Deselect");//make sure everything is measured, not just last one adjusted
roiManager("Measure");

//TODO - save ROIs and results table
Dialog.createNonBlocking("Save");
Dialog.addMessage("Click 'okay' to save ROIs and results and close windows.");
Dialog.show();

//ROIs
roiManager("Save", dir + "fluorescence_quantification/" + initial_name + "_ROIs.zip");
//results
saveAs("Results", dir + "fluorescence_quantification/" + initial_name + "_Results.csv");

close("*");//image windows
close("Roi Manager");
close("Results");
