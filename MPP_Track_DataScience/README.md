MPP_Track_DataScience
# Microsoft Professional Program - DataScience

### [Data Science track](https://academy.microsoft.com/en-us/tracks/data-science)

- Get Started with Data Science
  - [ ] Introduction to Data Science
- Analyze and Visualize Data
  - [ ] Analyzing and Visualizing Data with Power BI
  - [ ] Analyzing and Visualizing Data with Excel
- Communicate Data Insights
  - [ ] Analytics Storytelling for Impact
- Apply Ethics and Law in Analytics
  - [ ] Ethics and Law in Data and Analytics
- Query Relational Data
  - [ ] Querying Data with Transact-SQL
- Explore Data with Code
  - [ ] Introduction to R for Data Science
  - [ ] **DAT208x** : Introduction to Python for Data Science
- Apply Math and Statistics to Data Analysis
  - [ ] Essential Math for Machine Learning: R Edition
  - [ ] Essential Math for Machine Learning: Python Edition
  - [ ] Essential Statistics for Data Analysis using Excel
- Plan and Conduct Data Studies
  - [ ] Data Science Research Methods: R Edition
  - [ ] Data Science Research Methods: Python Edition
- Build Machine Learning Models
  - [ ] Principles of Machine Learning: R Edition
  - [ ] Principles of Machine Learning: Python Edition
- Build Predictive Solutions at Scale
  - [ ] Developing Big Data Solutions with Azure Machine Learning
  - [ ] Analyzing Big Data with Microsoft R
  - [ ] Implementing Predictive Analytics with Spark in Azure HDInsight
- Final Project
  - [ ] Microsoft Professional Capstone : Data Science
- Microsoft Professional Program Certificate in Data Science


***
## DAT208x: Introduction to Python for Data Science
[edX - Course](https://courses.edx.org/courses/course-v1:Microsoft+DAT208x+2T2018/course/)

Syllabus :
1. Python Basics
2. List - A data structure
3. Functions and packages
    - [pip installation](http://pip.readthedocs.io/en/stable/installing/)
    ```
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
    python get-pip.py --user
    pip3 install --upgrade pip
    pip3 install numpy
    pip3 install pandas
    pip3 install maplotlib
    ```
4. Numpy
    - [numpy](http://www.numpy.org/)
5. Plooting with Matplotlib
    - [matplotlib](https://matplotlib.org/index.html)
6. Control flow and Pandas
    - [pandas](http://pandas.pydata.org/)
7. Final Labs
   ### Section 1 : Importing and Summarizing Data
   [SampleData - recent_grads.csv](https://assets.datacamp.com/production/course_6030/datasets/recent_grads.csv)
   - Read and explore your data
    ```python
    # Import pandas
    import pandas as pd
    # Use pandas to read in recent_grads_url
    recent_grads = pd.read_csv(recent_grads_url)
    # Print the shape
    print(recent_grads.shape)
    ```
   - Exploring Your Data
    ```python
    # Print .dtypes
    print(recent_grads.dtypes)
    # Output summary statistics
    print(recent_grads.describe())
    # Exclude data of type object
    print(recent_grads.describe(exclude=['object']))
    ```
   - Replacing Missing Values
    ```python
    # Names of the columns we're searching for missing values
    columns = ['median', 'p25th', 'p75th']
    # Take a look at the dtypes
    print(recent_grads[columns].dtypes)
    # Find how missing values are represented
    print(recent_grads["median"].unique())
    print(recent_grads["p25th"].unique())
    print(recent_grads["p75th"].unique())
    # Replace missing values with NaN
    for column in columns:
        recent_grads.loc[recent_grads[column] == 'UN', column] = np.nan
    ```
   - Select a Column
    ```python
    # Select sharewomen column
    sw_col = recent_grads.loc[:,'sharewomen']
    # Output first five rows
    print(sw_col.head(5))
    ```
   - Column Maximum Value
    ```python
    # Import numpy
    import numpy as np
    # Use max to output maximum values
    max_sw = sw_col.max()
    # Print column max
    print(max_sw)
    ```
   - Selecting a Row
    ```python
    # Output the row containing the maximum percentage of women
    print(recent_grads.loc[recent_grads['sharewomen'] == max_sw])
    ```
   - Converting a DataFrame to Numpy Array
    ```python
    # Convert to numpy array
    recent_grads_np = recent_grads.as_matrix(columns=['unemployed', 'low_wage_jobs'])
    # Print the type of recent_grads_np
    print(type(recent_grads_np))
    ```
   - Correlation Coefficient
    ```python
    # Calculate correlation matrix
    print(np.corrcoef(recent_grads_np[:,0], recent_grads_np[:,1]))
    ```

   ### Section 2 : Manipulating Data
   - Creating Columns I
    ```python
    # Add sharemen column
    recent_grads['sharemen'] = recent_grads['men']/recent_grads['total']
    ```
   - Select Row with Highest Value
    ```python
    # Find the maximum percentage value of men
    max_men = recent_grads['sharemen'].max()
    # Output the row with the highest percentage of men
    print(recent_grads[recent_grads['sharemen'] == max_men])
    ```
   - Creating columns II
    ```python
    # Add gender_diff column
    recent_grads['gender_diff'] = (recent_grads['sharewomen'] - recent_grads['sharemen'])
    ```
   - Updating columns
    ```python
    # Make all gender difference values positive
    recent_grads['gender_diff'] = (recent_grads['sharewomen']-recent_grads['sharemen']).abs()
    # Find the 5 rows with lowest gender rate difference
    print(recent_grads.nsmallest(5, 'gender_diff'))
    print(recent_grads.sort_values(by=['gender_diff']).head(5))
    ```
   - Filtering rows
    ```python
    # Rows where gender rate difference is greater than .30 
    diff_30 = recent_grads['gender_diff'] > .30
    # Rows with more men
    more_men = recent_grads['men'] > recent_grads['women']
    # Combine more_men and diff_30
    more_men_and_diff_30 = np.logical_and(diff_30, more_men)
    # Find rows with more men and and gender rate difference greater than .30
    fewer_women = recent_grads[more_men_and_diff_30]
    ```
   - Grouping with Counts
    ```python
    # Group by major category and count
    recent_grads.groupby('major_category')['sharewomen'].mean()
    print(recent_grads.groupby('major_category')['major_category'].count())
    ```
   - Grouping with Counts, Part 2
    ```python
    # Group departments that have less women by category and count
    print(fewer_women.groupby('major_category')['major_category'].count())
    ```
   - Grouping One Column with Means
    ```python
    # Report average gender difference by major category
    print(recent_grads.groupby('major_category')['gender_diff'].mean())
    ```
   - Grouping Two Columns with Means
    ```python
    # Find average number of low wage jobs and unemployment rate of each major category
    dept_stats = recent_grads.groupby(['major_category'])['low_wage_jobs', 'unemployment_rate'].mean()
    print(dept_stats)
    ```

   ### Section 3 : Visualizing Data
   - Plotting Scatterplots
   ```python
   ```
   - Modifying Plot Colors
   ```python
   ```
   - Plotting Histograms
   ```python
   ```
   - Plotting with pandas
   ```python
   ```
   - Plotting One Bar Graphs
   ```python
   ```
   - Plotting Two Bar Graphs
   ```python
   ```
   - Dropping Missing Values
   ```python
   ```
   - Plotting Quantiles of Salary, Part 1
   ```python
   ```
   - Plotting Quantiles of Salary, Part 2
   ```python
   ```

***
## DAT207x: Analyzing and Visualizing Data with Power BI
[edX - Course](https://courses.edx.org/courses/course-v1:Microsoft+DAT207x+2T2018/course/)

* [Syllabus](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/547b1a8915e1bf0d9a94bbab517a7eed/asset-v1:Microsoft+DAT207x+2T2018+type@asset+block/DAT207x_Syllabus.pdf)
* [GitHub](https://github.com/MicrosoftLearning/Analyzing-Visualizing-Data-PowerBI)
