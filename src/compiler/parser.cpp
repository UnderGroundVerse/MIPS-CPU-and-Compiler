

#include "parser.h"
#include <iostream>




Parser::Parser(std::vector<Token> tokens){
    this->tokens = tokens;
    this->currentToken = tokens[0];
    this->position = 0;
}

bool Parser::advance(){
    if(position >= tokens.size()-1){
        return false;
    }
    position ++;
    currentToken = tokens[position];
    return true;
}

std::vector<Token> Parser::getTokens(TokenSubType stopingSubType){
    std::vector<Token> result;
    while(currentToken.subType != stopingSubType){
        result.push_back(currentToken);
        advance();
    }
    return result;
}


ASTNode Parser::buildStatement(){
    NodeType nodeType = STATEMENT;
    NodeSubType nodeSubType = NODE_SUB_TYPE_NULL;

    std::vector<Token> statementTokens = getTokens(SEMICOLON);

    return ASTNode(nodeType, nodeSubType, statementTokens);
}

ASTNode Parser::buildIfCondition(){
    NodeType nodeType = CONDITION;
    NodeSubType nodeSubType = NODE_SUB_TYPE_NULL;

    std::vector<Token> conditionTokens;

    std::cout << "IN" << std::endl;

    if(currentToken.subType == IF){
        nodeSubType = IF_CONDITION;
        advance();
        conditionTokens = getTokens(ROUND_BRACKETS_LEFT);
    } else if( currentToken.subType == ELSEIF){
        nodeSubType = ELSE_IF_CONDITION;
        advance();
        conditionTokens = getTokens(ROUND_BRACKETS_LEFT);
    } else if(currentToken.subType == ELSE){
        nodeSubType = ELSE_CONDITION;
        advance();
    }

    advance();
    
    std::vector<ASTNode> nodes = captureNodes(CURLY_BRACKETS_LEFT);

    return ASTNode(nodeType, nodeSubType, conditionTokens, nodes);
}

std::vector<ASTNode> Parser::captureNodes(TokenSubType stopingSubtype){
    std::vector<ASTNode> nodes;
    while(currentToken.subType != stopingSubtype){
        if(currentToken.tokenType == IDENTIFIER){
            if(currentToken.subType == VARIABLE){
                nodes.push_back(buildStatement());
            }
        } else if(currentToken.tokenType == KEYWORD){
            if(currentToken.subType == IF || currentToken.subType == ELSEIF || currentToken.subType == ELSE){
                nodes.push_back(buildIfCondition());
            }else if(currentToken.subType == WHILE){
                nodes.push_back(buildWhileLoop());
            }else if(currentToken.subType == FOR){
                nodes.push_back(buildForLoop());
            }
        }
        advance();
    }
    return nodes;
}

ASTNode Parser::parseTokens(){
    std::vector<ASTNode> nodes;
    if(currentToken.subType == CURLY_BRACKETS_RIGHT){
        advance();
        nodes = captureNodes(CURLY_BRACKETS_LEFT);
    }
    return ASTNode(MAIN, NODE_SUB_TYPE_NULL, std::vector<Token>(), nodes);
}

ASTNode Parser::buildWhileLoop(){

}

ASTNode Parser::buildForLoop(){

}

