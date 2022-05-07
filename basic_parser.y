%{
    #include "basic_calc.h"
    #include "basic_lexer.h"

    void
    yyerror (__attribute__ ((unused)) yyscan_t scanner, const char *msg)
    {
        fprintf (stderr, "ERROR: %s\n", msg);
    }
%}

%param {void *scanner}
%define api.prefix {basic}
%define api.pure full

%token NUM
%left '+' '-'
%left '*' '/'
%precedence NEG

%defines

%%

calclist: exp {
    BASICSTYPE *res = basicget_extra (scanner);
    *res = $1;
}

exp:
  NUM               { $$ = $1;      }
| exp '+' exp       { $$ = $1 + $3; }
| exp '-' exp       { $$ = $1 - $3; }
| exp '*' exp       { $$ = $1 * $3; }
| exp '/' exp       { $$ = $1 / $3; }
| '-' exp %prec NEG { $$ = -$2;     }
| '(' exp ')'       { $$ = $2;      }
;

%%