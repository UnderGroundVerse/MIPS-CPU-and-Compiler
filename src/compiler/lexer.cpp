#ifndef LEXER_CPP
#define LEXER_CPP

#include "lexer.h"
#include <iostream>

int Lexer::analizeFile(std::vector<Token> out){

    while(currentChar != EOF){
        std::cout << currentChar << std::endl;
        advance();
    }

}

void Lexer::advance(){
    currentPosition++;
    currentChar = file[currentPosition];

}

Lexer::Lexer(const char* file){
    this->file = file;
    currentPosition = 0;
    currentChar = file[currentPosition];
}




#endif

