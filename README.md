README

The directory "UCI HAR Dataset":
contains the raw dataset from this assignment.
No modification to these files has been made.

run_analysis.R:
contains the script that performs the requirements of the
assignment.  I have commented each requirement where it is taken 
care of in the script.

A high level overview of what this script performs follows:
1. Loads the train and test datasets into memory ('test' and 'train') from X_test.txt and X_train.txt
2. Applies the variable names as detailed in 'features.txt' to both test and train datasets
3. Filters only those columns that contain mean() and std() from both 'train' and 'test' dataset
4. Loads the 'activity' rows for test and train datasets from y_test.txt and y_train.txt
5. Applies the activity_labels.txt to the activity rows to convert the numerical values to character
    values which describe the activity
6. Adds the translated activity column as the first variable in the 'test' and 'train' datasets
    respectively.
7. Loads the subject data from subject_test.txt and subject_train.txt, and adds them to the 'train' 
    and 'test' datasets as the first variable (i.e. before activity)
8. Merges the 'train' and 'test' datasets together using a row-bind into a new dataset 'combined'
9. Groups the combined data by subject and activity in the new dataset 'grouped'.  
    NOTE: As the only change is to group the data, I have not created a separate codebook for this 
            dataset.
10. Creates a new tidy dataset called 'summary' which is the dataset represented by the output file
    'tidy_dataset.txt'

tidy_dataset.txt:
This is the output tidy dataset from requirement 5 - the independent, tidy
dataset which summarizes the subjects, activities and average calculations
for each activity measurement across the merged train and test datasets.

CODEBOOKS

I have created codebooks for the two main datasets in this assignment:

codebook_combined.html ---> the codebook for the combined, tidy train & test datasets
codebook_summary.html  ---> the codebook for the independent tidy dataset summarizing on
                            average vaues per subject/activity combination     
