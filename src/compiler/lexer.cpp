#ifndef LEXER_CPP
#define LEXER_CPP

#include "lexer.h"
#include <iostream>

int Lexer::analizeFile(std::vector<Token> out){

    do{
        if(isChar(currentChar)){
            std::string stringLiteral = buildStringLiteral();
            std::cout << stringLiteral << std::endl;
        }
        else if (isNum(currentChar)){
            std::string numberLiteral = buildNumberLiteral();
            std::cout << numberLiteral << std::endl;
        }
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

bool Lexer::retreat(){
    if(currentPosition > 0){
        currentPosition--;
        currentChar = file[currentPosition];
    }
    else
        return false;
    return true;
}



bool Lexer::isChar(char c){
    for(int i = 0; i < CharLiterals.length(); i ++){
        if(c == CharLiterals[i])
            return true;
    }
    return false;
}

bool Lexer::isNum(char c){
    for(int i = 0; i < NumLiterals.length(); i ++ ){
        if(c == NumLiterals[i])
            return true;
    }
    return false;
}


std::string Lexer::buildStringLiteral(){
    std::string result = "";
    do{
        result += currentChar;
    }while(advance() && (isChar(currentChar) || isNum(currentChar)));
    retreat();
    return result;
}

std::string Lexer::buildNumberLiteral(){
    std::string result = "";
    do{
        result += currentChar;
    }while(advance() && isNum(currentChar));
    retreat();
    return result;
}

Lexer::Lexer(const char* file, int fileSize){
    this->file = file;
    this->fileSize = fileSize;
    this->currentPosition = 0;
    this->currentChar = file[currentPosition];
}




#endif

