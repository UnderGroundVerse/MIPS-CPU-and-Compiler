#ifndef ASM_H
#define ASM_H

#include<iostream>
#include<vector>
#include<string>

class Asm{
    private:
        int linePosition;
        std::string op;
        std::string opcode;
        bool instInterpreted;
        std::vector<std::string> programStack;
        std::string rd_address;  
        std::string rd;

        std::string rs_address;
        std::string rs;


        std::string rt; 
        std::string rt_address;
        void interpretInstruction();
        void cctInstruction(std::string shamt,std::string func);


    public:
      Asm();
      void pushpush(std::string);
      void interpret();
      std::vector<std::string> instruction;

};






#endif