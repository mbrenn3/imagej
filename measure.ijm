dir= getDirectory("Choose a Directory");
pathzero = dir+'zero/'
pathone = dir+'one/'
// File.makeDirectory('concatenated-stacks')
pathcat = dir+'concatenated-stacks/'
//print(pathexp)

listzero = getFileList(pathzero)
listone = getFileList(pathone)

for(j=0; j<listexp.length; j++){
     open(pathzero+listzero[j]);
     open(pathone+listone[j]);
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
