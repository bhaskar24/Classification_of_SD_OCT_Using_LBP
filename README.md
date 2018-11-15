# Classification of SD-OCT using Local Binary Pattern and KNN Classifiers

<img src="icon.png" align="right" />

## Folder Structures

## Preprocessing
NLMVolume.m
Will do NLM on whole volume and write _NLM denoised file in other file.
```
NLM.m----> For NLM of each frame individually
				bound_extension.m----> For extending/mirroring boundary pixels for NLM
				GetPSNR and psdnoise.m----> For calculating PSNR value
```
flattenVolume.m
LBPVolume.m

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
* Parth Shah, Linux Technology Center, IBM Systems Lab, India.
* Tejeshwara B. M., Mercedes-Benz Research & Development India.
* Dr. Jeny Rajan, Assistant Professor, National Institute of Technology Karnataka, Surathkal India.


## Preprocessing: Following Folder contains following directory Struture:
* NLMVolume.m
	*Will do NLM on whole volume and write _NLM denoised file in other file.
	* Required files: 
		* NLM.m
			> For NLM of each frame individually
		* bound_extension.m
			> For extending/mirroring boundary pixels for NLM
		* GetPSNR and psdnoise.m
			> For calculating PSNR value
				
* flattenVolume.m
---------------Will do image flattening and Alignement of  each frames in whole volume and write _FA in other file.
		Required files: flatten.m----> For flattening and aligning of each frames
				ployRegression.m----> For polynomial regression of degree 2 for smooth curve.
				oct_align.m----> For cropping of only neceesary portion.

## Local Binary Pattern:
* LBPVolume.m
---------------Will extract features and labels from each frames individually and gives labels to each frame from grader.mat file.
		Required files: LBPFrame.m----> LBP of each individual frames.
				efficientLBP.m----> For calculting LBP in (8,1) mode.
				generateRadialFilter.m----> For generating radius filter of (8,1).
				UniformLBP8.txt----> For mapping of labels in (8,1) mode.
				ExtractLables.m----> For extracting Features and Labels from whole volume.
## Classification:
* TestKNN.m
--------------On given mat files, will train the model and give last mat file as test cae to it and will show how much incorrect values it got.
		Required files: KNN.m----> Will take value of k as argument and gives trained model

As per our project, we were able to achieve 80% Sensitivity and 100% Specificity.

## Dataset:
Link: https://mirror.nitk.ac.in/owncloud/index.php/s/ZRxtIDWsMJjXATe (will work in NITK intranet only).
 * NLM Data-> contains volume already denoised with NLM.
 * Flattening+Align Data -> After NLM, Flattening and alignment, volumes are stored here.
 * LBP Data-> After NLM,Flattening, Aligning and LBP Feature Extraction data is stored here.
