# kelvi-ribeiro-debian-workstation

> Learn how to install your entire environment in a personalized way with just one line of code.

Although made for a specific workstation, it also has the utility of serving as an example to create your own workstation. The proposal is to take step by step how this script was created and both will be refactored as time goes by.

| Tested distributions               | Success               |
| ----------------------------------- | ----------------------- |
| Ubuntu 19.10                        | :heavy_check_mark:      |

### One line install

> For a quick installation, copy all the content below and run on your terminal

```bash 
sudo apt update && 
sudo apt install curl -y &&  
curl https://raw.githubusercontent.com/kelvi-ribeiro/kelvi-ribeiro-debian-workstation/master/main.sh  > ./main.sh && 
chmod a+x ./main.sh && 
./main.sh && rm ./main.sh
```
This set of scripts downloads curl to make requests from the terminal, then takes all content from the *main.sh* file and saves it to a file with the same name, then grants the necessary permissions to run the script inside the file, and finally runs the script.
