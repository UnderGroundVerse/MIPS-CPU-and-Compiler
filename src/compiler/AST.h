#ifndef AST_H
#define AST_H


#include <vector>


enum NodeType{
    NODE_TYPE_NULL,

    STATEMENT,
    CONDITION,
    LOOP,
};


enum NodeSubType{
    NODE_SUB_TYPE_NULL,

    INTIALIZATION,
    DECLARATION,
    ASSIGNMENT,

    IF_CONDITION,
    ELSE_CONDITION,
    ELSE_IF_CONDITION,

    FOR_LOOP,
    WHILE_LOOP,
};

enum NodeData{
    NODE_DATA_NULL,

    VARIABLE,
    OPERAND,
    OPERATOR,

};


NodeSubType StatementSubTypes[] = {
    INTIALIZATION,
    DECLARATION,
    ASSIGNMENT
};

NodeSubType ConditionSubType[] = {
    IF_CONDITION,
    ELSE_CONDITION,
    ELSE_IF_CONDITION
};

NodeSubType LoopSubType[] = {
    FOR_LOOP,
    WHILE_LOOP
};

NodeData StatementData[] = {
    VARIABLE,
    OPERAND,
    OPERATOR
};


struct ASTNode{
    NodeType nodeType;
    NodeSubType nodeSubType;
    NodeData nodeData;
    std::vector<ASTNode> childNodes;

    ASTNode(NodeType nodeType, NodeSubType nodeSubType, NodeData nodeData){
        this->nodeType = nodeType;
        this->nodeSubType = nodeSubType;
        this->nodeData = nodeData;
    }
};


#endif

