setBatchMode(false);

//open images manually - should be multi channel max projection
dir = getInfo("image.directory");//directory of image - for saving results
File.makeDirectory(dir + "intensity_profiles");
initial_name = getInfo("image.title");

getDimensions(width, height, channels, slices, frames);
print("ch = " + channels + " s = " + slices + " f = " + frames);


//draw ROI line/polyline
roiManager("add");


for (i = 1; i < channels + 1; i++) {
	Stack.setChannel(i);
	print(i);
	profile = getProfile();
  	for (j=0; j<profile.length; j++)
      setResult("Value_ch" + i, j, profile[j]);
	updateResults;
}

//export CSV and ROI
saveAs("Results", dir + "intensity_profiles/" + initial_name + "_profile.csv");
roiManager("save selected", dir + "intensity_profiles/" + initial_name + ".roi")