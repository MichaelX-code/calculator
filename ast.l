%option noinput nounput noyywrap
%option reentrant never-interactive bison-bridge
%option prefix="ast"

%{
  #include "ast.h"
%}

EXP ([Ee][-+]?[0-9]+)

%%

[ \t]                 ;
[+\-*/()]             { return yytext[0]; }
[0-9]+"."[0-9]*{EXP}? |
"."?[0-9]+{EXP}?      { yylval->d = strtold (yytext, NULL); return ASTNUM; }
.                     { printf ("Unknown character: \"%s\"", yytext); }

%%