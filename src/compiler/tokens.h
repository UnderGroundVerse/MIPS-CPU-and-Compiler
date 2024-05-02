#ifndef TOKENS_H
#define TOKENS_H


#include <string>
#include <map>


enum TokenType{
    TOKEN_TYPE_NULL,
    IDENTIFIER,
    KEYWORD,
    SEPARATOR,
    OPERATOR,
    LITERAL,
};

enum TokenSubType{
    TOKEN_SUB_TYPE_NULL,

    // identifier tokens
    VARIABLE,

    // keyword tokens
    BREAK,
    ELSE,
    ELSEIF,
    LONG,
    INT,
    CHAR,
    RETURN,
    GOTO,
    DO,
    IF,
    WHILE,
    FOR,

    // separator tokens

    WHITE_SPACE,
    SEMICOLON,
    CURLY_BRACKETS_LEFT,
    CURLY_BRACKETS_RIGHT,
    SQUARE_BRACKETS_LEFT,
    SQUARE_BRACKETS_RIGHT,
    ROUND_BRACKETS_LEFT,
    ROUND_BRACKETS_RIGHT,


    // operator tokens

    ADDITTION,
    SUBSTRACTION,
    MULTIBLICATION,
    DIVISION,
    ASSIGNMENT,
    GREATER_THAN,
    LESS_THAN,
    EQUAL,
    NOT_EQUAL,
    NOT,
    MEMBER_ACCESS,

    // literal tokens

    NUMBER_LITERAL,
    STRING_LITERAL,
    CHAR_LITERAL

};


const std::string NumLiterals = "0123456789";
const std::string CharLiterals = "abcdefghijklmnopqrstuvwxyz";
const std::string SpecialChars = ",.;{}()[] !@#$%^&*_-=<>/|";
const std::string operators = "=!\\|<>-*&^%/";



extern std::map<std::string, TokenSubType> StringSubTypeMap;


const TokenSubType KeywordTokenSubTypes[] = 
{   
    BREAK, 
    ELSE, 
    ELSEIF,
    LONG, 
    INT, 
    CHAR, 
    RETURN, 
    GOTO, 
    DO, 
    IF, 
    WHILE, 
    FOR
};


const TokenSubType SeparatorTokenSubTypes[] = 
{
    WHITE_SPACE, 
    SEMICOLON, 
    CURLY_BRACKETS_LEFT, 
    CURLY_BRACKETS_RIGHT, 
    SQUARE_BRACKETS_LEFT, 
    SQUARE_BRACKETS_RIGHT, 
    ROUND_BRACKETS_LEFT, 
    ROUND_BRACKETS_RIGHT
};


const TokenSubType OperatorTokenSubTypes[] = 
{
    ADDITTION,
    SUBSTRACTION,
    MULTIBLICATION,
    DIVISION,
    ASSIGNMENT,
    GREATER_THAN,
    LESS_THAN,
    EQUAL,
    NOT_EQUAL,
    NOT,
    MEMBER_ACCESS
};




struct Token
{
    TokenType tokenType;
    TokenSubType subType;
    std::string data;

    Token(){

    }

    Token(TokenType tokenType, TokenSubType subType, std::string data)
    {
        this->tokenType = tokenType;
        this->subType = subType;
        this->data = data;
    }
};




#endif

