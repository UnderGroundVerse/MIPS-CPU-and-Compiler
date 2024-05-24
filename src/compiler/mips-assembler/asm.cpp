#ifndef ASM_CPP
#define ASM_CPP
#include<map>
#include "asm.h"
#include<string>

std::map <std::string,std::string> instructionMap={
    {"inp","000000"},
    {"mov","000001"},
    {"mul","000010"},
    {"skp","000011"},
    {"bun","000100"},
    {"out","000101"},
    {"move","000110"}
};

std::map <std::string,std::string> regAddressMap={
    {"0","00000"},
    {"at","00001"},
    {"v0","00010"},
    {"v1","00011"},
    {"a0","00100"},
    {"a1","00101"},
    {"a2","00110"},
    {"a3","00111"},
    {"t0","01000"},
    {"t1","01001"},
    {"t2","01010"},
    {"t3","01011"},
    {"t4","01100"},
    {"t5","01101"},
    {"t6","01110"},
    {"t7","01111"},
    {"s0","10000"},
    {"s1","10001"},
    {"s2","10010"},
    {"s3","10011"},
    {"s4","10100"},
    {"s5","10101"},
    {"s6","10110"},
    {"s7","10111"},
    {"t8","11000"},
    {"t9","11001"},
    {"k0","11010"},
    {"k1","11011"},
    {"gp","11100"},
    {"sp","11101"},
    {"fp","11110"},
    {"ra","11111"}

};


void Asm::pushpush(std::string item){
    programStack.push_back(item);
};


Asm::Asm(){
    linePosition=1;
    op="";
    opcode="";
    instInterpreted=false;
};



void Asm::interpretInstruction(){
    opcode= instructionMap[op];
};



void Asm::cctInstruction(std::string shamt,std::string func){
    instruction.push_back(opcode + rs_address + rt_address + rd_address + shamt + func);
};


void Asm::interpret(){
    int registerCounter=0;
    int j;
    int k;
    for(int i=0;i<programStack.size();i++){//modify warning
        if(!instInterpreted){
            for( j=0;j<programStack[i].length();j++){
                if(programStack[i][j]==' ' && (j=0 || programStack[i][j-1]==' ')){
                    continue;
                }
                while(programStack[i][j]>='a' && programStack[i][j]<='z'){
                   
                        op.push_back(programStack[i][j]);
                        j++; 
                }
                    interpretInstruction();
                    if(programStack[i][j]==' '){
                        instInterpreted=true;
                        break;
                    }
  
            }
        }


        if(instInterpreted){
            //in case of r-type
            for(k=j;k<programStack[i].length();k++){
                
                if(programStack[i][k]=='$' && registerCounter==0 ){
                    rs.push_back(programStack[i][k+1]);
                    rs.push_back(programStack[i][k+2]);

                    k+=2;
                            
                }
                else if(programStack[i][k]=='$' && registerCounter==1 ){
                    rt.push_back(programStack[i][k+1]);
                    rt.push_back(programStack[i][k+2]);
                    k+=2;
                            
                }
                else if(programStack[i][k]=='$' && registerCounter==2 ){
                    rd.push_back(programStack[i][k+1]);
                    rd.push_back(programStack[i][k+2]);
                    k+=2;
                            
                }
                else if(programStack[i][k]==','){
                    registerCounter++;
                }
                
                else{
                    //error
                }
            }
            registerCounter=0;
            j=0;
            k=0;
            rs_address = regAddressMap[rs];
            rt_address = regAddressMap[rt];
            rd_address = regAddressMap[rd];

        }
        cctInstruction("00000","000000");
        rd="";
        rs="";
        rt="";
        op="";
        opcode="";
        rs_address="";
        rd_address="";
        rt_address="";
        instInterpreted=false;
    }

    
};



#endif