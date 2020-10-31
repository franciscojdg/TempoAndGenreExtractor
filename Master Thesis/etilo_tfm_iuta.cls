%\documentclass[11pt]
%\usepackage[utf8]{inputenc}
%\usepackage{amsmath}
%\usepackage{amsfonts}
%\usepackage{amssymb}
%\usepackage[left=4cm,right=2.5cm,top=4cm,bottom=2.5cm]{geometry}
%\author{Francisco J Dura}
%\title{test}
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{etilo_tfm_iuta}
              [2011/11/10 v2.0
   LaTeX document class]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\usepackage{setspace}
\onehalfspacing
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\usepackage{vmargin}
\setmarginsrb           { 4.0cm}  % left margin
                        { 4.0cm}  % top margin
                        { 2.5cm}  % right margin
                        { 2.5cm}  % bottom margin
                        {  20pt}  % head height
                        {0.62cm}  % head sep
                        {   9pt}  % foot height
                        {0.76in}  % foot sep
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.
\usepackage{fancyhdr}
\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}}
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1}\markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{axiom}[theorem]{Axiom}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
%%\usepackage[centerlast,small,sc]{caption2}
\usepackage{sectsty}
\usepackage[spanish]{babel}
\usepackage{caption}
\addto\captionsspanish{\def\tablename{Tabla}}
\setlength{\captionmargin}{20pt}
\newcommand{\fref}[1]{Figura~\ref{#1}}
\newcommand{\tref}[1]{Tabla~\ref{#1}}
\newcommand{\eref}[1]{Ecuación~\ref{#1}}
\newcommand{\cref}[1]{Capítulo~\ref{#1}}
\newcommand{\sref}[1]{Sección~\ref{#1}}
\newcommand{\aref}[1]{Apéndice~\ref{#1}}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}
%%% solution 2
\newcommand{\setmeterb}[2]{\ensuremath{%
  \vcenter{\offinterlineskip
    \halign{\hfil##\hfil\cr
            $\scriptstyle#1$\cr
            \noalign{\vskip1pt}
            $\scriptstyle#2$\cr}
  }}%
}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}
\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage[scriptsize]{subfigure}
\usepackage{booktabs}
\usepackage{rotating}
\usepackage{listings}
%%\usepackage{lstpatch}
\usepackage{xifthen}
\lstset{captionpos=b,
        frame=tb,
        basicstyle=\scriptsize\ttfamily,
        showstringspaces=false,
        keepspaces=true}
\lstdefinestyle{matlab} {
        language=Matlab,
        keywordstyle=\color{blue},
        commentstyle=\color[rgb]{0.13,0.55,0.13}\em,
        stringstyle=\color[rgb]{0.7,0,0} }
\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks,linkcolor={blue},citecolor={blue},urlcolor={red},
   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
\pdfstringdefDisableCommands{
   \let\\\space
}
\newcommand*{\supervisor}[1]{\def\supname{#1}}
\newcommand*{\examiner}[1]{\def\examname{#1}}
\newcommand*{\degree}[1]{\def\degreename{#1}}
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\addresses}[1]{\def\addressnames{#1}}
\newcommand*{\university}[1]{\def\univname{#1} \def\UNIVNAME{\uppercase{#1}}}
\newcommand*{\department}[1]{\def\deptname{#1} \def\DEPTNAME{\uppercase{#1}}}
\newcommand*{\group}[1]{\def\groupname{#1} \def\GROUPNAME{\uppercase{#1}}}
\newcommand*{\faculty}[1]{\def\facname{#1} \def\FACNAME{\uppercase{#1}}}
\newcommand*{\subject}[1]{\def\subjectname{#1}}
\newcommand*{\keywords}[1]{\def\keywordnames{#1}}
\newcommand*{\removecolourlinks}{\hypersetup{colorlinks=true,linkcolor=blue,citecolor=red,urlcolor=blue,filecolor=blue}}
\supervisor  {}
\examiner    {}
\degree      {}
\authors     {}
\university  {\texorpdfstring
            {\lowercase{\href{http://www.uah.es/}}{\lowercase{\textcolor{black}}{Universidad de Alcal\'{a}}}}
            {Universidad de Alcal\'{a}}
            }
\department  {\texorpdfstring
             {\lowercase{\href{...}}{\lowercase{\textcolor{black}}{...}}}
			 {...}
			 }
\group       {Grupo}
			 
\faculty     {\texorpdfstring
             {\lowercase{\href{...}}{\lowercase{\textcolor{black}}{...}}}
			 {IMF}
			 }
\addresses   {}
\subject     {}
\keywords    {}
\renewcommand\maketitle{
  \btypeout{Title Page}
  \hypersetup{ pdftitle={\@title}}
  \hypersetup{ pdfsubject=\subjectname}
  \hypersetup{ pdfauthor=\authornames}
  \hypersetup{ pdfkeywords=\keywordnames}
  \thispagestyle{empty}
  \begin{titlepage}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \setcounter{footnote}{0}
    \null\vfil
    \vskip 60\p@
    \begin{center}
      \setlength{\parskip}{0pt}
      {\large\textbf{\UNIVNAME}\par}
  \bigskip
      \smallskip
      \includegraphics[height=60mm]{escudo_uah.png}
         \bigskip
        \bigskip
        \bigskip
      \vfill
      \bigskip
      \bigskip
     {\large \bf MASTER EN DEEP LEARNING \par}
     {\large \bf 2018/19 \par}
      \bigskip
      \bigskip
  {\large \bf \MakeUppercase\@title \par}
      \bigskip
      \bigskip
      {\large \textbf{\authornames} \par}
            \bigskip
            \bigskip
            \bigskip
            \bigskip
%      {\large Trabajo de fin de máster \par}
      \vfill
%      {\normalsize Supervisor: \supname \par}
%      {\normalsize Examiner: \examname \par}
      \vfill
      \bigskip
      \bigskip
      \bigskip
%      {\large \@date \par}
      \bigskip
    \end{center}
    \par
    \@thanks
    \vfil\null
  \end{titlepage}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \cleardoublepage
}
\newenvironment{abstract}
{
  \btypeout{Abstract Page}
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
     \setlength{\parskip}{0pt}
      \bigskip
      \bigskip
      \smallskip
      \includegraphics[height=50mm]{escudo_uah.png}
      \smallskip
      
      \bigskip
     {\large \bf MASTER EN DEEP LEARNING \par}
     {\large \bf 2018/19 \par}
      \bigskip
      \bigskip
  {\large \bf \MakeUppercase\@title \par}
      \bigskip
      \bigskip
      {\large \textbf{\authornames} \par}
      {\large \textbf{franciscojosedg@gmail.com} \par}
    \bigskip
  \end{center}
}
{
  \vfil\vfil\vfil\null
  \cleardoublepage
}
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{
\refstepcounter{dummy}
\addcontentsline{toc}{chapter}{#1}}
\renewcommand\tableofcontents{
\btypeout{Table of Contents}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
   \cleardoublepage
}\end{spacing}
}
\renewcommand\listoffigures{
\btypeout{Lista de Figuras}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}
              {\MakeUppercase\listfigurename}}
    \@starttoc{lof}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\renewcommand\listoftables{
\btypeout{Lista de Tablas}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
    \@starttoc{lot}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\newcommand\listsymbolname{Nomenclature}
\usepackage{longtable}
\newcommand\listofsymbols[2]{
\btypeout{\listsymbolname}
\addtotoc{\listsymbolname}
    \chapter*{\listsymbolname
      \@mkboth{
          \MakeUppercase\listsymbolname}{\MakeUppercase\listsymbolname}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}

\newcommand\authorshipdeclaration[1]{
\btypeout{Declaration of Authorship}
\addtotoc{Declaration of Authorship}
\thispagestyle{plain}
\null\vfil
\vskip 60\p@
\begin{center}{\Large\bf Declaration of Authorship \par}\end{center}
{\normalsize I, \authornames, declare that the thesis entitled \emph{\@title} and the work presented in the thesis are both my own, and have been generated by me as the result of my own original research. I confirm that:

\begin{itemize}
\item this work was done wholly or mainly while in candidature for a research degree
at this University;
\item where any part of this thesis has previously been submitted for a degree or any
other qualification at this University or any other institution, this has been clearly
stated;
\item where I have consulted the published work of others, this is always clearly
attributed;
\item where I have quoted from the work of others, the source is always given. With
the exception of such quotations, this thesis is entirely my own work;
\item I have acknowledged all main sources of help;
\item where the thesis is based on work done by myself jointly with others, I have
made clear exactly what was done by others and what I have contributed myself;
\ifthenelse{\isempty{#1}}
{\item none of this work has been published before submission}
{\item parts of this work have been published as: #1}
\end{itemize}

\vspace{15.0mm}
Signed:.......................................................................................................................

\vspace{3.0mm}
Date:..........................................................................................................................
}
\vfil\vfil\null
\cleardoublepage
}
\newcommand\acknowledgements[1]{
\btypeout{Agradecimientos}
\addtotoc{Agradecimientos}
\thispagestyle{plain}
\null\vfil
\vskip 60\p@
\begin{center}{\Large\bf Agradecimientos \par}\end{center}
{\normalsize #1}
\vfil\vfil\null
\cleardoublepage
}
\newcommand\dedicatory[1]{
\btypeout{Dedicatory}
\thispagestyle{plain}
\null\vfil
\vskip 60\p@
\begin{center}{\Large \sl #1}\end{center}
\vfil\null
\cleardoublepage
}
\renewcommand{\bibname}{Bibliografía}
\renewcommand\backmatter{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \addtotoc{\bibname}
  \btypeout{\bibname}
  \@mainmatterfalse}


\endinput
%%
%% End of file `ecsminithesis.cls'.
