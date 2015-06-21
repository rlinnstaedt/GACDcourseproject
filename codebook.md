# GACDcourseproject
codebook.md

####Data:
Data consisted of 561 readings measuring various aspects of running as measured by a smartphone
for 30 subjects doing 6 activities.  Data came in 4 separate files with 4 more containing identifying information

####Transformations:
Combined the 8 data sets into one table, cleaned it up, and then isolated the mean and std.
finally calculated the mean for each variable with respect to subject and activity

####Variables:
subject: 1 - 30 integer 
activity: WALKING
, WALKING_UPSTAIRS,
 WALKING_DOWNSTAIRS
, SITTING
, STANDING,
 LAYING


#####Measurement Variables:
######Accelerometer readings in mean and standard deviation
"timeBodyAccelerometer-mean()-X"                 
"timeBodyAccelerometer-mean()-Y"                
"timeBodyAccelerometer-mean()-Z"
"timeBodyAccelerometer-std()-X"                 
"timeBodyAccelerometer-std()-Y"                  
"timeBodyAccelerometer-std()-Z"                 
"timeGravityAccelerometer-mean()-X"              
"timeGravityAccelerometer-mean()-Y"             
"timeGravityAccelerometer-mean()-Z"              
"timeGravityAccelerometer-std()-X"              
"timeGravityAccelerometer-std()-Y"               
"timeGravityAccelerometer-std()-Z"              
"timeBodyAccelerometerJerk-mean()-X"             
"timeBodyAccelerometerJerk-mean()-Y"            
"timeBodyAccelerometerJerk-mean()-Z"             
"timeBodyAccelerometerJerk-std()-X"             
"timeBodyAccelerometerJerk-std()-Y"              
"timeBodyAccelerometerJerk-std()-Z"
"timeBodyAccelerometerMagnitude-mean()"          
"timeBodyAccelerometerMagnitude-std()"          
"timeGravityAccelerometerMagnitude-mean()"       
"timeGravityAccelerometerMagnitude-std()"       
"timeBodyAccelerometerJerkMagnitude-mean()"      
"timeBodyAccelerometerJerkMagnitude-std()"
"frequencyBodyAccelerometer-mean()-X"            
"frequencyBodyAccelerometer-mean()-Y"           
"frequencyBodyAccelerometer-mean()-Z"            
"frequencyBodyAccelerometer-std()-X"            
"frequencyBodyAccelerometer-std()-Y"             
"frequencyBodyAccelerometer-std()-Z"            
"frequencyBodyAccelerometerJerk-mean()-X"        
"frequencyBodyAccelerometerJerk-mean()-Y"       
"frequencyBodyAccelerometerJerk-mean()-Z"        
"frequencyBodyAccelerometerJerk-std()-X"        
"frequencyBodyAccelerometerJerk-std()-Y"         
"frequencyBodyAccelerometerJerk-std()-Z"  
"frequencyBodyAccelerometerMagnitude-mean()"     
"frequencyBodyAccelerometerMagnitude-std()"     
"frequencyBodyAccelerometerJerkMagnitude-mean()" 
"frequencyBodyAccelerometerJerkMagnitude-std()" 
   
######Gyroscope readings in mean and standard deviation             
"timeBodyGyroscope-mean()-X"                     
"timeBodyGyroscope-mean()-Y"                    
"timeBodyGyroscope-mean()-Z"                     
"timeBodyGyroscope-std()-X"                     
"timeBodyGyroscope-std()-Y"                      
"timeBodyGyroscope-std()-Z"                     
"timeBodyGyroscopeJerk-mean()-X"                 
"timeBodyGyroscopeJerk-mean()-Y"                
"timeBodyGyroscopeJerk-mean()-Z"                 
"timeBodyGyroscopeJerk-std()-X"                 
"timeBodyGyroscopeJerk-std()-Y"                  
"timeBodyGyroscopeJerk-std()-Z"                   
"timeBodyGyroscopeMagnitude-mean()"              
"timeBodyGyroscopeMagnitude-std()"              
"timeBodyGyroscopeJerkMagnitude-mean()"          
"timeBodyGyroscopeJerkMagnitude-std()"          
"frequencyBodyGyroscope-mean()-X"                
"frequencyBodyGyroscope-mean()-Y"               
"frequencyBodyGyroscope-mean()-Z"                
"frequencyBodyGyroscope-std()-X"                
"frequencyBodyGyroscope-std()-Y"                 
"frequencyBodyGyroscope-std()-Z"                
"frequencyBodyGyroscopeMagnitude-mean()"         
"frequencyBodyGyroscopeMagnitude-std()"         
"frequencyBodyGyroscopeJerkMagnitude-mean()"     
"frequencyBodyGyroscopeJerkMagnitude-std()"