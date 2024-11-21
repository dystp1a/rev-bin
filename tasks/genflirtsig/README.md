# fullspeed
Given a stripped binary, in order to retreive the library functions we generate flirt signatures<br>
In this process the pat file is generated using by running the idb2pat.py in ida(alt+f7).<br>
 this pat file is converted to sig file by using sigmake tool ```sigmake <input_file.pat> <output_file.sig>``` <br>
In order to resolve collisions, remove the the first four lines of the .exc file(made in the first sigmake) and run the sigmake again.
<br>
Load this sig file in ida and the lib functions become visible<br>
Get a code with enough library functions as possible and compile it in native aot mode and open it in ida. <br>
Generate the pat file followed by the corresponding sig file and move the latter to sig/pc of ida folder. 
