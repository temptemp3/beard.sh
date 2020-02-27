# clipboy.sh

Reads from clipboard and performs actions based on contents

---

## quickstart

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
    . ~/.bashrc
    ${name} say hello
  )
  . ~/.bashrc 
}
```

---

### log
 
 + 2020/02/26 - update quickstart to loop on missing name and include sh2 
 + 2020/02/24 - update quickstart (asks name), add make command
 + 2020/01/24 - add support for drop-in commands
 + 2018/11/09 - add support for dialog and act customization outside of core
 + 2018/11/08 - initial

---
