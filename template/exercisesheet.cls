%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Latex Class for Univesity Exercise sheets %%%%%%%%
%%%%%%%%%%%%% by Sem Klauke, version 2022 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
% Define the Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../template/exercisesheet}
%% --------------------------------------------------- %%
%% --------------- Define Class options -------------- %%
%% --------------------------------------------------- %%
\RequirePackage{xifthen}
\RequirePackage{xkeyval}
%%%
% ****(OPTION)**** Font size pass through
% 10pt, 11pt [DEFAULT: 11pt]
\DeclareOptionX{10pt}{\PassOptionsToClass{10pt}{scrartcl}}
\DeclareOptionX{11pt}{\PassOptionsToClass{11pt}{scrartcl}}
% ****(OPTION)**** babel lang pass through
% babellang
\DeclareOptionX{babellang}{\PassOptionsToPackage{#1}{babel}}
% ****(OPTION)****
% indent [DEFAULT: 0pt]
\newcommand{\exshParidnent}{0pt}
\DeclareOptionX{indent}{\renewcommand{\exshParidnent}{#1}}
% ****(OPTION)****
% style [underline|open] [DEFAULT: underline] 
\newcommand{\exshStyle}{underline}
\DeclareOptionX{style}{\renewcommand{\exshStyle}{#1}}
% ****(OPTION)****
% pointtable [yes|no] [DEFAULT: no] 
\newcommand{\exshPointTable}{no}
\DeclareOptionX{pointtable}{\renewcommand{\exshPointTable}{yes}}
% ****(OPTION)****
% exercisepoints [yes|no] [DEFAULT: no] 
\newcommand{\exshExercisePoints}{no}
\DeclareOptionX{exercisepoints}{\renewcommand{\exshExercisePoints}{yes}}
% ****(OPTION)****
% exerciseindent [none|length unit] [DEFAULT: 2em] 
\newcommand{\exshExerciseIndent}{2em}
\DeclareOptionX{exerciseindent}{\renewcommand{\exshExerciseIndent}{#1}}
% ****(OPTION)**** include tikz
% tikz [yes|no] [DEFAULT: no] 
\newcommand{\exshTikz}{no}
\DeclareOptionX{tikz}{\renewcommand{\exshTikz}{yes}}
% ****(OPTION)****
% displaydate [yes|no] [DEFAULT: yes] 
\newcommand{\exshDisplayDate}{yes}
\DeclareOptionX{displaydate}{\renewcommand{\exshDisplayDate}{#1}}
% ****(OPTION)****
% exercisename [DEFAULT: Exercise] 
\newcommand{\Exercise}{Exercise}
\DeclareOptionX{exercisename}{\renewcommand{\Exercise}{#1}}
% ****(OPTION)****
% worksheetname [DEFAULT: Worksheet] 
\newcommand{\Worksheet}{Worksheet}
\DeclareOptionX{worksheetname}{\renewcommand{\Worksheet}{#1}}
% ****(OPTION)****
% tutorialname [DEFAULT: Tutorial] 
\newcommand{\Tutorial}{Tutorial}
\DeclareOptionX{tutorialname}{\renewcommand{\Tutorial}{#1}}
% ****(OPTION)****
% groupname [DEFAULT: Group] 
\newcommand{\Group}{Group}
\DeclareOptionX{groupname}{\renewcommand{\Group}{#1}}
%%%
\ExecuteOptionsX{11pt}
\ProcessOptionsX
%%%
\LoadClass[a4paper]{scrartcl}
%% --------------------------------------------------- %%
%% -------------- Set Dimensions/Border -------------- %%
%% --------------------------------------------------- %%
\RequirePackage{geometry}
\RequirePackage{setspace}
\geometry{
    a4paper,
    left=2cm,
    right=2cm,
    top=2cm,
    bottom=3cm
}
%% --------------------------------------------------- %%
%% -------------- Custom Logic commands -------------- %%
%% --------------------------------------------------- %%
% Switch implementation
\newcommand{\ifequals}[3]{\ifthenelse{\equal{#1}{#2}}{#3}{}}
\newcommand{\ifnotequals}[3]{\ifthenelse{\equal{#1}{#2}}{}{#3}}
\newcommand{\case}[2]{#1 #2} % Dummy, so \renewcommand has something to overwrite...
\newenvironment{switch}[1]{\renewcommand{\case}{\ifequals{#1}}}{}
%% --------------------------------------------------- %%
%% --------------- Encoding & Language --------------- %%
%% --------------------------------------------------- %%
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[utf8]{inputenc}
% !!! Add your language here !!! %
\RequirePackage[english, ngerman]{babel}
%% --------------------------------------------------- %%
%% -------------------- Packages --------------------- %%
%% --------------------------------------------------- %%
% Math symbols
\RequirePackage{amsmath, amsfonts, amssymb, amsthm, nccmath}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{microtype}
\RequirePackage{stmaryrd}
% Grafics and pdfs
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
% links and refs
\RequirePackage[hidelinks, unicode]{hyperref}
% tikz
\ifequals{\exshTikz}{yes}{%
    \RequirePackage{tikz}%
    \RequirePackage{tikz-qtree}%
    \usetikzlibrary{arrows,calc}%
    \usetikzlibrary{automata, positioning, arrows}%
    \usetikzlibrary{shapes.geometric}%
    \usetikzlibrary{backgrounds}%
}
% latex logic
\RequirePackage{scrlayer-scrpage}
\RequirePackage{totcount}
\RequirePackage{changepage}
\RequirePackage{etoolbox}
\RequirePackage{environ}
\RequirePackage{fp}
% usefull
\RequirePackage{romannum}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage{latexsym}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
%% --------------------------------------------------- %%
%% -------------------- Counters --------------------- %%
%% --------------------------------------------------- %%
% Counter for exercise enviorment 
\newtotcounter{exercisenumber}
\newtotcounter{subexercisenumber}
\newtotcounter{subsubexercisenumber}
% Counter for task 
%\newtotcounter{tasknumber}
%\newtotcounter{subtasknumber}
%\setcounter{tasknumber}{0}
%\setcounter{subtasknumber}{0}
% sum of all points
\xdef\totalpoints{0.0}
%% --------------------------------------------------- %%
%% ----- Commands to import and display settings ----- %%
%% --------------------------------------------------- %%
% Worksheet number
% =============================================
% \sheet[?first exercise nr.]{worksheet number}
% =============================================
\newcommand{\printsheet}{?}
\newcommand{\sheet}[2][]{%
\ifthenelse{\equal{#1}{}}{}{\setcounter{exercisenumber}{#1 -1}}
    \renewcommand{\printsheet}{#2}%
}
% Group Number
% ======================
% \group{group nr./name}
% ======================
\newcommand{\printgroup}{?}
\newcommand{\group}[1]{%
    \renewcommand{\printgroup}{#1}%
}
% Tutorial Number
% ============================
% \tutorial{tutorial nr./name}
% ============================
\newcommand{\printtutorial}{?}
\newcommand{\tutorial}[1]{%
    \renewcommand{\printtutorial}{#1}%
}
% Group Members
% ======================================
% \member{matr. nr}{firstname}{lastname}
% ======================================
\newcommand{\printmembers}{}
\ifthenelse{\equal{\exshStyle}{underline}}{%
    \newcommand{\printmember}[3]{{#2} {#3} & {#1} \\}%
}{}
\ifthenelse{\equal{\exshStyle}{open}}{%
    \newcommand{\printmember}[3]{{#2} {#3}, &{#1} \\}%
}{}
\newcommand{\pdfmembers}{}
\newcommand{\pdfmember}[3]{{#1} {#3}, {#2}; }
\newcommand{\member}[3]{%
\expandafter\renewcommand\expandafter\printmembers\expandafter{\printmembers\printmember{#1}{#2}{#3}}%
\expandafter\renewcommand\expandafter\pdfmembers\expandafter{\pdfmembers\pdfmember{#1}{#2}{#3}}%
}
% Class
% ==================
% \class{class name}
% ==================
\newcommand{\printclass}{?}
\newcommand{\class}[1]{%
    \renewcommand{\printclass}{#1}%
}
% Semester
% =========================
% \tutorial{semester desc.}
% =========================
\newcommand{\printsemester}{?}
\newcommand{\semester}[1]{%
    \renewcommand{\printsemester}{#1}%
}
% include file with settins for this class
\IfFileExists{../template/settings.tex}{\input{../template/settings}}{}
%% --------------------------------------------------- %%
%% -------------- Exercise Points Logic -------------- %%
%% --------------------------------------------------- %%
% add Points to table and add header 
% ==================================
% \addPT{exercise nr.}{points}
% ==================================
\newcommand{\addPT}[2]{%
    \edef\tempA{\##1 &}
    \edef\tempB{\qquad/#2 &}
    \expandafter\gappto\expandafter\PTableA\expandafter{\tempA}%  add to table header 
    \expandafter\gappto\expandafter\PTableB\expandafter{\tempB}% add points space to table
    \expandafter\gappto\expandafter\PTHead\expandafter{c | }% add to tabular def
}
% display the Point table with \pointtable
\newcommand{\pointtable}{%
    {\renewcommand{\arraystretch}{1.2}\Large
    \begin{center}
    % check if racecondition works out 
    \ifcsname PTableASaved\endcsname
        \begin{tabular}{|\PTHeadSaved c |}
            \hline
            \PTableASaved $\Sigma$ \\ \hline
            \PTableBSaved \qquad / \totalpointsSaved \\
            \hline 
        \end{tabular}
    \else
        Compile again\ClassWarning{Compile again} % warning if not
    \fi
    \end{center}
    }
}
% End of Document - Add points for Table
\AtEndDocument{
    \ifthenelse{\equal{\exshPointTable}{yes} \OR \equal{\exshExercisePoints}{yes}}{%
        \makeatletter
        \immediate\write\@mainaux{\string\gdef\string\PTableASaved{\PTableA}}%
        \immediate\write\@mainaux{\string\gdef\string\PTableBSaved{\PTableB}}%
        \immediate\write\@mainaux{\string\gdef\string\PTHeadSaved{\PTHead}}%
        \FPround\totalpoints\totalpoints{1}%
        \immediate\write\@mainaux{\string\gdef\string\totalpointsSaved{\FPprint{\totalpoints}}}%
        \makeatother
    }{}%
}
%% --------------------------------------------------- %%
%% --------------------- Styling --------------------- %%
%% --------------------------------------------------- %%
\setlength{\parindent}{\exshParidnent}
\renewcommand{\labelenumi}{(\alph{enumi})}
\pagestyle{plain}
\clearpairofpagestyles{}
\setlength{\headheight}{\baselineskip}
\setlength{\footheight}{\baselineskip}
%\renewcommand{\thepage}{\arabic{page}}
\ifoot*{\pagemark}
\setlength{\fboxrule}{0.4pt}
\setlength{\fboxsep}{4pt}
\AtBeginDocument[A]{%
    \pagenumbering{arabic}%
    % insert pdf information
    \hypersetup{
        pdftitle = {\Worksheet{} \printsheet{}},
        pdfauthor = {\Group{} \printgroup{}},
        pdfsubject = {\printclass{} \printsemester{}}
    }%
}
%% --------------------------------------------------- %%
%% ------ Styling Header with different styles ------- %%
%% --------------------------------------------------- %%
\ifthenelse{\equal{\exshStyle}{underline}}{%
    %% ------------------------- %%
    %% ----- Undline Style ----- %%
    %% ------------------------- %%
    \AtBeginDocument[B]{%
        % Heading
        {\raggedright
        \begin{tabular}{l}
            \ifnotequals{\printclass}{?}{\printclass{} \\}%
            \ifnotequals{\printsemester}{?}{\printsemester{} \\}%
            \ifnotequals{\printgroup}{?}{\Group{} \printgroup{} \\}%
            \ifnotequals{\printtutorial}{?}{\Tutorial{} \printtutorial{} \\}%
            \ifequals{\exshDisplayDate}{yes}{%
              \makeatletter%
                \@date \\%
              \makeatother%
            }%
            \vspace*{-\baselineskip}
        \end{tabular}%
        }%
        \hfill%
        {\Large \Worksheet{} \printsheet}%
        \hfill
        \begin{tabular}{l l}%
            \printmembers{}
        \end{tabular}%
        \vspace*{-\baselineskip}
        \hrule%
        \ifequals{\exshPointTable}{yes}{%
            \vspace{\baselineskip}%
            \pointtable{}%
            \vspace{\baselineskip}%
        }%
    }%
}{}%
\ifthenelse{\equal{\exshStyle}{open}}{%
    %% ------------------------- %%
    %% ------- Open Style ------ %%
    %% ------------------------- %%
    \setkomafont{pagehead}{\sffamily\upshape}
    \AtBeginDocument[B]{{
       \sffamily\upshape%
       \setstretch{1.0}%
       \begin{minipage}[c][3.8cm][t]{0.50\textwidth}\vspace{0pt}%
            {\huge \textbf{\printclass}} \vspace*{0.2\baselineskip}\\
            {\Large \textbf{\Worksheet{} \printsheet{}}} \vspace*{0.3\baselineskip} \\
            \ifnotequals{\printgroup}{?}{%
                \Group{} \printgroup{} \\%
            }\ifnotequals{\printtutorial}{?}{%
                \Tutorial{} \printtutorial{} \\%
            }\ifnotequals{\printsemester}{?}{%
                \printsemester{}\\%
            }\ifequals{\exshDisplayDate}{yes}{%
              \makeatletter%
                \@date%
              \makeatother%
            }%
        \end{minipage}%
        \begin{minipage}[c][3.8cm][t]{0.50\textwidth}\vspace{0pt}%
            \setlength{\tabcolsep}{1pt}%
            \hfill%
            \begin{tabular}{rr}%
                \printmembers{}%
            \end{tabular}%
        \end{minipage}%
        \ifequals{\exshPointTable}{yes}{%
            \pointtable{}%
        }%
    }}%
}{}%
%% --------------------------------------------------- %%
%% -------------- Exercise Environment --------------- %%
%% --------------------------------------------------- %%
% Headline Exercise with Nr. (Point display optional)
% ===================================================
% \begin{exercise}[nr. points for this exercise]
% ===================================================
\newenvironment{exercise}[1][]{%
    \ifthenelse{\equal{#1}{}}{\let\points\undefined}{\def\points{#1}}
    \stepcounter{exercisenumber}
    \stepcounter{section}
    \setcounter{subexercisenumber}{0}
    \setcounter{subsubexercisenumber}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \section*{\Exercise~\arabic{exercisenumber}}
}{%
    \ifdef{\points}{%
        \addPT{\arabic{exercisenumber}}{\points}
        \FPadd\result\totalpoints{\points} % add points to totalpoints
        \xdef\totalpoints{\FPprint\result} % store value globally
        \ifequals{\exshExercisePoints}{yes}{%
            \begin{flushright}%
                \framebox[2cm]{\hspace{1.1cm}/\hfill\points}%
            \end{flushright}%
        }%
    }{}%
}%
% Subexercise with exercise nr. (indent optional)
% ===================================================
% \begin{subexercise}
% ===================================================
\newenvironment{subexercise}{%
    \stepcounter{subexercisenumber}
    \stepcounter{subsection}
    
    \ifnum\value{subexercisenumber}=1
    \else
        \vspace{1em}
    \fi
    \paragraph{\alph{subexercisenumber})}
    \ifnotequals{\exshExerciseIndent}{none}{%
        \begin{adjustwidth}{\exshExerciseIndent}{0em}%
        \vspace{-\baselineskip}%
    }%
}{%
    \ifnotequals{\exshExerciseIndent}{none}{\end{adjustwidth}}%
}
% Subexercise without exercise nr. (argument to step counter)
% ===================================================
% \begin{subexercise*}[step=0]
% ===================================================
\newenvironment{subexercise*}[1][0]{%
    \addtocounter{subexercisenumber}{#1}%
    \addtocounter{subsection}{#1}%
    \ifnotequals{\exshExerciseIndent}{none}{%
        \begin{adjustwidth}{\exshExerciseIndent}{0em}%
    }%
}{%
    \ifnotequals{\exshExerciseIndent}{none}{\end{adjustwidth}}%
}
% SubSubEx. with exercise nr.
% ===================================================
% \begin{subsubexercise}
% ===================================================
\newenvironment{subsubexercise}{%
    \stepcounter{subsubexercisenumber}
    \stepcounter{subsubsection}
    \ifnum\value{subsubexercisenumber}=1
    \else
        \vspace{1em}
    \fi
    \paragraph{\roman{subsubexercisenumber})}
    \ifnotequals{\exshExerciseIndent}{none}{%
        \begin{adjustwidth}{\exshExerciseIndent}{0em}%
        \vspace{-\baselineskip}%
    }%
}{%
    \ifnotequals{\exshExerciseIndent}{none}{\end{adjustwidth}}%
}
% SubSubEx. without exercise nr.
% ===================================================
% \begin{subsubexercise*}[step=0]
% ===================================================
\newenvironment{subsubexercise*}[1][0]{%
    \addtocounter{subsubexercisenumber}{#1}%
    \addtocounter{subsubsection}{#1}%
    \ifnotequals{\exshExerciseIndent}{none}{%
        \begin{adjustwidth}{\exshExerciseIndent}{0em}%
    }%
}{%
    \ifnotequals{\exshExerciseIndent}{none}{\end{adjustwidth}}%
}
%% --------------------------------------------------- %%
%% ----------------- Task Commands ------------------- %%
%% --------------------------------------------------- %%
% Headline Task
% ===================================================
% \task[exercise nr.]{?points}
% ===================================================
\newcommand{\task}[2][]{%
    % reset subexercise counter
    \setcounter{subexercisenumber}{0}
    \setcounter{subsubexercisenumber}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    % arg 2
    \ifthenelse{\equal{#1}{}}{%
        % arg is empty -> just exercisenumer++
        \stepcounter{exercisenumber}%
        \stepcounter{section} %
    }{%
        % arg non empty -> set exercisenumer
        \setcounter{exercisenumber}{#1}%
        \setcounter{section}{#1}%
    }%
    % arg 1, points
    \ifnotequals{#2}{}{%
        \def\pointst{#2}
        \FPadd\result\totalpoints{\pointst} % add points to totalpoints
        \xdef\totalpoints{\FPprint\result} % store value globally
        \addPT{\arabic{exercisenumber}}{\pointst}%
    }%
    \section*{\Exercise~\arabic{exercisenumber}}%
}

% Headline subtask (with linebreak)
% ===================================================
% \subtask[exercise nr.]{}
% ===================================================
\newcommand{\subtask}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \stepcounter{subexercisenumber}%
        \stepcounter{subsection}%
    }{%
        \setcounter{subexercisenumber}{#1}%
        \setcounter{subsection}{#1}%
    }%
    \paragraph*{\alph{subexercisenumber})}\mbox{}\vspace{0.4\baselineskip}\\%
}

% Headline subtask (without linebreak)
% ===================================================
% \subtask[exercise nr.]{}
% ===================================================
\newcommand{\Subtask}[1][]{%
    \ifthenelse{\equal{#1}{}}{%
        \stepcounter{subexercisenumber}%
        \stepcounter{subsection}%
    }{%
        \setcounter{subexercisenumber}{#1}%
        \setcounter{subsection}{#1}%
    }%
    \paragraph*{\alph{subexercisenumber})}%
}
%% --------------------------------------------------- %%
%% --------------- Custome Definitions --------------- %%
%% --------------------------------------------------- %%
\IfFileExists{../template/custome_definitions.tex}{\input{../template/custome_definitions}}{}