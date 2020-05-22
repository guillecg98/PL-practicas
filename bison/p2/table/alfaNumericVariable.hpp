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
class AlfaNumericVariable:public lp::Variable
{
/*!
\name Private atributes of AlfaNumericVariable class
*/
	private:
		std::string      _value;   //!< \brief Numeric value of the AlfaNumericVariable

/*!
\name Public methods of AlfaNumericVariable class
*/
	public:

/*!
	\name Constructors
*/

/*!
	\brief Constructor with arguments with default values
	\note  Inline function that uses Variable's constructor as members initializer
	\param name: name of the AlfaNumericVariable
	\param token: token of the AlfaNumericVariable
	\param type: type of the AlfaNumericVariable
	\param value: numeric value of the AlfaNumericVariable
	\pre   None
	\post  A new AlfaNumericVariable is created with the values of the parameters
	\sa   setName, setValue
*/
	inline AlfaNumericVariable(std::string name="", int token = 0, int type = 0, std::string value=""):Variable(name,token,type)
	{
		this->setValue(value);
	}

/*!
	\brief Copy constructor
	\note  Inline function
	\param n: object of AlfaNumericVariable class
	\pre   None
	\post  A new AlfaNumericVariable is created with the values of an existent AlfaNumericVariable
	\sa    setName, setValue
*/
	AlfaNumericVariable(const AlfaNumericVariable & n)
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
	\brief  Public method that returns the value of the AlfaNumericVariable
	\note   Función inline
	\pre    None
	\post   None
    \return Value of the AlfaNumericVariable
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
	\brief   This functions modifies the value of the AlfaNumericVariable
	\note    Inline function
	\param   value: new value of the AlfaNumericVariable
	\pre     None
	\post    The value of the AlfaNumericVariable is equal to the parameter
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
	\brief Read a AlfaNumericVariable
	\pre   None
	\post  The atributes of the AlfaNumericVariable are modified with the read values
    \sa    write
*/
	void read();


/*!
	\brief Write a AlfaNumericVariable
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
	\param  n: objectoof AlfaNumericVariable class
	\post   The atributes of this object are equal to the atributes of the parameter
	\return Reference to this object
*/
	AlfaNumericVariable &operator=(const AlfaNumericVariable &n);


 //! \name Friend functions
/*!
	\brief  Insertion operator
	\param  i: input stream
	\param  n: object of AlfaNumericVariable class
	\pre    nome
	\post   The atributes of the AlfaNumericVariable are modified with the inserted values from the input stream
	\return The input stream
*/
	friend std::istream &operator>>(std::istream &i, AlfaNumericVariable &n);

/*!
	\brief  Extraction operator
	\param  o: output stream
	\param  n: object of AlfaNumericVariable class
	\pre    nome
	\post   The atributes of the AlfaNumericVariable are written in the output stream
	\return The output stream
*/
	friend std::ostream &operator<<(std::ostream &o, AlfaNumericVariable const &n);

// End of AlfaNumericVariable class
};

// End of name space lp
}

// End of _AlfaNumericVariable_HPP_
#endif
