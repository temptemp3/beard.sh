# clipboy

Framework for building extensible shell scripts in bash for a personal assistant 

---

## quickstart

Run the following script. That's it.

```
{
  (
    clone() {
      git clone https://github.com/temptemp3/${1}.git ${2:-${1}}
    } 
    prompt-name() {
      read -p "What's Me's name? (niceboy) " name
    }
    get-name() {
      while [ ! "${name}" ]
      do
       prompt-name
      done
    }
    exit-on-duplicate-name() {
      test ! -d "${name}" || { 
        echo "Someone else has Me's name!" 
        exit 
      }
    }
    clone-sh2() {
      test "${SH2}" || {
        clone sh2 
        echo -e "\ndeclare -x SH2='$( realpath sh3 )'" >> ~/.bashrc 
      }
    }
    install() {
      echo -e "\n${name}() { bash '$( realpath clipboy.sh )' \${@} ; }" >> ~/.bashrc
    }
    name=""
    get-name
    exit-on-duplicate-name
    echo "Me's name is ${name}!"
    clone clipboy.sh ${name}
    cd ${name}
    clone-sh2
    install
  )
}
```

---

## builtin features

 + make command
    + make functions and new commands

---

## usage

Suppose that we complete the quickstart and end up calling our personal assistant bob. Here follows all the things bob can do out of the box.

### commands

It can run any command you have done in the commands directory.

bob command

Specifying only the command as above forces the default sub command to run.

Each command comes with a base set of sub commands, one of which is help. 

bob command:help

By default, help lists the sub commands available.

The command command is not included out of the box.

### make

It comes with a builtin command to make things including lemonade if you are unfamiliar with its sub commands.

#### functions

bob make:function test

By default, in the case of test, bob will create a directory called test.sh with script called test.sh. However, you may want bob to just create a bash script without a directory. In that case, we would added the --single long option as follows.

bob make:function test --single

Optional, you may also provide the --dated option to instruct it to prefix the filename with a date string, that is, yymmdd.

bob make:function test --single --dated

make:function helpful when you need to need a point to start writing a new bash script. However, it may be used to extend it, there is a sub command more helpful call command.

#### commands

bob make:command new-command

#### scripts

bob make:script new-script

#### subcommands

bob make:subcommand new-command-extension

Running make:subcommand after make-script using the same argument links the subcommand to the script. This way we are able to isolate code that actually does something n the scripts directory.

---

## log


 + 2020/03/06 - expand on make command
 + 2020/03/01 - fixed missing create-stub2 for quickstart make commands
 + 2020/02/27 - add initial features and usage 
 + 2020/02/26 - update quickstart to loop on missing name and include sh2 
 + 2020/02/24 - update quickstart (asks name), add make command
 + 2020/01/24 - add support for drop-in commands
 + 2018/11/09 - add support for dialog and act customization outside of core
 + 2018/11/08 - initial

---
