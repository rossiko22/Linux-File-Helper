#!/bin/bash
function loopsScript(){
        echo "Where do you want to use loop"
        currentLocation
        list "f"
        list "d".
        creationLocation "use loop"
        echo "Which loop would you like to use"
        echo "{1} For"
        read choice

        case "$choice" in
                "1")
                                echo "{1} Conditional loop"
                                echo "{2} Infinite loop"
                                echo "{3} Nested loop"
                                read begginerChoice
                                if [ "$begginerChoice" == 1 ]; then
                                echo "For how much you want to loop"
                                read begginerForLoop
                                echo "If you input - it is going to give you decrement, on the other side it is increment"
                                read incrementTool
                                echo "For how much would you like it to increment or decrement every loop"
                                read begginnerIncrement
                                echo "What you want to do (Write the command that you want to loop)"
                                read begginerForLoopCommand
                                echo "Are you creating files or directories or you are doing something else"
                                echo "{1} Create"
                                echo "{2} Other"
                                read forchoice
                                if [ "$forchoice" == 1 ]; then
                                for((i = 0; i < $begginerForLoop ;i=i $incrementTool $begginnerIncrement));
                                do
                                        $begginerForLoopCommand$i
                                done
                                elif [ "$forchoice" == 2 ]; then
                                for((i = 0; i < $begginerForLoop; i++))
                                do
                                        $begginerForLoopCommand
                                done
                                else
                                        echo "Incorrect choice";exit 1;
fi
                                elif [ "$begginerChoice" == 2 ]; then
                                echo "What do you want to do"
                                read forInfiniteLoopCommand
                                for((;;))
                        do
                                $forInfiniteLoopCommand
                        done

                                elif [ "$begginerChoice" == 3 ]; then

                                echo "How much should be the middle parameter in outer loop"
                                read outerLoop
                                echo "How much should be the middle parameter in inside loop"
                                read insideLoop
                                echo "What do you want to do in outer loop"
                                read outerLoopCommand
                                echo "What do you want to do in inside loop"
                                read insideLoopCommand
                                echo "In the outer loop you want to increment + or decrement - , choose sign"
                                read outerIncrement
                                echo "For how much would you like to increment or decrement"
                                read outerIncrementAmount
                                echo "In the inside loop you wan to increment + or decrement -, choose sign"
                                read insideIncrement
                                echo "For how much would like to increment or decrement"
                                read insideIncrementAmount

                                for((z = 0; z < $outerLoop; z=z $outerIncrement $outerIncrementAmount));
                                        do
                                        $outerLoopCommand
                                        for((j = 0; j < $insideLoop;j= j $insideIncrement $insideIncrementAmount));
                                                do
                                                $insideLoopCommand
                                                done
                                        done
                                else
                                echo "Incorrect choice";exit 1;
fi
                ;;
                *)
                echo "Invalid choice"; exit 1;
                ;;
esac
}
function printExtension(){
        currentLocation
        list "f"
        creationLocation
        echo "What is the extension you want to print your files"
        read extension
        ls *."$extension"
}
function writeIntoFile(){
        currentLocation
        list "f"
        creationLocation "write"
        echo "What is the name of your file"
        read name
        echo "{1} Write with text editor Nano"
        echo "{2} Write with cat"
        read choice
        case "$choice" in
                "1")
                nano "$name"
                ;;
                "2")
                echo "Enter text (Ctrl+D to end)"
                cat >> "$name"
                ;;
                *)
                echo "Invalid choice"; exit 1;
                ;;
esac
}
function printFile(){
        currentLocation
        list "f"
        creationLocation "print"
        echo "What is the name of your file"
        read name
        echo "{1} Read whole file"
        echo "{2} Read file from end"
        echo "{3} Read first n lines"
        echo "{4} Read last n lines"
        echo "{5} One screen at time"
        read choice
        case "$choice" in
                "1")
                cat "$name"
                ;;
                "2")
                tac "$name"
                ;;
                "3")
                echo "How much lines you want to read from start"
                read start
                head -"$start" "$name"
                ;;
                "4")
                echo "How much lines you want to read from the end"
                tail -"$end" "$name"
                ;;
                "5")
                more "$name"
                ;;
                *)
                echo "Invalid input"; exit 1;
                ;;
esac

}
function printPrivilege(){
        local typeA=$1
        echo "{1} $typeA Read"
        echo "{2} $typeA Write"
        echo "{3} $typeA Execute"
}
function whatDirectory(){
        local typeD=$1
        local typeB=$2
                if [ "$typeD" == "d" ]; then
                        echo "Where do you want to $typeB your Directory"
                elif [ "typeD" == "f" ]; then
                        echo "Where do you want to $typeB your Directory"
                else
                        echo "Invalid choice"; exit 1;
fi
}
function list(){
        local type=$1
        if [ "$type" == "d" ];then
                echo "This are the Directories in your current Directory"
                ls -la | grep "^d"
        elif [ "$type" == "f" ];then
                echo "This are the Files in your current directory"
                ls -la | grep "^-"
        else
                echo "Invalid choice";exit 1;
fi
}

function currentLocation(){
        echo "Your current location is $(pwd)"
}
function creationLocation(){
        local typeDoc=$1
        echo "Where do you want to $typeDoc your File/Directory"
        echo "{1} Current Location"
        echo "{2} Different Location(Full path)"
        read where

        case "$where" in
                "1")
        ;;
                "2")
        echo "Navigate to location where you want to $typeTypeDoc the file : "
        read location
        cd "$location" || { echo "Invalid location"; exit 1;}
        ;;
                  *)
        echo "Invalid choice"; exit 1;
        ;;
esac

}

changePrivilege(){
        currentLocation
        list "f"
        creationLocation "Change privilege for"
        currentLocation
        list "f"
                echo "What is the name of file you want to change privileges"
                read nameOfFile
                if [ -f $nameOfFile ];then
                        echo "Would you like to add or remove a privilege"
                        echo "{1} Add"
                        echo "{2} Remove"
                                read inputChoice
                                case "$inputChoice" in
                                                "1")
                                        echo "{1} Add all privileges to file for all users"
                                        echo "{2} Privileges for Owner"
                                        echo "{3} Privileges for Group"
                                        echo "{4} Privileges for World"
                                        read addSubChoice
                                                case "$addSubChoice" in
                                                        "1")
                                                        chmod 777 "$nameOfFile"
                                                        ;;
                                                        "2")
                                                        printPrivilege "Add"
                                                        read dInput
                                                        case "$dInput" in
                                                                "1")
                                                                chmod u+r "$nameOfFile"
                                                                ;;
                                                                "2")
                                                                chmod u+w "$nameOfFile"
                                                                ;;
                                                                "3")
                                                                chmod u+x "$nameOfFile"
                                                                ;;
                                                                *)
                                                                echo "Invalid choice"; exit 1;
                                                                ;;
esac
                                                        ;;
                                                        "3")
                                                        printPrivilege "Add"
                                                        read eInput
                                                        case "$eInput" in
                                                                "1")
                                                                chmod g+r "$nameOfFile"
                                                                ;;
                                                                "2")
                                                                chmod g+w "$nameOfFile"
                                                                ;;
                                                                "3")
                                                                chmod g+x "$nameOfFile"
                                                                ;;
                                                                *)
                                                                echo "Invalid choice"; exit 1;
                                                                ;;
esac
                                                        ;;
                                                        "4")
                                                        printPrivilege "Add"
                                                        read fInput
                                                        case "$fInput" in
                                                                "1")
                                                                chmod o+r "$nameOfFile"
                                                                ;;
                                                                "2")
                                                                chmod o+w "$nameOfFile"
                                                                ;;
                                                                "3")
                                                                chmod o+x "$nameOfFile"
                                                                ;;
                                                                *)
                                                                echo "Invalid choice"; exit 1;
                                                                ;;
esac
                                                        ;;
                                                        *)
                                                        echo "Invalid choice"; exit 1;
                                                        ;;
esac
                                                ;;
                                                "2")
                                        echo "{1} Remove all privileges to file for all users"
                                        echo "{2} Privileges for Owner"
                                        echo "{3} Privileges for Group"
                                        echo "{4} Privileges for World"
                                        read removeSubChoice
                                                case "$removeSubChoice" in
                                                        "1")
                                                        chmod 000 "$nameOfFile"
                                                        ;;
                                                        "2")
                                                        printPrivilege "Remove"
                                                        read aInput
                                                        case "$aInput" in
                                                                "1")
                                                                chmod u-r "$nameOfFile"
                                                                ;;
                                                                "2")
                                                                chmod u-w "$nameOfFile"
                                                                ;;
                                                                "3")
                                                                chmod u-x "$nameOfFile"
                                                                ;;
                                                                *)
                                                                echo "Invalid Choice"; exit 1;
                                                                ;;
esac
                                                        ;;
                                                        "3")
                                                        printPrivilege "Remove"
                                                        read bInput
                                                        case "$bInput" in
                                                                "1")
                                                                chmod g-r "$nameOfFile"
                                                                ;;
                                                                "2")
                                                                chmod g-w "$nameOfFile"
                                                                ;;
                                                                "3")
                                                                chmod g-x "$nameOfFile"
                                                                ;;
                                                                *)
                                                                echo "Invalid choice"; exit 1;
                                                                ;;
esac
                                                        ;;
                                                        "4")
                                                        printPrivilege "Remove"
                                                        read cInput
                                                        case "$cInput" in
                                                                "1")
                                                                chmod o-r "$nameOfFile"
                                                                ;;
                                                                "2")
                                                                chmod o-w "$nameOfFile"
                                                                ;;
                                                                "3")
                                                                chmod o-x "$nameOfFile"
                                                                ;;
                                                                *)
                                                                echo "Invalid choice"; exit 1;
                                                                ;;
esac
                                                        ;;
                                                        *)
                                                        echo "Invalid choice"; exit 1;
                                                        ;;
esac
esac
                else
                        echo "It doesnt exist"; exit 1;
fi
}
function move(){
        local typeDoc=$1
                echo "Which $typeDoc would you like to move"
        read fileToMove
                echo "Where would you like to move it (full path location)"
        read locationToMove
                echo "Do you want to change the name during movement(y/n)"
        read choice
        if [ "$choice" == y ];then
                echo "What is the new name"
        read newname
                if [ "$typeDoc" == "Directory" ];then
                        echo "Moving ..."
                        mv "$fileToMove" "$locationToMove/$newname"
                elif [ "$typeDoc" == "File" ];then
                        mv "$fileToMove" "$locationToMove/newname"
                        echo "Moving ..."
                else
                        echo "Invalid choice";exit 1;
                fi
        else
                if [ "$typeDoc" == "Directory" ];then
                        echo "Moving ..."
                        mv "$fileToMove" "$locationToMove"
                elif [ "$typeDoc" == "File" ];then
                        mv "$fileToMove" "$locationToMove"
                        echo "Moving ..."
                else
                        echo "Invalid choice";exit 1;
                fi

        fi
}
function rename(){
        local typeD=$1
        currentLocation
        echo "{1} The file that i want to rename is in this Directory"
        echo "{2} The file is in another Directory"
        read choice
        case "$choice" in
                "1")
                ;;
                "2")
                echo "Enter the location where is the file you want to rename"
                read desiredLocation
                cd "$desiredLocation"
                currentLocation
                list "$typeD"
                ;;
                *)
                echo "Incorrect choice";exit 1;
                ;;
esac
        echo "What is the name of file you want to rename ? "
        read renameFile
        echo "What do you want to rename it in ? "
        read newRenameFile
        echo "Renaming ..."
        mv "$renameFile" "$newRenameFile"

}
function createNew(){
        local type=$1
        if [ "$type" == "d" ]; then
                creationLocation = "create"
                echo "Enter the name of the Directory"
                read name
                echo "Creating Directory $name ..."
                mkdir "$name"
        elif [ "$type" == "f" ]; then
                creationLocation = "create"
                echo "Enter the name of the file"
                read name
                echo "Creating File $name ..."
                touch "$name"
        else
                echo "Invalid choice";exit 1;
        fi
}
function remove(){
        local typeD=$1
        local typeB=$2
        echo "{1} The "$typeD" i want to remove is in this Directory "
        echo "{2} The "$typeD" i want to remove is in another Directory"
        read choice
        case "$choice" in
                "1")
                        currentLocation
                        list "$typeB"
                ;;
                "2")
                        echo "Where is the "$typeD" that you want to remove"
                        read pathToFile
                        cd "$pathToFile"
                        currentLocation
                        list "$typeB"
                ;;
                *)
                        echo "Incorrect choice";exit 1;
esac
                        echo "What is the name of file you want to remove"
                        read name
                        if [ "$typeB" == "d" ]; then
                                rm -rf "$name"
                        elif [ "$typeB" == "f" ]; then
                                rm "$name"
                        else
                                echo "Invalid choice";exit 1;
fi
                        echo "Removing ..."
}
function copy(){
        local typeD=$1
        local typeB=$2
                echo "{1} The "$typeD"/s that i want to copy are in this Directory "
                echo "{2} The "$typeD"/s i want to copy is/are in another Directory"
        read choice
                case "$choice" in
                        "1")
                        currentLocation
                        list "$typeB"
                        ;;
                        "2")
                        echo "Enter the location where would you like to Copy $typeD "
                        read nextLocation
                        cd "$nextLocation"
                        ;;
                        *)
                        echo "Invalid choice";exit 1;
                        ;;
esac
        if [ "$typeB" == "d" ]; then
                currentLocation
                list "$typeB"
                echo "Enter the Directory name"
                read dirName
                echo "Enter the location where would you like to copy the Directory(Full Path To Location)"
                read directoryChoice
                cp -r "$dirName" "$directoryChoice"
        elif [ "$typeB" == "f" ]; then
                currentLocation
                list "$typeB"
                echo "Enter the File name"
                read fileName
                echo "Enter the location where would you like to copy the File(Full Path To Location)"
                read fileChoice
                cp "$fileName" "$fileChoice"
        else
                echo "Invalid choice";exit 1;
fi
                echo "Copying ..."
}
function fileInfo(){
        currentLocation
        list "f"
        creationLocation "info"
        echo "What is the name of your file"
        read name

        echo "File words"
        wc -w < "$name"
        echo "File lines"
        wc -l < "$name"
        echo "File characters"
        wc -m < "$name"
}
function fileSort(){
        currentLocation
        list "f"
        creationLocation "sort"
        echo "What is the name of your file"
        read name
        echo "{1} Alphabetic sort"
        echo "{2} Add numbers before lines"
        echo "{3} Read column of File"
        echo "{4} Replace words or letters"
        read choice

        case "$choice" in
                        "1")
                        sort "$name"
                        ;;
                        "2")
                        nl -s '.' -w "$name"
                        ;;
                        "3")
                        echo "What colon do you want to read(Separate with , if multiple for example 1,2,3 etc)"
                        read colon
                        cut -f "$colon" -d ' ' "$name"
                        ;;
                        "4")
                        echo "What is the word you want to replace"
                        read wordToReplace
                        echo "With what you want to replace the word"
                        read replaceWith
                        sed -n "s/"$wordToReplace"/"$replaceWith"/g" "$name"
                        ;;
                        *)
                        echo "Incorrect choice"; exit 1;
esac

}
echo -e "\e[32mHello sir ... With what would you like to work today !!!\e[0m"
echo -e "{1}\033[0;31m Directories\033[0m"
echo -e "{2}\033[0;31m Files\033[0m"
echo -e "{3}\033[0;31m Privileges\033[0m"
read main_choice

case "$main_choice" in
        "1")
        echo "{1} Create new Directory"
        echo "{2} Move Directory"
        echo "{3} Copy Directory"
        echo "{4} Rename Directory"
        echo "{5} Remove Directory"
        echo "{6} List all Directories in current Directory"
        echo "What would you like to do ? "
        read choice
        case "$choice" in
                "1")
                createNew "d"
                ;;
                "2")
                currentLocation
                list "d"
                move "Directory"
                ;;
                "3")
                copy "Directory" "d"
                ;;
                "4")
                list "d"
                rename "d"
                ;;
                "5")
                remove "Directory" "d"
                ;;
                "6")
                currentLocation
                list "d"
                ;;
                *)
                echo "Invalid choice"; exit 1;
                ;;
esac
;;
        "2")
        echo "{1} Create new File"
        echo "{2} Move File"
        echo "{3} Copy File"
        echo "{4} Rename File"
        echo "{5} Remove File"
        echo "{6} Read File"
        echo "{7} Write into File"
        echo "{8} Print File With Extension"
        echo "{9} File Info"
        echo "{10} File Sort"
        echo "{11} List all Files in Directory"
        echo "What would you like to do ? "
        read choice
        case "$choice" in
                "1")
                createNew "f"
                ;;
                "2")
                currentLocation
                list "f"
                move "File"
                ;;
                "3")
                copy "File" "f"
                ;;
                "4")
                list "f"
                rename "f"
                ;;
                "5")
                remove "File" "f"
                ;;
                "6")
                printFile
                ;;
                "7")
                writeIntoFile
                ;;
                "8")
                printExtension
                ;;
                "9")
                fileInfo
                ;;
                "10")
                fileSort
                ;;
                "11")
                list "f"
                ;;
                *)
                currentLocation
                echo "Invalid choice"; exit 1;
                ;;
esac
;;

        "3")
        changePrivilege
        ;;
        *)
        echo "Invalid choice"; exit 1;
        ;;
esac