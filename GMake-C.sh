function gmake_new() {
    echo -n "Enter project name: "
    read projname
    mkdir $projname
}

function gmake_prep() {
    mkdir $projname/source
    mkdir $projname/includes
    mkdir $projname/documentation
    mkdir $projname/binaries
    touch $projname/source/main.c

    echo "#include <stdio.h>" | tee $projname/source/main.c >/dev/null
    echo "" | tee -a $projname/source/main.c >/dev/null
    echo "int main() {" | tee -a $projname/source/main.c >/dev/null
    echo "}" | tee -a $projname/source/main.c >/dev/null
}

function gmake_source() {
    echo -n "Enter file name: "
    read filename

    touch $projname/includes/$filename.h
    touch $projname/source/$filename.c 

    echo "#include <stdio.h>" | tee $projname/source/$filename.c >/dev/null
    echo "#include \"../includes/$filename.h\"" | tee -a $projname/source/$filename.c >/dev/null

    echo "#pragma once" | tee $projname/includes/$filename.h >/dev/null
}

function gmake_build_c() {
    gcc -o $projname/binaries/main $projname/source/*.c
}

function gmake_run_c() {
    $projname/binaries/main
}