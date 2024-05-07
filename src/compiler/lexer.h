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
    bool isOperator(char);
    std::string buildString();
    std::string buildNumber();
    std::string buildStringLiteral();
    std::string buildOperator();
    bool categorizeString(std::string, TokenType*, TokenSubType*);
    Token buildToken(std::string);

public:
    Lexer(const char*, int);
    std::vector<Token> analizeFile(std::vector<Token>);

};


#endif