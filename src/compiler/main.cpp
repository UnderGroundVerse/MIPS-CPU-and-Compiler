#include "lexer.h"
#include "parser.h"
#include <fstream>
#include <iostream>
#include <regex>


#define FILE_NAME_REGEX "(.+)\.mips"

void printTokens(std::vector<Token> tokens){
    for(Token token : tokens){
        std::cout << "\ttoken type: " << token.tokenType << std::endl;
        std::cout << "\tSub type: " << token.subType << std::endl;
        std::cout << "\tData: " << token.data << std::endl;
        std::cout << std::endl;
    }
}


void printASTNodes(ASTNode node, int num){
    std::cout << "NODE NUM: " << num << std::endl;
    std::cout << "Node Type: " << node.nodeType << std::endl;
    std::cout << "Node SubType: " << node.nodeSubType << std::endl;
    std::cout << "Node Data: " << std::endl;
    printTokens(node.nodeData); 
    int i = 0;
    std::cout << "ROOT: " << num << std::endl;
    for(ASTNode n : node.childNodes){
        printASTNodes(n, i);
        i++;
    }
}


int main(int argc, char *argv[]){
    if(argc != 2){
        std::cout << "Undefined Arguments:\n\t./mips [Name-of-File.mips]." << std::endl;
        return -1;
    }

    if(!std::regex_match(argv[1], std::regex(FILE_NAME_REGEX))){
        std::cout << "File Type is Not Supported:\n\t./mips [Name-of-File.mips]" << std::endl;
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
    Lexer lexer(content.data(), content.size());
    std::vector<Token> toks = lexer.analizeFile();
    printTokens(toks);

    Parser parser(toks);
    ASTNode astNode = parser.parseTokens();
    printASTNodes(astNode, 0);

    return 0;
}