#ifndef AST_H
#define AST_H

#include "tokens.h"
#include <vector>
#include <map>
#include <string>

enum NodeType{
    NODE_TYPE_NULL,

    MAIN,

    STATEMENT,
    CONDITION,
    LOOP,
};


enum NodeSubType{
    NODE_SUB_TYPE_NULL,

    IF_CONDITION,
    ELSE_CONDITION,
    ELSE_IF_CONDITION,

    FOR_LOOP,
    WHILE_LOOP,
};




struct ASTNode{
    NodeType nodeType;
    NodeSubType nodeSubType;
    std::vector<Token> nodeData;
    std::vector<ASTNode> childNodes;

    ASTNode(){
        
    }

    ASTNode(NodeType nodeType, NodeSubType nodeSubType, std::vector<Token> nodeData){
        this->nodeType = nodeType;
        this->nodeSubType = nodeSubType;
        this->nodeData = nodeData;
    }

    ASTNode(NodeType nodeType, NodeSubType nodeSubType, std::vector<Token> nodeData, std::vector<ASTNode> childNodes){
        this->nodeType = nodeType;
        this->nodeSubType = nodeSubType;
        this->nodeData = nodeData;
        this->childNodes = childNodes;
    }
};


#endif

