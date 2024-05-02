#include "AST.h"
#include "tokens.h"



class Parser{
    private:
        std::vector<Token> tokens;
        Token currentToken;
        int position;

        bool advance();

        std::vector<ASTNode> captureNodes(TokenSubType);

        ASTNode buildIfCondition();
        ASTNode buildStatement();
        ASTNode buildWhileLoop();
        ASTNode buildForLoop();
        std::vector<Token> getTokens(TokenSubType);

    public:
        Parser(std::vector<Token> tokens);
        ASTNode parseTokens();
};