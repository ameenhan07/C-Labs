// Write a C++ program to create 3 objects for a 
// class named pntr_obj with data members such as roll_no & name. 
// Create a member function set_data(for setting the data values) 
// and print() member function to print which object has invoked it using 'this' pointer
#include <iostream>
using namespace std;

#define MAX 30;

class pntr_obj
{
public:
    int roll_no;
    char const *name;
    public:

    //Function to set data values
    void set_data(char const *n, int r) 
    {
        name = n;
        roll_no = r;
    }

    // Function to print using "this"
    void print()
    {
        cout<<"Student : "<<this->name<<"\t Roll no : "<<this->roll_no<<endl;
    }
};

int main()
{
    // object declaration
    pntr_obj obj[3]; 
    
    // calling set_data function using objects
    obj[1].set_data("Ameen",11);
    obj[2].set_data("Antriksh",12);
    obj[3].set_data("Anzal",13);
    
    // calling print function using objects
    obj[1].print();
    obj[2].print();
    obj[3].print();

    return 0; //denotes successfull termination
}