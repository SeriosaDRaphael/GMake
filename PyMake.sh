function py_make() {
    echo -n "Enter project name: "
    read projname
    mkdir $projname

    touch $projname/main.py

    echo "print(\"$projname\")" | tee $projname/main.py >/dev/null
}

function py_run() {
    python3 $projname/main.py
}