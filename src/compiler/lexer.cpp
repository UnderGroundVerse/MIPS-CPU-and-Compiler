#ifndef LEXER_CPP
#define LEXER_CPP

#include "lexer.h"
#include <iostream>

int Lexer::analizeFile(std::vector<Token> out){

    do{
        std::string resultString;
        if(isQuotation(currentChar)){
            std::string resultString = buildStringLiteral();
            std::cout << resultString << std::endl;
        }
        if(isChar(currentChar)){
            std::string resultString = buildString();
            std::cout << resultString << std::endl;
        }
        else if (isNum(currentChar)){
            std::string resultString = buildNumber();
            std::cout << resultString << std::endl;
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

bool Lexer::isQuotation(char c){
    if((int)c == (int)"'" || (int)c == (int)'"'){
        return true;
    }
    return false;
}

bool Lexer::isSpecialChar(char c){
    for(int i = 0; i < SpecialChars.length(); i ++ ){
        if(c == SpecialChars[i])
            return true;
    }
    return false;
}


std::string Lexer::buildString(){
    std::string result = "";
    do{
        result += currentChar;
    }while(advance() && (isChar(currentChar) || isNum(currentChar)));
    retreat();
    return result;
}

std::string Lexer::buildNumber(){
    std::string result = "";
    do{
        result += currentChar;
    }while(advance() && isNum(currentChar));
    retreat();
    return result;
}

std::string Lexer::buildStringLiteral(){
    char qoutation = currentChar;
    advance();
    std::string result = "";
    do{
        result += currentChar;
    }while(advance() && (isChar(currentChar) || isNum(currentChar)) || isSpecialChar(currentChar));
    
    if(currentChar == qoutation){
        return qoutation + result + qoutation;
    }
    return "";
}

bool Lexer::categorizeString(std::string input, TokenType* tokenType, SubType* SubType){
    
}

Lexer::Lexer(const char* file, int fileSize){
    this->file = file;
    this->fileSize = fileSize;
    this->currentPosition = 0;
    this->currentChar = file[currentPosition];
}




#endif

