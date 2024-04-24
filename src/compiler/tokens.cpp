#include "tokens.h"



std::map<std::string, TokenSubType> StringSubTypeMap = 
{
    {"break", BREAK},
    {"else", ELSE},
    {"long", LONG},
    {"int", INT},
    {"char", CHAR},
    {"return", RETURN},
    {"goto", GOTO},
    {"do", DO},
    {"if", IF},
    {"while", WHILE},
    {"for", FOR},

    {" ", WHITE_SPACE},
    {";", SEMICOLON},
    {"}", CURLY_BRACKETS_LEFT},
    {"{", CURLY_BRACKETS_RIGHT},
    {"]", SQUARE_BRACKETS_LEFT},
    {"[", SQUARE_BRACKETS_RIGHT},
    {"]", ROUND_BRACKETS_LEFT},
    {"[", ROUND_BRACKETS_RIGHT},

    {"+", ADDITTION},
    {"-", SUBSTRACTION},
    {"*", MULTIBLICATION},
    {"/", DIVISION},
    {"=", ASSIGNMENT},
    {">", GREATER_THAN},
    {"<", LESS_THAN},
    {"==", EQUAL},
    {"!=", NOT_EQUAL},
    {"!", NOT},
    {".", MEMBER_ACCESS},
};