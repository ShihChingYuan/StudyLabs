MPP_Track_DataScience
# Microsoft Professional Program - DataScience
[Data Science track](https://academy.microsoft.com/en-us/tracks/data-science)
- DAT208x: Introduction to Python for Data Science
- DAT207x: Analyzing and Visualizing Data with Power BI

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
   ```
   - Select Row with Highest Value
   ```python
   ```
   - Creating columns II
   ```python
   ```
   - Updating columns
   ```python
   ```
   - Filtering rows
   ```python
   ```
   - Grouping with Counts
   ```python
   ```
   - Grouping with Counts, Part 2
   ```python
   ```
   - Grouping One Column with Means
   ```python
   ```
   - Grouping Two Columns with Means
   ```python
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
