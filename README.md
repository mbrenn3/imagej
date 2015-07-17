# imagej
importing metamorph MDA images and taking intensities

Steps:

1. Run the stack builder macro (stack-builder.txt) selecting the calibration and expiriment nd files.
* may have to change *.TIF to *tif 
	$ for old in *.TIF; do mv $old `basename $old .TIF`.tif; done


2. Rename all well1 to well01, well2 to well02 etc.

3. copy into exp and ss folders

4. Run measure macro (measure.txt)

5. save Results.xls, open it and delete the header, save as Results.csv

6. run stern volmer analysis. (may have to adjust where the calibration averages are taken from)
