Table.create("ROI details");

num = roiManager("count");
for (i=0; i<num; i++){
	roiManager("select", i);
	Roi.getCoordinates(xpoints, ypoints);
	base = Table.size;
	for (p=0; p<xpoints.length; p++){
		Table.set("ROI", base + p, i + 1);//1-index for R analysis
		Table.set("X", base + p, xpoints[p]);
		Table.set("Y", base + p, ypoints[p]);
	}
}

print(getTitle());
Table.save(getDirectory("image") + getTitle() + "_traces.csv");

//ADD ROI SAVE