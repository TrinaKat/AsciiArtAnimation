# ASCIIArtAnimation
Animates ASCII art from a text file! Ooo so exciting!

# Instructions
The first line of the text file must contain the number of lines per "page" or "frame." This includes any blank lines separating each page/frame. See datboi.txt for an example :)

To run it, set which file to animate with the "-f" option. This is required to pass in the file. You can use the command as follows:

```./ascii_anim.sh -f datboi.txt```

To run the animation "forever" aka to repeat it use the option "-r":

```./ascii_anim.sh -f datboi.txt -r```

To change the speed the animation runs, use the option "-s" followed by a positive number (0 and greater). This sets how long the animation will PAUSE between frames... so a SMALLER number results in a FASTER animation and vice versa. Do not input a negative speed and a large number will take forever to animate... I recommend somewhere between 0 to 1. The default is 0.1s. 

```./ascii_anim.sh -f datboi.txt -s 0.1```

All the options can be used together in any order... so long as -f and -s are followed by the proper arguments. 

```./ascii_anim.sh -f datboi.txt -r -s 0.1```

To quit the animation early, press "q" or CTRL-C.

If you just run the script, then it will try to animate datboi.txt at 0.1s without repeating. If it cannot find datboi.txt, it will stop running.

```./ascii_anim.sh ```

# Add an Alias
To add an alias, add one to ~/.bash_profile that looks like so:

```alias animate='cd ~/path_to_files; ./ascii_anim.sh'```

You can then run the script with the same options like so:

```animate -f datboi.txt -r -s 0.1```

# Python Version
A python version of the script has been added. It does NOT have the option to quit with "q", it can only be exited with CTRL-C or naturally when the animation runs out. 

To run, the same options are enabled, with -r for repeat and -s for speed. The -f option is unnecessary, you can just pass in the file as argument.

```./ascii_anim.py datboi.txt -r -s 0.1```

The script can also be run as follows:

```python ascii_anim.py datboi.txt```

There is no default file for the python script, it must be passed one.

# Making your own ASCII Art
Some sites you can use to convert images to ASCII are below:

http://glassgiant.com/ascii/

http://www.ascii-art-generator.org/

http://ascii.mastervb.net/

http://www.degraeve.com/img2txt.php

http://picascii.com/
