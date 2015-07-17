////////////////////////////
//Set up directories
///////////////////////////

// Asks for the directory with the Raw MDA data in it and the .md files (the date ex '091514')
direxperiment = getDirectory("Choose the Experiment Directory ");
//print("experiment directory: " + direxperiment);


// Gets the parent path for the directory with the Raw-MDA data
pathmda = File.getParent(direxperiment) + '/raw-mda'
// pathmda = direxperiment + 'raw-mda/'
//print("pathmda: " + pathmda);

// renames the Main directory to raw-mda
File.rename(direxperiment,pathmda);

// makes a directory with the original experiment directory name (the date)
File.makeDirectory(direxperiment);

// moves the raw-mda directory into the experiment directory (the date) 
File.rename(pathmda,direxperiment+'raw-mda');

//////////////////////////////////////////////////////
//Stack builder
//////////////////////////////////////////////////////

// Makes directory for the stacks to go
File.makeDirectory(direxperiment+'collected-stacks');

/////Define paths  for .nd files - optional may change to user input by leaving select blank in stack builder
pathmda = direxperiment+'raw-mda/'
//print("pathmda:" + pathmda);

pathstacks = direxperiment+'collected-stacks'+'/'
//print("pathstacks:" + pathstacks);

// Makes stacks in the stacks folder. You can either enter a path in the the select=, or leave it blank to prompt the user to select the nd files.
// **The macro will quit if the prompt for the nd file is canceled.**
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathstacks]"); //pathss
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathstacks]"); //pathexp

// Makes directory for the stacks to go
File.makeDirectory(direxperiment+'collected-stacks/exp');
// Makes directory for the stacks to go
File.makeDirectory(direxperiment+'collected-stacks/ss');
// Makes directory for the stacks to go
File.makeDirectory(direxperiment+'collected-stacks/concatenated-stacks');
