#include "lexer.h"
#include <fstream>
#include <streambuf>
#include <iostream>


int main(){
    std::ifstream file("test.c");
    std::string contents((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    std::vector<Token> temp;
    Lexer lexer(contents.c_str());
    lexer.analizeFile(temp);
}