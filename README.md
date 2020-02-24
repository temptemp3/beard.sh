# clipboy.sh

Reads from clipboard and performs actions based on contents

---

## quickstart

```
(
  read -p "What's Me's name? (niceboy) " name
  test ! -d "${name}" || { echo "Someone else has Me's name!" ; exit ; }
  echo "Me's name is ${name}!"
  git clone https://github.com/temptemp3/clipboy.sh.git ${name}
  cd ${name}
  echo -e "\n${name}() { bash '$( realpath clipboy.sh )' \${@} ; }" >> ~/.bashrc
  source ~/.bashrc
  ${name} say hello
)
```

### todo

 + include sh2 installation in quickstart

---

### installation and requirements

write me: installation and requirement details beyond quickstart

---

### log

 + 2020/01/24 - ass support for drop-in commands
 + 2018/11/09 - add support for dialog and act customization outside of core
 + 2018/11/08 - initial

---
