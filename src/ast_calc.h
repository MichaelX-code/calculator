#ifndef AST_CALC_H
#define AST_CALC_H

#include "abstract_calc.h"
#include "config.h"

typedef struct ast_calc_t {
    abstract_calc_t base;
    ast_node_t *ast;
} ast_calc_t;

abstract_calc_t *init_ast_calc (config_t *config);
int run_ast_calc (abstract_calc_t *calc);
void destroy_ast_calc (abstract_calc_t *calc);

#endif // AST_CALC_H
