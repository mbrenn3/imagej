# ImageJ multi-position intensity reader

1. first install the [Metamorph nd & ROI files importer](http://imagejdocu.tudor.lu/doku.php?id=plugin:inputoutput:nd_stacks_builder:start) to ImageJ if you haven't already.

1. Run the stack builder macro (stack-builder.ijm) selecting the calibration and expiriment nd files. ( You may have to change *.TIF to *tif on some Unix systems)
    
     $ for old in *.TIF; do mv $old `basename $old .TIF`.tif; done

1. Choose the main folder with all your images and .nd files as the 'Experiment Directory'. The macro will then rename this folder as RAW-MDA and make a folder around it with the original foldername.

1. Choose the nd files corresponding to your calibration points and finally your experimental timecourse.

1. The macro will make stacks of all the positions and organize them into folders. Then it will measure the intensities in one huge table.

1. Save the table and use makecolumns.m to reshape the data into positions.