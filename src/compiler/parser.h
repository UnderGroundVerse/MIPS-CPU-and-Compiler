#include "AST.h"
#include "tokens.h"



class Parser{
    private:
        std::vector<Token> tokens;
        Token currentToken;
        int position;

        ASTNode buildIfCondition();
        ASTNode buildStatement();
        ASTNode buildWhileLoop();
        ASTNode buildForLoop();

    public:
        Parser(std::vector<Token> tokens);
        ASTNode parseTokens();
};