### Section 2 : Manipulating Data

## ----------------------------------------
## Creating Columns I
# Add sharemen column
recent_grads['sharemen'] = recent_grads['men']/recent_grads['total']

## ----------------------------------------
## Select Row with Highest Value
# Find the maximum percentage value of men
max_men = recent_grads['sharemen'].max()
# Output the row with the highest percentage of men
print(recent_grads[recent_grads['sharemen'] == max_men])

## ----------------------------------------
## Creating columns II
# Add gender_diff column
recent_grads['gender_diff'] = (recent_grads['sharewomen'] - recent_grads['sharemen'])

## ----------------------------------------
## Updating columns
# Make all gender difference values positive
recent_grads['gender_diff'] = (recent_grads['sharewomen']-recent_grads['sharemen']).abs()
# Find the 5 rows with lowest gender rate difference
print(recent_grads.nsmallest(5, 'gender_diff'))
print(recent_grads.sort_values(by=['gender_diff']).head(5))

## ----------------------------------------
## Filtering rows
# Rows where gender rate difference is greater than .30
diff_30 = recent_grads['gender_diff'] > .30
# Rows with more men
more_men = recent_grads['men'] > recent_grads['women']
# Combine more_men and diff_30
more_men_and_diff_30 = np.logical_and(diff_30, more_men)
# Find rows with more men and and gender rate difference greater than .30
fewer_women = recent_grads[more_men_and_diff_30]

## ----------------------------------------
## Grouping with Counts
# Group by major category and count
recent_grads.groupby('major_category')['sharewomen'].mean()
print(recent_grads.groupby('major_category')['major_category'].count())

## ----------------------------------------
## Grouping with Counts, Part 2
# Group departments that have less women by category and count
print(fewer_women.groupby('major_category')['major_category'].count())

## ----------------------------------------
## Grouping One Column with Means
# Report average gender difference by major category
print(recent_grads.groupby('major_category')['gender_diff'].mean())

## ----------------------------------------
## Grouping Two Columns with Means
# Find average number of low wage jobs and unemployment rate of each major category
dept_stats = recent_grads.groupby(['major_category'])['low_wage_jobs', 'unemployment_rate'].mean()
print(dept_stats)
