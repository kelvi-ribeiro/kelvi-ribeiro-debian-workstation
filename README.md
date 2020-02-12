# kelvi-ribeiro-debian-workstation

> Learn how to install your entire environment in a personalized way with just one line of code.

Although made for a specific workstation, it also has the utility of serving as an example to create your own workstation. The proposal is to take step by step how this script was created and both will be refactored as time goes by.

### Prerequisites

* `curl` or `wget` should be installed

### Basic Installation

You can install this via the command-line with either `curl` or `wget`.

#### via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/kelvi-ribeiro/kelvi-ribeiro-debian-workstation/master/main.sh)"
```

#### via wget

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/kelvi-ribeiro/kelvi-ribeiro-debian-workstation/master/main.sh)"
```

#### Manual inspection

It's a good idea to inspect the install script from projects you don't yet know. You can do
that by downloading the install script first, looking through it so everything looks normal,
then running it:

```shell
curl -Lo install.sh https://raw.githubusercontent.com/kelvi-ribeiro/kelvi-ribeiro-debian-workstation/master/main.sh
sh install.sh
```
This set of scripts downloads curl to make requests from the terminal, then takes all content from the *main.sh* file and saves it to a file with the same name, then grants the necessary permissions to run the script inside the file, and finally runs the script.

### Tested distributions 

Help this project by testing linux distributions

| Distribution               | Success               |
| ----------------------------------- | ----------------------- |
| Ubuntu 19.10                        | :heavy_check_mark:      |
| Elementary OS 5.1 Hera              | :heavy_check_mark:      |


### To do
- [ ] Importing environment variables
- [ ] Addition of some more applications like *oh my zsh*
