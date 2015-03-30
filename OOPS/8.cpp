/*
* Write a C++ program to create 2 objects of a class called company 
* and add their data members using an operator overloaded function 
* for '+' operator and '-' operator.
*/

#include <iostream>
#include <stdlib.h>
using namespace std;

class company
{
    int income;
    public :
        // data function interacting with data members
        void get() {
            cout<<endl<<"Input Income -> ";
            cin>>income;
        }
        void put() {
            cout<<"INCOME -> "<<abs(income)<<endl;
        }
        // oveloaded function for +
        company operator +(company com) {
            company obj;
            obj.income = income + com.income;
            return obj;
        }
        // overloaded functio for -
        company operator -(company com) {
            company obj;
            obj.income = income - com.income;
            return obj;
        }
};

int main()
{
    company obj[2],add,sub;
    //getting objects
    obj[1].get();
    obj[2].get();

    add = obj[1] + obj[2];
    
    cout<<endl<<"After addition, ";
    add.put();
    sub = obj[1] - obj[2];
    cout<<endl<<"After subtraction, ";
    sub.put();
    return 0;
}