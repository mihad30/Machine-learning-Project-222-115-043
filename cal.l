%option noyywrap

%{
#include <stdio.h>
%}
letter [a-zA-Z]
digit [0-9]
%%
\"([^\"]|\\\")*$ {printf("Unclosed string error: %s\n", yytext);}
"int"|"char" {printf("%s -> TYPE\n", yytext);}
"*" {printf("%s -> POINTER\n", yytext);}
"&" {printf("%s -> ADDRESS\n", yytext);}
{letter}({letter}|{digit})* {printf("%s -> ID\n", yytext);}
{digit}+ {printf("%s -> NUMBER\n", yytext);}
"=" {printf("%s -> ASSIGN\n", yytext);}
"+"|"-" {printf("%s -> ARITH_OP\n", yytext);}
";" {printf("%s -> SEMICOLON\n", yytext);}
"@" {printf("Invalid token: %s\n", yytext);}
[ \t\r\n]+ {}
. {printf("Unknown: %s\n", yytext);}
%%
int main() { yylex(); return 0; }
