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
File.makeDirectory(direxperiment+'collected-stacks/zero');
pathzero = direxperiment+'collected-stacks/zero/'
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathzero]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathzero]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathzero]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathzero]");
File.makeDirectory(direxperiment+'collected-stacks/one');
pathone = direxperiment+'collected-stacks/one/'
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathone]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathone]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathone]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathone]");
File.makeDirectory(direxperiment+'collected-stacks/seven');
pathseven = direxperiment+'collected-stacks/seven/'
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathseven]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathseven]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathseven]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathseven]");
File.makeDirectory(direxperiment+'collected-stacks/fifteen');
pathfifteen = direxperiment+'collected-stacks/fifteen/'
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathfifteen]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathfifteen]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathfifteen]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathfifteen]");
File.makeDirectory(direxperiment+'collected-stacks/twentyone');
pathtwentyone = direxperiment+'collected-stacks/twentyone/'
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathtwentyone]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathtwentyone]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathtwentyone]");
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathtwentyone]");
File.makeDirectory(direxperiment+'collected-stacks/exp');
pathexp = direxperiment+'collected-stacks/exp/'
run("Metamorph nd file (stack builder)", "select= all_timepoints all_positions open=[pathexp]");

File.makeDirectory(direxperiment+'collected-stacks/concatenated-stacks');
pathcat = direxperiment+'collected-stacks/concatenated-stacks/'

listzero = getFileList(pathzero)
listone = getFileList(pathone)
listseven = getFileList(pathseven)
listfifteen = getFileList(pathfifteen)
listtwentyone = getFileList(pathtwentyone)
listexp = getFileList(pathexp)

for(j=0; j<listexp.length; j++){
     open(pathzero+listzero[j]);
     open(pathone+listone[j]);
     open(pathseven+listseven[j]);
     open(pathfifteen+listfifteen[j]);
     open(pathtwentyone+listtwentyone[j]);
     open(pathexp+listexp[j]);
     run("Concatenate...", "all_open title=temp-stack");
     saveAs("Tiff", pathcat+"well"+j+1);
     //run("Close All");
     File.makeDirectory(pathcat+"well"+j+1);
     pathsaveseq = pathcat+"well"+j+1+"/";
     run("Image Sequence... ", "format=TIFF name=sequence start=0 digits=4 save=pathsaveseq");
     input =pathsaveseq;
     listseq= getFileList(pathsaveseq);
     print(listseq.length);
     run("Close All");
     for (k = 0; k < listseq.length; k++) {
          action(input, listseq[k]);
          function action(input, filename) {
          open(input + filename);
          //makeRectangle(473, 155, 106, 110);
          run("Measure");
          close();
          }
     }
      //saveAs("Results", pathcat+"well"+j+1+".csv");
      //run("Clear Results");
      run("Close All");
}
