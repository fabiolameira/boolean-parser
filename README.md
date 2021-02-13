# BooleanParser
Simple Lex and Yacc Boolean Parser

A Boolean expression has the usual operators applied to logical values,represented by 0 (zero), the value FALSE, and 1 (one), the value TRUE. 
The values Logics can appear in the expression explicitly (0/1) or as variables.
The variables are represented by the letter 'x' followed by a number, e.g., x1, x24.
The program recognizes the following representation for Boolean operators:
    '+' - logical OR
    '.' - (dot) AND logical
    '!' - denial
    '=>' - implication
    '(' expression ')' - parentheses with the usual meaning.

For example, the expression Boolean:
¬ (x1 ∨ ¬x2) ∧ (¬x1 ∨ x3 ∨ ¬x4 ∨ x5) ∧ x4  x6 ∨ (¬x4 ∧ ¬x5)

It will have the following representation in the program:
! (x1 +! x2). (! x1 + x3 +! x4 + x5). x4 => x6 + (! x4.! x5)

The program also accepts the assignment of a Boolean value to a variable. 
The following is a small example of inputs and outputs of the program:
    input: x1 = 0
    input: x2 = 1
    input: x1 + !x2
    output: 0
    input: x3 = 0
    input: x1 => x3
    output: 1
    input: x4 = (x2 + x3 + x1) . (!x2 + x3)
    input: x4
    output: 0
    input: (x1 + x3 + 1) . (!0 + x4)
    output: 1
    
Linux commands to compile:
user@machine:~$ yacc -d BooleanParser.y
user@machine:~$ flex BooleanParser.l
user@machine:~$ gcc lex.yy.c y.tab.c
user@machine:~$ ./a.out
