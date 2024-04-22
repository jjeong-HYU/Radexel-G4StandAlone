# Radexel-G4StandAlone
This repository provides the shell-script to configure the environment which allows executing compiled G4 codes without installing Geant4 source code.

(Ubuntu20.06.04LTS+G4.11.1.p01+CLHEP-2.4.6.2)

How to use
===========================

### Install command

    git clone https://github.com/jjeong-HYU/Radexel-G4StandAlone
    cd Radexel-G4StandAlone
    chmod +x execute.sh
    ./execute.sh

#### Option
    If it is first time to execute 'execute.sh', I recommend to type "1" for all option.
    If so, you can execute any compiled G4 file like below,
    
    ./exampleB1
    
    Otherwise, you need to execute setG4Env.sh for every command window.
    
    source setG4Env.sh
    ./exampleB1

