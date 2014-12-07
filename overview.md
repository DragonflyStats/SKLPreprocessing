hideR

### Data Transformations

This package is not intended to fully automate the anonymisation process, but rather to improve the identification of crucial cases.

Each variable will be converted to a factor variable (i.e. a categorical variable).

A threshold for the number of levels must be specified. 
A default setting of 15 will be used, but this may not be appropriate for all data types. (e.g. geographical regions - in the US, there are 54 federal geographic entities, including DC, Puerto Rico and Guam)

The program is envisaged to have a "keep exception" handling whereby the variable is not removed. The variable must be specified by the users.

<pre><code>

keepList = c("stateNames","stateIds") 

myNewData = getFactors(myData, threshold = 10, ignore = KeepList)

</code></pre>

### 1. Case Report

Parameters 
- **T** Lowest Cell Size Threshold
   - default value of 30.
- **L** Report Length
   - default value of 30 cases

The case report (`caseReport`) returns a table containing the frequency of how many times each particular cell is in a category of size less than the
Threshold. 


### 2. Variable Report
- Reports the lowest cell size for frequency tables
- Reports how many levels have frequencies less than the threshold.
- The default report size is 30.
