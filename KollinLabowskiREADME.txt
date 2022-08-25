This project was created for the first programming assignment for CS 410 (Dr. Vanscoy)
This program was written by Kollin Labowski

Description: This program will take an input file, and will return its contents in a table containing each word, along with the
chapter it appears in, the location of the word, the 5 preceding words, and the 5 following words. It will also return a sorted
version of the previously created table, sorted first alphabetically by the first column, then numerically by the seconds, and
then numerically by the third.

INSTRUCTIONS FOR RUNNING PROGRAM:

- NOTE: This program was tested and run on the WVU loud virtual machine, which runs Ubuntu 20.04.1 LTS

- First make sure that flex is installed in your Ubuntu instance by running the below command:

$ sudo apt-get install flex

- The program can be run by executing the bash script runA1.sh, as seen below:

$ ./runA1.sh

- This program will generate the csv (index01.csv and indexsorted.csv) files using the input in KollinLabowskitext
