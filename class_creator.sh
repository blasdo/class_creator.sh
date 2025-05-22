#!/bin/bash

DebugMode=1

while [[ $1 == -* ]]; do
	if [[ $1 == "-n" ]] || [[ $1 == "--no-debug" ]]; then
		DebugMode=0;
	else
		echo "Invalid args"
		exit 1;
	fi
	shift 1;
done

if [[ $2 ]]; then
	INHERENCE=": public $2"
	I_INCLUDE="# include \"$2.hpp\""
	fi

CLASSFILE=$1.hpp

create_dot_h()
{
	PROTECT=$(echo $1 | tr '[:lower:]' '[:upper:]');
	cat ~/.local/etc/class_creator/blueprint.hpp | sed 's/||$CLASSNAME_H||/'"$PROTECT"'_H/g'\
	| sed 's/||$CLASSNAME||/'$1'/g' | sed 's/||$classname||/'$2'/g'\
		| sed 's/$INHERENCE/'"$INHERENCE"'/g' | sed 's/$I_INCLUDE/'"$I_INCLUDE"'/g'> $1.hpp
}

create_class_file()
{
	cat ~/.local/etc/class_creator/blueprint.cpp | sed 's/$CLASSNAME/'$1'/g' | sed 's/$classname/'$2'/g' | sed 's/$CLASSFILE/'$CLASSFILE'/g' > $1.cpp
}

create_class_file_nd()
{
	cat ~/.local/etc/class_creator/blueprint_nd.cpp | sed 's/$CLASSNAME/'$1'/g' | sed 's/$classname/'$2'/g' | sed 's/$CLASSFILE/'$CLASSFILE'/g' > $1.cpp
}

if [[ $1 ]]; then
	if [[ -a "$1.cpp" || -a "$1.hpp" ]]; then
		echo "Error: $1.cpp or $1.hpp already exists. Aborting to prevent overwrite"
		exit 1
	fi

	NAME=$(echo $1 | tr '[:upper:]' '[:lower:]');
	create_dot_h $1 $NAME
	if [[ $DebugMode == 1 ]]; then
		create_class_file $1 $NAME
	elif [[ $DebugMode == 0 ]]; then
		create_class_file_nd $1 $NAME
	fi
	echo "The class file has been sucessfully created"
else
	echo "ERROR: Argumtents are needed."
	echo "USAGE: classcreator.sh classname [inherence]"
fi