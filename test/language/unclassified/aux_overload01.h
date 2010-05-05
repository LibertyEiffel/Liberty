
#ifndef __OVERLOAD__
#define __OVERLOAD__

class Overload
{
public:
   Overload(){} 
	void value(int v){ internal_value = v; }
	int value(){ return internal_value; }
private:
	int internal_value;
};

#endif
