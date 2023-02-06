function gmake() {
    echo -n "Enter projname: "
    read project
    mkdir $project
    mkdir $project/bin
    mkdir $project/docs
    mkdir $project/src
    mkdir $project/headers
    touch $project/src/main.cpp
    echo "#include <iostream>" | tee $project/src/main.cpp >/dev/null
    echo "int main() {}" | tee -a $project/src/main.cpp >/dev/null
}

function gmake_build() {
    g++ -o $project/bin/main src/*.cpp
}

function gmake_proj() {
    touch docs/README
    touch docs/NOTES
    touch docs/VERSION
    touch docs/LICENSE
    touch docs/ABOUT

    echo -n "Enter project name: "
    read projname
    echo -n "Enter author/developer: "
    read developer
    echo "$projname" | tee $project/docs/ABOUT >/dev/null
    echo "$developer" | tee -a $project/docs/ABOUT >/dev/null 
}

function gmake_class() {
    echo -n "Enter class name: "
    read cname
    touch $project/headers/$cname.h
    touch $project/src/$cname.cpp

    echo "#pragma once" | tee $project/headers/$cname.h >/dev/null
    echo "#define _CLASS_ \"$cname\"" | tee -a $project/headers/$cname.h >/dev/null
    echo "" | tee -a $project/headers/$cname.h >/dev/null
    echo "class $cname {
        public:
            $cname();
};" | tee -a $project/headers/$cname.h >/dev/null

    echo "#include <iostream> " | tee $project/src/$cname.cpp >/dev/null
    echo "#include \"../headers/$cname.h\"" | tee -a $project/src/$cname.cpp >/dev/null
    echo "" | tee -a $project/src/$cname.cpp >/dev/null
    echo "$cname::$cname() {

}" | tee -a $project/src/$cname.cpp >/dev/null
}

function gmake_run() {
    bin/main
}

function gmake_help() {
    echo "Run GMake in the parent directory of the project"
}
