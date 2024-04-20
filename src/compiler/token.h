
#include <string>


struct IdentifierToken:Token{
    IdentifierToken(std::string data){
        this->data = data;
    }
};

struct KeywordToken:Token{
    KeywordToken(std::string data){
        this->data = data;
    }
};

struct SeparatorToken:Token{
    SeparatorToken(std::string data){
        this->data = data;
    }
};

struct OperatorToken:Token{
    OperatorToken(std::string data){
        this->data = data;
    }
};

struct LiteralToken:Token{
    LiteralToken(std::string data){
        this->data = data;
    }
};



struct Token
{
    const char* tokenType;
    const char* subType;
    std::string data;
};
