# WS2024 FPROG Project - Functional RBT Word Sort (COANDA Nicole, LINTNER Ines, VARGA Sara)
## Description
This fully functional application takes a .txt file containing text as its input, tokenizes the content, sorts it alphabetically using a Red Black Tree and finally writes the sorted content into an output .txt file.

We decided to go with using *Haskell* on this, as we had been interested in learning the language, as well as it being rather convenient, seeing as the language itself is inherently functional.
The libraries we used are Data.Char, System.IO and System.Environment
- Data.Char:
    - isAlpha - used for removing non alphabetic characters in cleanText
    - toLower - converts uppercase characters to lowercase to ensure not having duplicates in the final output (e.g.: Apple, apple)
- System.IO:
    - readFile: reads "input.txt" filecontent into string for further use
    - writeFile: writes sorted words into "output.txt"
- System.Environment:
    - getArgs: get command-line arguments

Some challenges we faced where the fact that we had never worked with *Haskell* before, or any functional programming language for that matter, so the syntax was entirely new to us.

## How to run
To run the project, you will need an "input.txt" file containing your text located in the same directory as the "main.hs" file.
**Note:** Upon running the program, any file by the name of "output.txt" in the same directory will be overwritten

In WSL: Ubuntu, run the following commands:
```
make
./out/project /path/to/file
```

## Credits
- https://abhiroop.github.io/Haskell-Red-Black-Tree/
- https://www.khoury.northeastern.edu/~camoy/pub/red-black-tree.pdf
- https://github.com/yassiommi/redblacktree
- https://www.schoolofhaskell.com/school/starting-with-haskell/introduction-to-haskell/1-haskell-basics
- https://www.geeksforgeeks.org/insertion-in-red-black-tree/