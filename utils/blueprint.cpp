#include "$CLASSFILE"
#include <iostream>

$CLASSNAME::$CLASSNAME()
{
	std::cout << "$CLASSNAME" << " has been created " << 
		" from default constructor" << std::endl;
}

$CLASSNAME::$CLASSNAME($CLASSNAME const &$classname)
{
	std::cout << "$CLASSNAME" << " has been created " << 
		" from copy constructor" << std::endl;
}

$CLASSNAME::~$CLASSNAME()
{
	std::cout << "$CLASSNAME" << " has been destroyed"  << std::endl;
}

$CLASSNAME &$CLASSNAME::operator=($CLASSNAME const &$classname)
{
	std::cout << "$CLASSNAME" << " has been created " << 
		" via assignment operator" << std::endl;
	return *this;
}