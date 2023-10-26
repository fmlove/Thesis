//For saving ROIs and measurements from traced (segmented line) dendritic spines

dir = getDirectory("image");
File.makeDirectory(dir + "spines");

roiManager("Measure");

img = getTitle();

num = roiManager("count");
for (i=0; i<num; i++){
	setResult("file", i, img);
}

saveAs("Results", dir + "spines/" + img + "_spines.csv");

//Save ROIs
roiManager("Save", dir + "spines/" + img + "_spines.zip");