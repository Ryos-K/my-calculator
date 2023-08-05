#include "lexer.h"
#include "parser.h"
#include <stdio.h>

int main(int argc, char const *argv[]) {
    int ret, res;

    YY_BUFFER_STATE bp = yy_scan_string(argv[1]);
    yy_switch_to_buffer(bp);
    ret = yyparse(&res);
    yy_delete_buffer(bp);
    printf("res = %d, ret = %d", res, ret);
    return 0;
}
