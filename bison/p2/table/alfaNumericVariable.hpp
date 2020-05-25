/*!
	\file    alfanumericVariable.hpp
	\brief   Declaration of alfanumericVariable class
	\author
	\date    2017-12-1
	\version 1.0
*/

#ifndef _ALFANUMERICVARIABLE_HPP_
#define _ALFANUMERICVARIABLE_HPP_

#include <cstring>
#include <iostream>

#include "variable.hpp"

/*!
	\namespace lp
	\brief Name space for the subject Language Processors
*/
namespace lp{

/*!
  \class alfanumericVariable
  \brief Definition of atributes and methods of alfanumericVariable class
  \note  alfanumericVariable Class publicly inherits from Variable class
*/
class alfanumericVariable:public lp::Variable
{
/*!
\name Private atributes of alfanumericVariable class
*/
	private:
		std::string      _value;   //!< \brief Numeric value of the alfanumericVariable

/*!
\name Public methods of alfanumericVariable class
*/
	public:

/*!
	\name Constructors
*/

/*!
	\brief Constructor with arguments with default values
	\note  Inline function that uses Variable's constructor as members initializer
	\param name: name of the alfanumericVariable
	\param token: token of the alfanumericVariable
	\param type: type of the alfanumericVariable
	\param value: numeric value of the alfanumericVariable
	\pre   None
	\post  A new alfanumericVariable is created with the values of the parameters
	\sa   setName, setValue
*/
	inline alfanumericVariable(std::string name="", int token = 0, int type = 0, std::string value=""):Variable(name,token,type)
	{
		this->setValue(value);
	}

/*!
	\brief Copy constructor
	\note  Inline function
	\param n: object of alfanumericVariable class
	\pre   None
	\post  A new alfanumericVariable is created with the values of an existent alfanumericVariable
	\sa    setName, setValue
*/
	alfanumericVariable(const alfanumericVariable & n)
	{
		// Inherited methods
		this->setName(n.getName());

		this->setToken(n.getToken());

		this->setType(n.getType());

		// Own method
		this->setValue(n.getValue());
	}


/*!
	\name Observer
*/

/*!
	\brief  Public method that returns the value of the alfanumericVariable
	\note   Función inline
	\pre    None
	\post   None
    \return Value of the alfanumericVariable
	\sa		getValue
*/
	inline std::string getValue() const
	{
		return this->_value;
	}



/*!
	\name Modifier
*/

/*!
	\brief   This functions modifies the value of the alfanumericVariable
	\note    Inline function
	\param   value: new value of the alfanumericVariable
	\pre     None
	\post    The value of the alfanumericVariable is equal to the parameter
	\return  void
	\sa 	 setValue
*/
	inline void setValue(const std::string & value)
	{
	    this->_value = value;
	}




/*!
	\name I/O Functions
*/

/*!
	\brief Read a alfanumericVariable
	\pre   None
	\post  The atributes of the alfanumericVariable are modified with the read values
    \sa    write
*/
	void read();


/*!
	\brief Write a alfanumericVariable
	\pre   None
	\post  None
    \sa    read
*/
	void write() const;


/*!
	\name Operators
*/

/*!
	\brief  Assignment Operator
	\param  n: objectoof alfanumericVariable class
	\post   The atributes of this object are equal to the atributes of the parameter
	\return Reference to this object
*/
	alfanumericVariable &operator=(const alfanumericVariable &n);


 //! \name Friend functions
/*!
	\brief  Insertion operator
	\param  i: input stream
	\param  n: object of alfanumericVariable class
	\pre    nome
	\post   The atributes of the alfanumericVariable are modified with the inserted values from the input stream
	\return The input stream
*/
	friend std::istream &operator>>(std::istream &i, alfanumericVariable &n);

/*!
	\brief  Extraction operator
	\param  o: output stream
	\param  n: object of alfanumericVariable class
	\pre    nome
	\post   The atributes of the alfanumericVariable are written in the output stream
	\return The output stream
*/
	friend std::ostream &operator<<(std::ostream &o, alfanumericVariable const &n);

// End of alfanumericVariable class
};

// End of name space lp
}

// End of _alfanumericVariable_HPP_
#endif
