#include <string>
#include <vector>
#include "token.h"



class Lexer{
    private:
        char currentChar;
        std::string currentWord;
        int advance();

    public:
        int analizeFile(FILE file, std::vector<Token> *out);

};