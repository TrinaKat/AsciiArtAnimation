# AsciiArtAnimation
Animates ascii art from a text file

# Instructions
The first line of the text file must contain the number of lines per "page" or "frame." This includes any blank lines separating each page/frame. See datboi.txt for an example :)

To run it, use the following command:

```./ascii_anim.sh datboi.txt```

To run the animation "forever" aka to repeat it use "r" as the second argument:

```./ascii_anim.sh datboi.txt r```

To change the speed the animation runs, use a positive number (0 and greater). This sets how long the animation will PAUSE between frames... so a SMALLER number results in a FASTER animation and vice versa. Do not input a negative speed and a large number will take forever to animate... I recommend somewhere between 0 to 1. The default is 0.1s. 

```./ascii_anim.sh datboi.txt 0.1```

To combine both repeating and changing the speed, put "r" as the first argument:

```./ascii_anim.sh datboi.txt r 0.1```

To quit the animation early, press "q" or CTRL-C
