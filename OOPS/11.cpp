/*
* Write a C++ program to accept the student detail such as name 
* and 3 different marks by get_data() method and display the name 
* and avg of marks using display() method. Define a friend class for 
* calculating the avg of marks using the method mark_avg().
*/

#include <iostream>
using namespace std;

//Class Student
class Student
{
    char name[20];
    int a , b , c ;

    // declaration of th Friend Class
    friend class friendclass;
    
    public:
        void get_data()
        {
            cout<<"Enter name of the student :";
            cin>>name;
            cout<<"Enter 3 marks:";
            cin>>a>>b>>c;
        }
        void display(int a)
        {
            cout<<"Name of the student : "<<name<<endl;
            cout<<"Average marks = "<<a<<endl;
        }
};
// Calculate average using Friend Class
class friendclass
{
    public:
        void mark_avg(Student s)
        {
            int avg=(s.a+s.b+s.c)/3;
            s.display(avg);
        }
};
// MAIN
int main()
{
    Student s;
    s.get_data();
    friendclass obj;
    obj.mark_avg(s);
    return 0;
}