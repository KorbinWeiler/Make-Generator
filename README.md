# Makefile Generator
## Description
This tool provides a simple command-line interface for generating a basic, ready-to-use Makefile with minimal setup. It's perfect for beginners who want to avoid the complexity of Makefile syntax, as well as experienced developers who want to skip the repetitive work of setting one up from scratch.
## Installation
1. Run `git clone https://github.com/KorbinWeiler/Make-Generator.git`
2. Clone the repo
3. Enter the folder with `cd Make-Generator`
4. Run `bash setup.sh`
5. Restart your terminal to apply environment changes

## Running the Generator
- Run the command `genm "Project_Name" "File_Path"`

Project_Name and File_Path are optional parameters. 

If not provided, Project_Name defaults to "Project" and File_Path defaults to the current working directory.

## Changing Values in The Makefile

### Default Values
The Makefile has 3 default characteristics that you can change. **File Type**, **Flags**, and **Compiler**. The default values are **.cpp**, **-Wall -Wextra -std=c++17**, and **g++**.

### To Modify These Values
- Open up **.genm.sh** in the repo folder
- Find the values located on lines 3-5 and update them to fit your needs
- Save your changes
- Restart your terminal to load your new changes

## Restrictions
- This command does not currently work with powershell
- Only a basic Makefile is created and may not work for larger applications
- Relies on the user either having a c/c++ compiler and Make installed already (it will not install these for you)