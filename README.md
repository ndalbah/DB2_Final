# Databases II - Final

## Exercise 1
Create the stored procedure **ListOfEmpOfAMan** that displays employees ( last 
name, salary, department id, department name, and job title) who are under the responsibility 
of a given employee used as parameter(given id). It also displays the total number of 
corresponding employees and the total of their salary.
<br><br>
**Note :**
- Don’t use any group function that returns the sum of salary
- It is a required to use cursor with the while loop instruction
- Handle usual exceptions and make sure that the program not crash when you Enter a non-number
- Handle the case when the employee is not manager    

## Exercise 2
You are provided the code of the stored function **NbCustOfSalesPerson** that returns the total 
number of customers who have a given employee as sales representative.  <br>
The column salesperson_id in the customer table corresponds to the employee number of the
sales representative. 
<br><br>
### Question 1
Complete the stored function NbCustOfSalesPerson with the appropriate 
instructions in order to inform when an employee is not sales representative 

### Question 2
Test the stored function in order to responds to the following examples of tests <br><br>
**Example 1:**
```
================================================================ 
Enter employee id :  7844 
The employee : 7844 is sale representative of  3 customers 
==================================================================
```
**Example 2:**
```
================================================================ 
Enter employee id :  7505 
The employee : 7505 is not sale representative 
==================================================================
```
### Question 3
Create a stored procedure **DisplayCustOfSalesPerson** that displays the list of customer (use loop instruction). (Customer id, name, city, state, phone number) of a given employee is (sales representative).

### Question 4
Test the stored procedure with the employees : **7820**, **7505** 
<br><br>
Note :  
- It is required to use the function created in question 1 to display the total number of  
Customers for question 4
- It is a required to use cursor with the loop instruction
- Handle usual exceptions and make sure that the program not crash when you enter a non-number  
