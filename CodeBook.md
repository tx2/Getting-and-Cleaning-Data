# CodeBook
### Variables:
* x - complete set of data (test + training)
* names - features' names
* extracted - mean and standard deviation measurements from complete data set
* y - activity types for complete set of data (test + training)
* actnames - label names for activities
* factors - split actnames in a group of vectors
* s - complete subject identification (test + training)
* melted - melt of extracted set

### Brief resume of operations:
* Read complete set of data for test and training
* Read the names of features
* Extract only the mean and standard deviation measurements
* Set descriptive names to extracted measurements
* Read the activity type of complete data set
* Read the activity labels
* Divides the activity labels in groups of vectors
* Turn activity column (first) of activity type in factor
* Associate to the levels of activity column of activity type to the activity labels vector group
* Put activity type column at left of extracted values data set
* Give appropriate name to the columns
* Read the subject identification mask for test and training
* Put subject type column at left of extracted values data set
* Give appropriate name to the columns
* Import reshape2 library
* Melt extracted data set defining the subject and activity columns as ids and the rest of them as variables
* Create a data set with the average of each variable for each activity and each subject