MPP_Track_DataScience
# Microsoft Professional Program - DataScience
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
   - Select a Column
   - Column Maximum Value
   - Selecting a Row
   - Converting a DataFrame to Numpy Array
   - Correlation Coefficient

   ### Section 2 : Manipulating Data
   ### Section 3 : Visualizing Data


***
## DAT207x: Analyzing and Visualizing Data with Power BI
[edX - Course](https://courses.edx.org/courses/course-v1:Microsoft+DAT207x+2T2018/course/)

* [Syllabus](https://prod-edxapp.edx-cdn.org/assets/courseware/v1/547b1a8915e1bf0d9a94bbab517a7eed/asset-v1:Microsoft+DAT207x+2T2018+type@asset+block/DAT207x_Syllabus.pdf)
* [GitHub](https://github.com/MicrosoftLearning/Analyzing-Visualizing-Data-PowerBI)
