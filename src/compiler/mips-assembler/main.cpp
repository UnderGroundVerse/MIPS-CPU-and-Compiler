#include<iostream>
#include<Fstream>
#include<string>
#include "asm.h"
#include "asm.cpp"
int main(){
    std::string filepath="../file.txt";
    bool assemblyControl=false;
    std::ifstream file(filepath);
    if (!file.is_open()) {
        std::cerr << "Failed to open file: " << filepath << std::endl ;

        return 1;
    }
    std::string line;
    Asm a;
    while(getline(file,line)){
        if(line==".text"){
            assemblyControl=true;
            continue;
        }
        if(assemblyControl==true){
            a.pushpush(line);
        }

    }   
    
    file.close();
    a.interpret();
    for(int i=0;i<a.instruction.size();i++){
        std::cout<< a.instruction[i] << std::endl;
    }
    //modify instructions to match with the VHDL modules
    //ofstream machine code into a text file
    



    return 0;
}