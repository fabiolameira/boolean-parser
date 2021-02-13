%token BOOLEAN VARIABLE IMPL

%{
   #include <stdio.h>
   void yyerror(char*);
   int yylex(void);
   int varArray[100]; 
%}

%%

program:
        program statement '\n'
        |
        ;

statement:
        | expression                    { printf("%d\n", $1); }
        | VARIABLE '=' expression       { varArray[$1] = $3; }
        ;

expression:
        BOOLEAN
        | VARIABLE                      { $$ = varArray[$1]; }
        | '!' BOOLEAN                   { $$ = !$2; }
        | '!' VARIABLE                  { $$ = !varArray[$2]; }
        | expression '+' expression     { $$ = $1 | $3; }
        | expression '.' expression     { $$ = $1 & $3; }
        | expression IMPL expression    { $$ = !$1 | $3; }
        | '(' expression ')'            { $$ = $2; }
        ;

%%

void yyerror(char* s) {
   fprintf(stderr, "%s\n", s);   
}

int main() {
   for (int i = 0; i < 100; i++) varArray[i] = -1;
   yyparse();
   return 0;
}
