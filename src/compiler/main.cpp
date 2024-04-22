#include "lexer.h"
#include <fstream>
#include <iostream>


int main(){
    char c;
    std::vector<char> content;
    std::ifstream file("test.c");
    if(file.is_open()){
        while(file.get(c)){
            content.push_back(c);
        }
    }
    std::vector<Token> temp;
    Lexer lexer(content.data(), content.size());
    lexer.analizeFile(temp);
    return 1;
}