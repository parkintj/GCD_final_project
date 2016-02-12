# Getting and Cleaning Data
# Course Project
# last update: February 12, 2016

# load appropriate packages:
library(utils)
library(dplyr)

# read in the data
# Note that this script assumes your working directory is the
# UCI_HAR_Dataset folder (or that the scripts/subfolders are in
# your working directory).

# read in feature and activity files:
features1 <- read.table("features.txt")
act_labels1 <- read.table("activity_labels.txt")

# modify the variable names in feature column 2 so they are neater:
features_mod1 <- gsub("-","_",features1$V2)
features_mod2 <- gsub("[(|)]", "", features_mod1)

# read files in test directory:
xtest1 <- read.table("./test/X_test.txt", col.names = features_mod2)
ytest1 <- read.table("./test/y_test.txt", col.names = "actcode")
subtest1 <- read.table("./test/subject_test.txt", col.names = "ID")

# then train directory:
xtrain1 <- read.table("./train/X_train.txt", col.names = features_mod2)
ytrain1 <- read.table("./train/y_train.txt", col.names = "actcode")
subtrain1 <- read.table("./train/subject_train.txt", col.names = "ID")

# Convert variables to data frames for use in dplyr:
actlabels <- tbl_df(act_labels1)

xtest <- tbl_df(xtest1)
ytest <- tbl_df(ytest1)
subtest <- tbl_df(subtest1)

xtrain <- tbl_df(xtrain1)
ytrain <- tbl_df(ytrain1)
subtrain <- tbl_df(subtrain1)


# then remove old table formats:
rm(act_labels1)

rm(xtest1)
rm(ytest1)
rm(subtest1)

rm(xtrain1)
rm(ytrain1)
rm(subtrain1)

# Now, merge all the test data together:
xytest <- mutate(xtest, ID = subtest$ID, actcode = ytest$actcode)
xytrain <- mutate(xtrain, ID = subtrain$ID, actcode = ytrain$actcode)

xydata <- merge(xytest, xytrain, all=TRUE)
xydata <- tbl_df(xydata)

# Search through function names for anything containing "mean"
# and "std" and select out only those columns, plus the actcode and ID
# columns:
subxydata <- select(xydata, ID, actcode, 
                    matches("(.*)_mean(.*)|(.*)_std(.*)"))

# Now replace the activity codes with the actual activity names:
subxydata_actlabels <- mutate(subxydata, actcode = actlabels$V2[actcode])

# and rename the column to activity_name:
mean_std_data <- rename(subxydata_actlabels, activity_name = actcode)

# finally, sort by ID in ascending order:
mean_std_data <- arrange(mean_std_data, ID, activity_name)

######## Now for second dataset:

# clone the final set to work with:
starting_data <- mean_std_data

# now group by activity name and by ID:
#recast ID as factor:
temp1 <- mutate(starting_data, ID = as.factor(ID))
# group_by:
grouped_data <- group_by(temp1, ID, activity_name)

# summarize:
avg_data <- summarise_each(grouped_data, funs(mean))

# rename variables:
for(i in 3:length(names(avg_data))){
    names(avg_data)[i] <- paste0("avg_",names(avg_data)[i])
}

# now export the resulting dataset:
write.table(avg_data, file="gcd_assignment_tidy_data.txt", row.name=FALSE)








