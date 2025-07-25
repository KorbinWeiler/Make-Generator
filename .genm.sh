#!user/bin/bash

FILE_TYPE=".cpp"
FLAGS="-Wall -Wextra -std=c++17"
COMPILER="g++"

__write_to_Make(){
    printf "$1\n" >> $make_path
}

__add_file(){
    name=${1%.c*}
    objs="$objs $name.o"
}

objs=""

genm() {
    Cur_Path=""
    Project_Name=""

    if [ "$1" ]; then
        Project_Name=$1
    else
        Project_Name="Project"
    fi

    if [ "$2" ]; then
        Cur_Path=$2
    else
        Cur_Path=$(realpath .)
    fi

    if [ -e $Cur_Path ]; then
        if [ ! -e "MakeFile" ]; then
            touch $Cur_Path/Makefile
        fi

        make_path=$Cur_Path/Makefile

        : > $make_path

        __write_to_Make "CXX := $COMPILER"
        __write_to_Make "CXXFLAGS := $FLAGS"

        __write_to_Make "TARGET := $Project_Name"

        SRC_FILES=$(find . -type f -name "*$FILE_TYPE")

        for file in $SRC_FILES; do
            __add_file $file
        done

        __write_to_Make "all: $objs"
		__write_to_Make "\t\$(CXX) \$^ -o $Project_Name"

        __write_to_Make "%%.o: %%$FILE_TYPE"
		__write_to_Make "\t\$(CXX) -c \$(CXXFLAGS) \$< -o \$@"

        __write_to_Make "clean:"
		__write_to_Make "\trm -f *.o $Project_Name"

    else
        echo "Path does not exist."
    fi
}