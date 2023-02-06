function gmake() {
    mkdir bin
    mkdir docs
    mkdir src
    mkdir includes
    mkdir bin/main-exec
    mkdir bin/updates
    touch src/main.cpp
    echo "#include <iostream>" | tee src/main.cpp >/dev/null
    echo "int main() {}" | tee -a src/main.cpp >/dev/null
}

function gmake_build() {
    g++ -o ~/Documents/bin/main-exec/main src/*.cpp
}

function gmake_proj() {
    touch docs/README
    touch docs/NOTES
    touch docs/VERSION
    touch docs/LICENSE
    touch docs/ABOUT
}

function gmake_new_class() {
    echo -n "Enter class name: "
    read cname
    touch includes/$cname.h
    touch src/$cname.cpp

    echo "#pragma once" | tee includes/$cname.h >/dev/null
    echo "class $cname {
        public:
            $cname() {}
};" | tee -a includes/$cname.h >/dev/null

    echo "#include <iostream> " | tee src/$cname.cpp >/dev/null
    echo "#include \"../includes/$cname.h\"" | tee -a src/$cname.cpp >/dev/null
}

function gmake_run_main() {
    bin/main-exec/main
}

function gmake_help() {
    echo "Always run gmake and its commands only in the Documents folder."
}
