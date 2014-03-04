#! /bin/bash

echo "Adding gitignore rules for builder generated C files..."
dir=`pwd`
grep -v modules/ .gitignore > .gitignore_temp
cd modules
	for x in *;do
		if [ -d $x ];then
			echo "    modules/$x"
			echo modules/$x/$x'_*.[ch]' >> $dir/.gitignore_temp;
		fi
	done
cd $dir
mv .gitignore_temp .gitignore
echo "done."