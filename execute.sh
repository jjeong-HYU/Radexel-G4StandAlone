#! /bin/bash
set -e

G4_PATH_TOP=${PWD}

Install_pre(){
    echo "Wanna install gcc, g++, Qt5, and etc. @ apt? (1:yes / 2:no): "
    read option_bashrc
    if [ $option_bashrc -eq 1 ]; then
	    sudo apt -y update
	    sudo apt -y upgrade
	    sudo apt -y install gcc g++ build-essential libexpat1-dev qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libxmu-dev
    fi
}

SetupEnv(){
    export G4_PATH_TOP=${PWD}
    touch ${G4_PATH_TOP}/setG4Env.sh
    cat /dev/null > ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4_PATH_TOP=${PWD}' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export LD_LIBRARY_PATH=${G4_PATH_TOP}/lib-clhep:${G4_PATH_TOP}/lib_G4:${LD_LIBRARY_PATH}' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4LEVELGAMMADATA=${G4_PATH_TOP}/data-g4/PhotonEvaporation5.7' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4LEDATA=${G4_PATH_TOP}/data-g4/G4EMLOW8.2' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4NEUTRONHPDATA=${G4_PATH_TOP}/data-g4/G4NDL4.7' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4ENSDFSTATEDATA=${G4_PATH_TOP}/data-g4/G4ENSDFSTATE2.3' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4RADIOACTIVEDATA=${G4_PATH_TOP}/data-g4/RadioactiveDecay5.6' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4ABLADATA=${G4_PATH_TOP}/data-g4/G4ABLA3.1' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4PIIDATA=${G4_PATH_TOP}/data-g4/G4PII1.3' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4PARTICLEXSDATA=${G4_PATH_TOP}/data-g4/G4PARTICLEXS4.0' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4SAIDXSDATA=${G4_PATH_TOP}/data-g4/G4SAIDDATA2.0' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4REALSURFACEDATA=${G4_PATH_TOP}/data-g4/RealSurface2.2' >> ${G4_PATH_TOP}/setG4Env.sh
    echo 'export G4INCLDATA=${G4_PATH_TOP}/data-g4/G4INCL1.0' >> ${G4_PATH_TOP}/setG4Env.sh
    echo "Adding setG4Env.sh to ./bashrc? (1:yes / 2:no): "
    read option_bashrc
    if [ $option_bashrc -eq 1 ]; then
        export
        echo 'source ${G4_PATH_TOP}/setG4Env.sh' >> ~/.bashrc
        source ~/.bashrc
    fi
}

Install_pre
SetupEnv
chmod +500 setG4Env.sh
source setG4Env.sh
./exampleB1
