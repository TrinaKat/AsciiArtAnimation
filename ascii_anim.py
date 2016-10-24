#!/usr/bin/python

import sys, os.path
from optparse import OptionParser
from time import sleep

class anim:
    def __init__(self, file):
        f = open(file, 'r')
        self.lines = f.readlines()
        f.close()

def main():
    version_msg = "%prog 1.0"
    usage_msg = """%prog [OPTION]... FILE

Page through FILE to create an animation effect."""

    parser = OptionParser(version=version_msg,
                          usage=usage_msg)
    parser.add_option("-r", "--repeat",
                      action="store_true", dest="repeat", default=False,
                      help="repeat animation")
    parser.add_option("-s", "--speed",
                      action="store", type="float", dest="speed", default=0.1,
                      help="change speed")

    options, args = parser.parse_args(sys.argv[1:])

    if len(args) != 1:  # needs file as minimum
        if len(args) == 0:
            parser.error("no operands, pass in one file")
        if len(args) > 1:
            parser.error("too many operands")
    input_file = args[0]

    if (os.path.isfile(input_file) == False):
        parser.error("{0} is not a valid file!".
                    format(input_file))

    if (options.speed <= 0):
        parser.error("{0} is not a valid speed. It must be a float or int > 0.".
                    format(options.speed))

    try:
        animate = anim(input_file)
    except:
        parser.error("Cannot animate {0}".
                    format(input_file))

    page_lines = int(animate.lines[0])
    file_lines = int(len(animate.lines))
    screen_w = len(max(open(input_file, 'r'), key=len))
    screen_h = page_lines + 1
    print "\x1b[8;%i;%it" % (screen_h, screen_w)

    #print(chr(27) + "[2J")
    #os.system('clear')
    print("\n" * screen_h)

    while True:
      start_line = 1
      end_line = page_lines + 1
      line_buffer = 0

      while (start_line < file_lines - 1):
        if (end_line >= file_lines):
          line_buffer = end_line - file_lines
          end_line = file_lines

        sleep(options.speed)

        for i in animate.lines[start_line:end_line]:
          print(i),

        if (line_buffer > 0):
          print("\n" * line_buffer)
          line_buffer = 0

        start_line = start_line + page_lines
        end_line = end_line + page_lines

      if (options.repeat):
        continue
      else:
        break

if __name__ == "__main__":
  main()
