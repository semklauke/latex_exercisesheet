# Latex Exercisesheet Template

This is a latex class / template for university or school exercisesheets.<br />

## Example 
You can find an example in `example/example.tex`.

### The example in style underline and open
<img src="https://stuff.semklauke.de/latex_exercisesheet_example.png" width="400" >   <img src="https://stuff.semklauke.de/latex_exercisesheet_example2.png" width="400" >

## Usage
- You can see the most basic usage in `example/example.tex`

- Make sure you have your main `.tex` file in a seperate folder no in the 'root' directory.
I always create a sperate folder for each exercisesheet:
```
.
├── 01
│   └── exercise.tex
├── 02
│   ├── 5drawing.pdf
│   └── exercise.tex
├── 03
│   └── exercise.tex
├── 04
│   └── exercise.tex
├── 05
│   ├── exercise.tex
│   ├── skiplist.tikzdefs
│   └── skiplist.tikzstyles
├── 06
│   └── abgabe.tex
└── template
    ├── custome_definitions.tex
    ├── exercisesheet.cls
    └── settings.tex
```

- If you have `pointtable` or `exercisepoints` enabled, you need to compile your pdfs twice. E.g
`pdflatex exercise.tex; pdflatex exercise.tex`. Good editors will take care of that, overleaf does! 


## Customizability
The class is build to my personal needs and is build so I have **very little setupt time** for every new class.
You can use the few class options to customice the template to your class, but there is no big time customizability.

But feel free to edit the class file to your like, I tried to comment everything I did, so hope you can get along.

### Class Options
The base class is `scrartcl`

| Option              | Possible Values   | Default    | Description                                                                  |
|:--------------------|:------------------|:-----------|:-----------------------------------------------------------------------------|
| `10pt`              | -                 | -          | Pass 10pt font size to  `scrartcl`                                           |
| `11pt`              | -                 | -          | Pass 11t font size to  `scrartcl`                                            |
| `indent`            | *length units*    | 0pt        | Indentation of new paragraph (sets `parindent`)                              |
| `style`             | underline \| open | underline  | Select one of 2 header styles                                                |
| `pointtable`        | -                 | *disabled* | Display all exercise points in a table under the header (see Exercisepoints) |
| `exercisepoints`    | -                 | *disabled* | Display points box after each exercise envi. (see Exercisepoits)             | 
| `exerciseindent`    | *length units*    | 2em        | Indentation of a subexercise relative to the exercise                        |
| `exerciseprefix`    | *strings*         | Ex         | Prefix for the pointtable heading                                            |
| `tikz`              | yes \| no         | no         | include usefull tikz packages and libraries                                  |
| `displaydate`       | yes \| no         | yes        | whether to display the date in the header                                    |
| `sheetnumberprefix` | -                 | *disabled* | add worksheet number as prefix for the ex.nr. : Ex 1 -> Ex 3.1 (on sheet 3)  |
| `exercisename`      | *strings*         | Exercise   | Heading for each new exercise                                                |
| `worksheetname`     | *strings*         | Worksheets | What your class calls a Worksheet (eg. Exercisesheet, other languages, etc.) |
| `tutorialname`      | *strings*         | Tutorial   | What your class calls a Tutorial                                             |
| `groupname`         | *strings*         | Group      | What your class calls a Group                                                |

\- means this options has no values, just pass it 
