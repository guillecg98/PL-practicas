/*!
  \file pie.l
  \brief Lexical or scanner file
*/

%{
    #include<iostream>
%}

%%

(?i:modulo)
(?i:quotient)
(?i:or)
(?i:and)
(?i:not)
(?i:read)
(?i:readstring)
(?i:write)
(?i:writestring)
(?i:if)
(?i:then)
(?i:else)
(?i:endif)
(?i:while)
(?i:do)
(?i:endwhile)
(?i:repeat)
(?i:until)
(?i:for)
(?i:from)
(?i:to)
(?i:step)
(?i:endfor)
(?i:clear)
(?i:place)
(?i:true)
(?i:false)

%%