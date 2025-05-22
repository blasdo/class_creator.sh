#!/bin/bash

NAME=$(echo $1 | tr '[:upper:]' '[:lower:]');
CLASSFILE=$1.hpp

if [[ $2 ]]; then
	INHERENCE=": public $2"
	I_INCLUDE="# include \"$2.hpp\""
	fi

create_class_file()
{
	cat ~/.local/etc/class_creator/blueprint.hpp | sed 's/CLASSNAME_H/'"$1"'_H/g'\
	| sed 's/$CLASSNAME/'$1'/g' | sed 's/$classname/'$2'/g'\
		| sed 's/$INHERENCE/'"$INHERENCE"'/g' | sed 's/$I_INCLUDE/'"$I_INCLUDE"'/g'> $1.hpp
	cat ~/.local/etc/class_creator/blueprint.cpp | sed 's/$CLASSNAME/'$1'/g' | sed 's/$classname/'$2'/g' | sed 's/$CLASSFILE/'$CLASSFILE'/g' > $1.cpp
}

if [[ $1 ]]; then
	if [[ -a "$1.cpp" || -a "$1.hpp" ]]; then
		echo "Error: $1.cpp or $1.hpp already exists. Aborting to prevent overwrite"
		exit 1
	fi
	create_class_file $1 $NAME
	echo "The class file has been sucessfully created"
else
	echo "ERROR: Argumtents are needed."
	echo "USAGE: classcreator.sh classname [inherence]"
fi