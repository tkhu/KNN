# KNN
In this project, I created a K-nearest neighbor algorithm from scratch using R.

### Acknowledgement
I would like to acknowledge Jason Brownlee's KNN tutorial [here](https://machinelearningmastery.com/tutorial-to-implement-k-nearest-neighbors-in-python-from-scratch/). Essentially, I modified his code from Python to R. In order to speed-up the calculation, I have vectorized some of the calculations.

### Data
The dataset used in this project is the iris dataset, which contains 150 rows of numerical flower datas for classification. This is one of the most well-known data for R.

### Methodology
The algorithm finds the nearest Euclidean distances, then takes the majority of the 'votes' given the specified number of neighbors (k).

### Results
Given 75/25 split for training and testing dataset with 7 neighbors, the model is able to predict the right flower in 37/38 instances. 
