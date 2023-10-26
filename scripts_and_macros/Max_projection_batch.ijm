setBatchMode(true);

//create dialog and get options for processing
dir = getDirectory("Choose a Directory");
File.makeDirectory(dir + "max_projections");

Dialog.create("Options");
Dialog.addChoice("File extension", newArray("stk", "tif"), "stk");
Dialog.show()

ext = "." + Dialog.getChoice();

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
	open(dir + stacks[i]);

	rename("orig");//original file
	run("Z Project...", "projection=[Max Intensity]");
	close("orig");

	saveAs("Tiff", dir + "max_projections/" + stacks[i] + "_MAX.tif");
}
