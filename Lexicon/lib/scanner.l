/* flex wc.l && gcc lex.yy.c Token.c OrderedList.c -o jfe -lfl*/
%option noyywrap

%{
#include <stdio.h>
#include "parser.tab.h"
#include <stdlib.h>
extern int yylval;


OrderedList list;


%}

id [[:alpha:]_][[:alnum:]_]*
natural [0-9]+
integer "-"?{natural}
real    {integer}"."{natural}

%%
programa    	                {   return PROG       ;}
var                             {   return VAR        ;}
verdadeiro                      {   return TRUE       ;}
falso                           {   return FALSE      ;}
e                               {   return AND        ;}
ou                              {   return OR         ;}
se                              {   return IF         ;}
senao                           {   return ELSE       ;}
entao                           {   return THEN       ;}
enquanto                        {   return WHILE      ;}
inicio                          {   return BEGIN      ;}
fim                             {   return END        ;}
faca                            {   return DO         ;}
leia                            {   return SCAN       ;}
escreva                         {   return PUT        ;}
inteiro                         {   return INT        ;}
real                            {   return FLOAT      ;}
booleano                        {   return BOOL       ;}
not                             {   return NOT        ;}
:=                              {   return ATRIB      ;}
;                               {   return SCOL       ;}
:                               {   return DOUBPO     ;}
div                             {   return DIV        ;}
","                             {   return COL        ;}
"("                             {   return OPPAR      ;}
")"                             {   return CLPAR      ;}
"+"                             {   return PLUS       ;}
"-"                             {   return MINUS      ;}
"*"                             {   return MULT       ;}
"."                             {   return POINT      ;}
"="                             {   return EQUAL      ;}
"<>"                            {   return DIF        ;}
">="                            {   return LARGEREQ   ;}
"<="                            {   return SMALEREQ   ;}
"<"                             {   return SMALER     ;}
">"                             {   return LARGER     ;}
{real}                          {   return NUMR       ;}
{natural}                       {   return NUMN       ;}
{integer}                       {   return NUMI       ;}
{id}                            {   return ID         ;}
{id}[^(\n\t[:space:])]+         {   return IDERRO     ;}
\n                              {  }
\t                              {  }
[[:space:]]                     {  }
[{][^}]*[}]                     {  }  
.                               {  }                                     
%%

int main(int argc, char **argv)
{
    char *fileName = argv[1];
    FILE *file = fopen(fileName, "r");

    if(!file){
        printf("Arquivo não encontrado");
        return -1;
    }

    yyin = file;
    yylex();
    
    fclose(file);
    
}