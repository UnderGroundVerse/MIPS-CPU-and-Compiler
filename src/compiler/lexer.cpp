#ifndef LEXER_CPP
#define LEXER_CPP

#include "lexer.h"
#include <iostream>

int Lexer::analizeFile(std::vector<Token> out){

    do{
        std::cout << currentChar << std::endl;
    }while (advance());
}

bool Lexer::advance(){
    if(currentPosition < fileSize)
    {
        currentPosition++;
        currentChar = file[currentPosition];
    }
    else
        return false;
    return true;
}

Lexer::Lexer(const char* file, int fileSize){
    this->file = file;
    this->fileSize = fileSize;
    this->currentPosition = 0;
    this->currentChar = file[currentPosition];
}




#endif

