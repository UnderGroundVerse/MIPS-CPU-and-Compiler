#ifndef LEXER_H
#define LEXER_H

#include <string>
#include <vector>
#include "tokens.h"



class Lexer{
private:
    const char* file;
    int fileSize;
    char currentChar;
    int currentPosition;
    bool advance();
    bool retreat();
    bool isChar(char);
    bool isNum(char);
    std::string buildStringLiteral();
    std::string buildNumberLiteral();

public:
    Lexer(const char*, int);
    int analizeFile(std::vector<Token>);

};


#endif