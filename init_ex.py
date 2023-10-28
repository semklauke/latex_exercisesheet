#!/usr/bin/env python3
from sys import argv, exit
from os import mkdir

### USAGE ###
# ./init_ex.py <ex num> (<?subex>@<?points>)*
# Example:
# - Ex. sheet nr. 3 with exercises 1a,b (12 points), 2 (3 points), 3a,b,c (no points)
# ./init_ex.py 3 ab@12 @3 abc@

exNum = argv[1].zfill(2)
print(f"Creating file for Ex {exNum}")

# create directory 
try:
    mkdir(f"{exNum}")
except FileExistsError:
    pass
except Exception as err:
    print(f"Error creating dir: {err}")
    exit()

# open file
with open(f'{exNum}/exercise.tex', 'w', encoding="utf-8") as f:
    
    def out(s, t=0):
        f.write('\t'*t + s + '\n')
        
    # add base structure
    out(r'\documentclass{../template/exercisesheet}')
    out(r'\sheet{' + argv[1] + r'}')
    out('')
    out(r'\begin{document}')
    
    # add exercies
    exCounter = 1
    for ex in argv[2:]:
        sub, points = ex.split('@')
        out(f'% Ex {exCounter}')
        exStr = r'\begin{exercise}'
        if points != '': 
            exStr = exStr + f'[{points}]'
        out(exStr)
        if sub != '':
            for i in range(0, len(sub)):
                out(f'% {exCounter} {sub[i]})',1)
                out(r'\begin{subexercise}',1)
                out(r'\end{subexercise}',1)
        out(r'\end{exercise}')
        exCounter += 1
    
    # add end
    out(r'\end{document}')