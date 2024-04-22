#ifndef TOKENS_H
#define TOKENS_H


#include <string>
#include <map>


enum TokenType{
    IDENTIFIER,
    KEYWORD,
    SEPARATOR,
    OPERATOR,
    LITERAL
};

enum SubType{
    // identifier tokens
    VARIABLE,

    // keyword tokens
    BREAK,
    ELSE,
    LONG,
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



const std::map<SubType, std::string> SubTypeMap = 
{
    {BREAK, "break"},
    {ELSE, "else"},
    {LONG, "long"},
    {CHAR, "char"},
    {RETURN, "return"},
    {GOTO, "goto"},
    {DO, "do"},
    {IF, "if"},
    {WHILE, "while"},
    {FOR, "for"},

    {WHITE_SPACE, " "},
    {SEMICOLON, ";"},
    {CURLY_BRACKETS_LEFT, "}"},
    {CURLY_BRACKETS_RIGHT, "{"},
    {SQUARE_BRACKETS_LEFT, "]"},
    {SQUARE_BRACKETS_RIGHT, "["},
    {ROUND_BRACKETS_LEFT, ")"},
    {ROUND_BRACKETS_RIGHT, "("},

    {ADDITTION, "+"},
    {SUBSTRACTION, "-"},
    {MULTIBLICATION, "*"},
    {DIVISION, "/"},
    {ASSIGNMENT, "="},
    {GREATER_THAN, ">"},
    {LESS_THAN, "<"},
    {EQUAL, "=="},
    {NOT_EQUAL, "!="},
    {NOT, "!"},
    {MEMBER_ACCESS, "."},
};




struct Token
{
    TokenType tokenType;
    SubType subType;
    std::string data;

    Token(TokenType tokenType, SubType subType, std::string data)
    {
        this->tokenType = tokenType;
        this->subType = subType;
        this->data = data;
    }
};




#endif

