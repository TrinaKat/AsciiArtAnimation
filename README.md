# ASCIIArtAnimation
Animates ASCII art from a text file! Ooo so exciting!

# Instructions
The first line of the text file must contain the number of lines per "page" or "frame." This includes any blank lines separating each page/frame. See datboi.txt for an example :)

To run it, use the following command:

```./ascii_anim.sh -f datboi.txt```

To run the animation "forever" aka to repeat it use the option "-r":

```./ascii_anim.sh -f datboi.txt -r```

To change the speed the animation runs, use the option "-s" followed by a positive number (0 and greater). This sets how long the animation will PAUSE between frames... so a SMALLER number results in a FASTER animation and vice versa. Do not input a negative speed and a large number will take forever to animate... I recommend somewhere between 0 to 1. The default is 0.1s. 

```./ascii_anim.sh -f datboi.txt -s 0.1```

All the options can be used together in any order... so long as -f and -s are followed by the proper arguments. 

```./ascii_anim.sh -f datboi.txt -r -s 0.1```

To quit the animation early, press "q" or CTRL-C.

If you just run the script, then it will try to animate datboi.txt at 0.1s without repeating. If it cannoy find datboi.txt, it will stop running.

```./ascii_anim.sh ```

# Add an Alias
To add an alias, add one to ~/.bash_profile that looks like so:

```alias animate='cd ~/path_to_files; ./ascii_anim.sh'```

You can then run the script with the same options like so:

```animate -f datboi.txt -r -s 0.1```

# Making your own ASCII Art
Some sites you can use to convert images to ASCII are below:

http://glassgiant.com/ascii/

http://www.ascii-art-generator.org/

http://ascii.mastervb.net/

http://www.degraeve.com/img2txt.php

http://picascii.com/
