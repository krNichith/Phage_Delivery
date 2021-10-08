1.	About The Project
Phage therapy, the treatment of chronic bacterial infections by viruses that kill bacteria, has shown promise in combating antimicrobial resistance (AMR). We find that C. gingivalis forms tunnels within the prey biofilm. When phages are actively delivered, curli fiber containing E. coli biofilms are no longer protected against phage infection. Our results demonstrate that active delivery of the predator by a self-propelled swarm might improve the pharmacokinetics of phage therapy. This can lead to the development of a tool to combat chronic AMR biofilms. 
  Built with: Python3




2.	Getting started
These codes are developed and tested on Linux and Mac operating systems.

Dependencies: 
              OpenCV – v4.4.0.46
              PIMS – v0.5
              Scikitimage – v0.16.2
              Trackpy – v0.4.2
              Numpy – v1.16.4
              Pandas – v1.0.5
              Matplotlib – v3.2.2
              Distfit 
              Imagecodecs – v2021.6.8
              Mayavi – v4.7.2
              Tvtk-visualiser – v1.0.2
              Pyqt5 – v5.10.1
              Distfit – v1.4.0 
              Seaborn – v0.11.0 
               



3.	Usage 
Before running the codes make sure you have installed all the dependencies and have all the codes, and their input files are in the same folder.

Codes for Speed and MSD calculation
The code step1.m converts an .xml file containing track coordinates into a MATLAB cell from which all the tracks less than 18 rows are filtered out manually. The filtered cell is then used as the input for the code P1.m which calculates the speed at which phage particles are been transported by Capnocytophaga gingivalis. The mean speed of each track in a movie, mu2 is then saved as a .csv file and is used as an input for P1fig.ipynb. The code P1.ipynb requires a .csv file containing the X-Y coordinates and the time intervals of each phage particle in order to calculate the MSD. 

Codes for Diffusion Simulation
The code P2.m simulates the diffusion of a phage particle and calculates the time and maximum distance a particle can diffuse in a given environment.

Codes for Advection Simulation
The code P3.m simulates phage particles moving on a surface when there is an external force other than diffusion acting upon them. 

Codes for Area Calculation
              The code P4.ipynb calculates the total area of particles present in each frame of a 
              movie. This code requires a .avi movie as an input and the supplementary movie S7 
              from the paper can be used as an example data to run this code. The total area of 
              each frame can be exported as a .csv file and use this as an input for code 
              P4fig.pynb.

Codes for 3d Reconstruction
The code P5.ipynb takes a .avi file containing the Z – stacks and outputs a 3d reconstruct of the Z – stack. The code P5fig.ipynb uses the P5fig.csv as an input file and gives the plot for phage concentration across the Z-axis of the biofilm.

Codes for Phage Diffusion and MSD
The code P6.ipynb takes in an .avi file and calculates the mean speed at which a phage particle is diffusing on an agar surface and calculates it’s MSD. The supplementary movie S4 can be used as an example file to run this code.

