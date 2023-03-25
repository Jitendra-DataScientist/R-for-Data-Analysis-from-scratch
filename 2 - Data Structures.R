## Vectors

a = c(1,2,3,4)
a
class(a)

b = c("hello", "hi", "good day")
b
class(b)

c = c(1,2,"HI")  ## first 2 elements get coerced to class 'CHARACTER'
c
class(c)

## accessing elements of vector
## indices do not start with 0 as in python, rather they start with 1.
c[3]

## Matrices
## vectors are 1-D, matrices are 2-D

my_vector = c(10,20,30,40)
class(my_vector)    ## numeric
my_matrix = matrix(my_vector,nrow=2,ncol=2)
my_matrix
class(my_matrix)   ## "matrix" "array"

1:9
a = 1:9
a

my_matrix2 = matrix(1:9,nrow=3,ncol=3)
my_matrix2

## accessing elements of matrix
my_matrix2[1,3]   ## first no. is row, 2nd one is column
my_matrix2[2,]    ## accessing entire row
my_matrix2[,3]    ## accessing entire column
my_matrix2[2:3,1:2]   ## accessing a subset of matrix by giving ranges of
                      ## rows and columns.
my_matrix2[-2,-1]   ## accessing a subset of matrix by giving row index and
## columns index to be excluded

## Vectors and matrices can store only one type of data.
## Dataframes are similar to matrices, but in dataframes, different
## columns can have different data types.

vector1 = c(10,20,30,40)
vector2 = c("John","Sandy","Kate","Jon")
df = data.frame(vector1,vector2)
df

## my trial - gives absurd column names ('X1.3' and 'c..a....b....c..'): 
df1 = data.frame(1:3,c('a','b','c'))
df1

class(df)  ## "data.frame"

df$vector1   ## accessing a column
class(df$vector1)  ## "numeric"
class(df$vector2)  ## "character"

## also dataframe elements can be accessed exactly like those of matrices
df[,2]   ## access all rows of 2nd column
df[1:3,]   ## access rows 1 to 3 of all columns
subset_df = df[1:3,]
subset_df


### Lists
## lists can store different data type objects unlike vectos

my_list = list(1,"Hello",a,b,df)
my_list
my_list[[3]]   ## accessing a single element
my_list[1:3]   ## accessing multiple elements
my_list[3]    ## returns 3rd element in an array
## For lists, one generally uses [[ to select any single element,
## whereas [ returns a list of the selected elements.
my_list[5][1,]     ## would return error
my_list[[5]][1,]     ## would access the first row of the dataframe(5th element)
my_list[5][[1]][1,]     ## same as above
my_list[5][1][1][1][1][[1]][1,]     ## same as above
