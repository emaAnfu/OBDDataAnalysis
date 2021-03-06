# OBDDataAnalysis
MATLAB project which aim is to analyze data collected from several driving sessions in order to build a classifier able to identify different driving conditions.

This repository contains all the files I used to perform the analysis of the data I collected from several driving sessions. Data are about the speed and the RPM (revolutions per minutes). To collect them I developed the app OBDConnection whose code can be found on my GitHub page (it basically establishes a Bluetooth connection between a smartphone and a car, through an OBD II Bluetooth adapter). 

The analysis goal is to infer some information about the driving conditions of the various driving sessions. In particular, it should tell in what type of road they were taken, e.g. highway, out-of-town, city (in-town). At the beginning, I also wanted to infer who was the driver of each session, but after having written some pre-processing code (contained in the folder OBDDataAnalysis\Old_DriverRecognition) I decided to focus on a simpler problem. 

The MATLAB project is contained in OBDDataAnalysis\project, while all the other folders contains the measured data, divided into sessions. Inside the project folder you can find all the .m files. In particular:

  •	“OrganizeCollectedData.m” contains the code to read the collected data and save them in a first raw dataset, in which each row is a timeseries (of speed and of RPM);

  •	“main.m” contains the code to load this raw dataset and build the actual dataset, with seven variables obtained from the various timeseries;

  •	“ClassificationModel.m” contains the code to classify sessions in highway sessions or out-of-town sessions; I used several classification algorithms (RLS, RLS with offset, KRL, LR, OMP), each of one can be run within a dedicated section; 

  •	“MultiClassClassificationModel.m” contains the code to classify sessions in highway, out-of-town or city sessions; here there two section, one to run one-vs-all RLS and one for one-vs-all KRLS.

All the other files are needed for the various classifiers to work (these are quite all taken from the laboratory sessions of Machine Learning course held at the University of Genoa) or for the feature extraction from the measured data, e.g. to compute acceleration from speed data.
