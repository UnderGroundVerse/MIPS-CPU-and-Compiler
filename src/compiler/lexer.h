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

public:
    Lexer(const char*, int);
    int analizeFile(std::vector<Token>);

};


#endif