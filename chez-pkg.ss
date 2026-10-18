#!chezscheme

(import (chezscheme))

(display "Hello, world!\n")

(format #t "- current directory: ~s\n" (current-directory))
(format #t "- command line arguments: ~s\n" (command-line-arguments))
