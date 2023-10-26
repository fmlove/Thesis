//create dialog and get options for processing
dir = getDirectory("Choose a Directory");
file_list = getFileList(dir);

output = newArray("stacks", "hyperstacks");
Dialog.create("Output type");
Dialog.addRadioButtonGroup("Output", output, 2, 1, "stacks");
Dialog.show();

out = Dialog.getRadioButton();


//filter to TIFs only
files = newArray(0);
for(i=0; i<file_list.length; i++){
	if(endsWith(file_list[i], ".tif")){
		files = Array.concat(files, file_list[i]);
	}
}

File.makeDirectory(dir + out + "/");


//configurable

Dialog.create("Setup");
Dialog.addMessage("Please enter the format of your file names between '.lif' and '.tif'.\nThe keywords 'condition', 'cell', 'slice', and 'channel'\nstand in for the corresponding values.");
Dialog.addString("Format", "_condition_cell_slice_channel", 50);
Dialog.addCheckbox("No .lif prefix", false);
Dialog.show();

structure = Dialog.getString();
no_pref = Dialog.getCheckbox();

//structure = "_condition_cell_slice_channel"
regex_start = ".*\\.lif"
regex_condition = "[A-Za-z0-9\\-]+"
regex_cell = "[A-Za-z0-9\\-\\.\\_]+"
regex_slice = "[zt][0-9]+"
regex_channel = "ch[0-9]+"
regex_end = "\\.tif"

if(no_pref == true){
	regex_start = "^";
}

regex_structure = structure_to_regex(structure, regex_condition, regex_cell, regex_slice, regex_channel);
regex_structure = regex_start + regex_structure + regex_end;



//pull conditions
if(indexOf(structure, "condition") != -1){
	pre_regex = structure_to_regex(substring(structure, 0, indexOf(structure, "condition")), regex_condition, regex_cell, regex_slice, regex_channel);
	pre_regex = regex_start + pre_regex;
	post_regex = structure_to_regex(substring(structure, indexOf(structure, "condition") + 9), regex_condition, regex_cell, regex_slice, regex_channel);
	post_regex = post_regex + regex_end;
	
	List.clear();
	
	for(i=0; i<files.length; i++){
		cond = replace(files[i], pre_regex, "");
		cond = replace(cond, post_regex, "");
		
		if(List.get(cond) == ""){
			List.set(cond, cond);
		}
	}
	
	List.toArrays(cond_keys, cond_values);
}
else{
	cond_values = newArray("");
}



//pull cells
if(indexOf(structure, "cell") != -1){
	pre_regex = structure_to_regex(substring(structure, 0, indexOf(structure, "cell")), regex_condition, regex_cell, regex_slice, regex_channel);
	pre_regex = regex_start + pre_regex;
	post_regex = structure_to_regex(substring(structure, indexOf(structure, "cell") + 4), regex_condition, regex_cell, regex_slice, regex_channel);
	post_regex = post_regex + regex_end;
	
	List.clear();
	
	for(i=0; i<files.length; i++){
		cells = replace(files[i], pre_regex, "");
		cells = replace(cells, post_regex, "");
		
		if(List.get(cells) == ""){
			List.set(cells, cells);
		}
	}
	
	List.toArrays(cells_keys, cells_values);
}
else{
	cells_values = newArray("");
}




//pull channels
if(indexOf(structure, "channel") != -1){
	pre_regex = structure_to_regex(substring(structure, 0, indexOf(structure, "channel")), regex_condition, regex_cell, regex_slice, regex_channel);
	pre_regex = regex_start + pre_regex;
	post_regex = structure_to_regex(substring(structure, indexOf(structure, "channel") + 7), regex_condition, regex_cell, regex_slice, regex_channel);
	post_regex = post_regex + regex_end;
	
	List.clear();
	
	for(i=0; i<files.length; i++){
		chan = replace(files[i], pre_regex, "");
		chan = replace(chan, post_regex, "");
		
		if(List.get(chan) == ""){
			List.set(chan, chan);
		}
	}
	
	List.toArrays(chan_keys, chan_values);
}
else{
	chan_values = newArray("");
}

Array.print(cond_values);
Array.print(cells_values);
Array.print(chan_values);


//possible combinations
for(i=0; i<cond_values.length; i++){
	condition = cond_values[i];
	for(j=0; j<cells_values.length; j++){
		cell = cells_values[j];
		for(k=0; k<chan_values.length; k++){
			channel = chan_values[k];

			regex = replace(structure, "condition", condition);
			regex = replace(regex, "cell", cell);
			regex = replace(regex, "slice", regex_slice);
			if(out == "stacks"){
				regex = replace(regex, "channel", channel);
			}
			if(out == "hyperstacks"){
				regex = replace(regex, "channel", "");
				regex = regex_start + regex;
			}			
			print("regex - " + regex);
			print(i + ", " + j + ", " + k);
			
			//check for matching file
			matching_files = Array.filter(files, "(" + regex + ")");
			print("matches - " + matching_files.length);
			if(matching_files.length > 0){
				if(out == "stacks"){
					setBatchMode(true);
				//open stack and generate title
					//run("Image Sequence...", "dir=" + dir + " filter=(" + regex + ") sort");
					File.openSequence(dir, " filter=(" + regex +")");
					title = condition + "_" + cell + "_" + channel + ".tif";
					saveAs("Tiff", dir + "stacks/" + title);
				}
				if(out == "hyperstacks"){
					setBatchMode(false);//concatenate function not working in batch mode
					param_string = "";
					for (l = 0; l < matching_files.length; l++) {
						open(dir + matching_files[l]);
						image_number = l + 1;
						param_string = param_string + "image" + image_number + " ";
					}
					//get number of slices from first open stack
					selectWindow(matching_files[0]);
					getDimensions(width, height, channels, slices, frames);
					total_slices = slices;
					if(matching_files.length > 1){//need at least two for hyperstack, otherwise leave as-is
						run("Concatenate...", param_string);
						run("Stack to Hyperstack...", "order=xyzct channels="+ matching_files.length +" slices="+ total_slices +" frames=1 display=Color");
					}
					title = condition + "_" + cell + ".tif";
					saveAs("Tiff", dir + "hyperstacks/" + title);
				}
				
			}			
			
			run("Close All");
		}
	}
}

function structure_to_regex(str, cond_r, cell_r, slice_r, chan_r){
	str = replace(str, "condition", cond_r);
	str = replace(str, "cell", cell_r);
	str = replace(str, "slice", slice_r);
	str = replace(str, "channel", chan_r);
	return str;
}

//TODO - fix looping if regex not matched