/*
* Write a C++ program to to implement vitual function(polymorphism) 
* by creating a base class c_polygon which has virtual function area().
* Two classes c_rectangle and c_triangle derived from c_polygon and they have area() 
* to calculate and return the area of triangle respectively
* Reference :
* http://stackoverflow.com/questions/8824359/why-use-virtual-functions
* http://www.cplusplus.com/doc/tutorial/polymorphism/
*/

#include<iostream>
using namespace std;

//BASE CLASS
class c_polygon
{
  protected:
  float a,b;
  public:
    //Virtual function area; doesn't matter what it does as it will be overwritten 
    //by the function in derived class
    virtual float area()
    {
      return 0;
    }
    //Taking input
    void get()
    {
      cout<<"\nEnter any two floating values:\n";
      cin>>a>>b;
    }    
};

//Derived Class 1
class c_rectangle:public c_polygon
{
  public:
    float area()
    {
      return ( a * b );
    }
};

//DERIVED CLASS 2
class c_triangle:public c_polygon
{
  public:
    float area()
    {
        return ( (b * a) / 2 );
    }
};

//MAIN
int main()
{
  //Creating objects
  c_rectangle rect;
  c_triangle tri;
  
  //Pointers to c_polygon(BASE CLASS) are assigned addressees to derived classes
  // i.e. objects of type c_rectangle and c_triangle
  // such that, only members inherited from Base class can be accessed
  c_polygon * poly1 = &rect;
  c_polygon * poly2 = &tri;

  poly1->get();
  cout<<endl<<"Area of rectangle is "<<poly1->area();
  

  poly2->get();
  cout<<endl<<"Area of triangle is "<<poly2->area();
  
  return 0;
} 