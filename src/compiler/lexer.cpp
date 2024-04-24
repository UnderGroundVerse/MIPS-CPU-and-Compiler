#ifndef LEXER_CPP
#define LEXER_CPP

#include "lexer.h"
#include <iostream>
#include <regex>


#define STRING_LITERAL_REGEX    "^(\"|\')(\w*\d*)(\"|\')$"
#define VARIABLE_REGEX          "^([A-Z]|[a-z])+(_*|[0-9]|[A-Z]|[a-z])*$"
#define NUM_LITERAL_REGEX       "^[0-9]+(\.*)*[0-9]*$"

int Lexer::analizeFile(std::vector<Token> out){

    std::vector<Token> tokens;

    do{
        std::string resultString = ""+currentChar;
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

        tokens.push_back(buildToken(resultString));
        
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
    if(c == '\'' || c == '"'){
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

bool Lexer::categorizeString(std::string input, TokenType* tokenType, TokenSubType* subType){
    if(std::regex_match(input, std::regex(STRING_LITERAL_REGEX))){
        *tokenType = LITERAL;
        *subType = STRING_LITERAL;
    }
    else if(std::regex_match(input, std::regex(VARIABLE_REGEX))){
        *tokenType = IDENTIFIER;
        *subType = VARIABLE;
    }
    else if(std::regex_match(input, std::regex(NUM_LITERAL_REGEX))){
        *tokenType = LITERAL;
        *subType = NUMBER_LITERAL;
    }
    else{
        *subType = StringSubTypeMap[input];
        for(TokenSubType sub : KeywordTokenSubTypes){
            if(sub == *subType)
                *tokenType = IDENTIFIER;
        }
        for(TokenSubType sub : SeparatorTokenSubTypes){
            if(sub == *subType){
                *tokenType = SEPARATOR;
            }
        }
        for(TokenSubType sub : OperatorTokenSubTypes){
            if(sub == *subType){
                *tokenType == OPERATOR;
            }
        }
    }
}

Token Lexer::buildToken(std::string input){
    TokenType tokenType;
    TokenSubType subType;
    categorizeString(input, &tokenType, &subType);
    return Token(tokenType, subType, input);
}

Lexer::Lexer(const char* file, int fileSize){
    this->file = file;
    this->fileSize = fileSize;
    this->currentPosition = 0;
    this->currentChar = file[currentPosition];
}




#endif

