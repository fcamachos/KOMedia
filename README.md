# KOMedia
KOMedia is a little script to organize your pictures by date using the awesome [exiftool](https://exiftool.org/).

### What does it does?

By excecuting this script a *kdialog* will pop-up asking you for a directory to work.
After selecting a directory, the script will use *exiftool* to get the information of your pictures or videos stored in the selected directory and use it to move the files in an *organized* new directory. 

The structure of that new directory is the next:

![Structure](assets/Screenshot_1.png?raw=true "Sample")

The whole process is meant to be user friendly for those who are not willing to type a lot of command in a scary terminal. 

This script runs de *sudo apt update* to look for updates of your system. If there are updates aviable, it will try to do a *sudo apt upgrade*.
Every step will be followed with a *kool* notification in the corner of your screen thanks to the *kdialog* component.


### Why a script this simple? 

This is my second aproach to contibute with the great world of Linux, specially KDE wich gave me some of the *koolest* moments of my life.

This script is a intent to improve the experience of ordering the media, specially for those who are introducing to KDE and are still afraid to use the powerful konsole, or just want to click somewhere and the computer do the job.

### Using the script

Since this script is for new people entering to the programming world I'll try to be the clearest as possible to guide you. 

#### Downloading the code

This is as simple as clicking the green button on the right of this site or opening your terminal (press Alt + F2, then write konsole) and cloning this repository on your PC. 

For more info about cloning repositories here is the link with all the info necessary: [Cloning Repositories](https://docs.github.com/es/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/cloning-a-repository)

#### Unzipping the code

Thanks to KDE we just can go to the directory the file was downloaded (cloned), right click on it and unzip it. If you want to learn more about it just give a look over [here](https://docs.kde.org/trunk5/en/kdeutils/ark/ark-extract.html#:~:text=This%20can%20be%20done%20by,options%20that%20affect%20the%20extraction.).

#### Ok, I got it, what next?

Just to make sure, you have to give the scripts the permissions to run in your PC. Before you do it, consider the risk of running any code you download from internet. You can read the code with your favorite text editor and try to understand how it works. I tried to explain the code in the comments but make sure you can follow the logic and nothing in the code looks suspicious... 

Once you're done lets see how to give run permissions:

- If you're a fan of konsole, take a look over [here](https://bash.cyberciti.biz/guide/Setting_up_permissions_on_a_script).
- If you're more onto Graphic User Interface and use Dolphin as your File Explorer, you just can right click on the scrips, go to *Properties/Permissions* and mark *Is Executable*

#### Runing the script

Now everything is ready, just double click on the **update.sh** file and it will begin to update your system.

#### Making it even more beautiful

This is just for those who want to make it even cleaner than clicking on a awful sh file.

Even though there are a lot of ways to make short cuts I'll recommend you to use GnomePie. A really great tool to launch your applications and even scripts.

If you're interested try it [here](https://schneegans.github.io/gnome-pie)!

#### Icons

Icon by <a href="https://freeicons.io/profile/726">Free Preloaders</a> on <a href="https://freeicons.io">freeicons.io</a>
    