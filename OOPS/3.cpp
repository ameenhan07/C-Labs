#include <iostream>
#include <stdlib.h>
using namespace std;
//Definition of inline functions
inline int add(int x, int y)
{
   return (x + y);
}

inline int sub(int x, int y)
{
   return (abs(x - y));
}

inline float divide(int x, int y)
{
   return ( float(x) / float(y) );
}

inline int multiply(int x, int y)
{
   return (x * y);
}

inline int mod(int x, int y)
{
   return (x % y);
}

// Main function for the program
int main( )
{
  int x,y;
  cout << "Enter  nos -> " <<endl ;
  cin >>x>>y;
  cout <<endl<< "Inline Add " <<add(x,y);
  cout <<endl<< "Inline Subtract " <<sub(x,y);
  cout <<endl<< "Inline Multiply " <<multiply(x,y);
  cout <<endl<< "Inline Divide " <<divide(x,y);
  cout <<endl<< "Inline Moulus " <<mod(x,y);
  return 0;
}