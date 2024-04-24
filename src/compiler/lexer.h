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
    bool isQuotation(char);
    bool isSpecialChar(char);
    std::string buildString();
    std::string buildNumber();
    std::string buildStringLiteral();
    bool categorizeString(std::string, TokenType*, TokenSubType*);
    Token buildToken(std::string);

public:
    Lexer(const char*, int);
    int analizeFile(std::vector<Token>);

};


#endif