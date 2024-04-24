#include "lexer.h"
#include <fstream>
#include <iostream>


int main(int argc, char *argv[]){
    if(argc <= 1){
        std::cout << "No arguments is Provided\n\t./mips [Name of File.mips]." << std::endl;
        return -1;
    }

    char c;
    std::vector<char> content;
    std::ifstream file(argv[1]);
    if(file.is_open()){
        while(file.get(c)){
            content.push_back(c);
        }
    }
    std::vector<Token> temp;
    Lexer lexer(content.data(), content.size());
    std::vector<Token> toks = lexer.analizeFile(temp);
    for(Token tok : toks){
        std::cout << "token type: " << tok.tokenType << std::endl;
        std::cout << "Sub type: " << tok.subType << std::endl;
        std::cout << "Data: " << tok.data << std::endl;
        std::cout << std::endl;
    }
    return 0;
}