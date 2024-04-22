#include <string>
#include <vector>
#include "tokens.h"



class Lexer{
private:
    const char* file;
    char currentChar;
    int currentPosition;
    void advance();

public:
    Lexer(const char*);
    int analizeFile(std::vector<Token>);

};