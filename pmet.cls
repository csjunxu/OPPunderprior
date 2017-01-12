%% VERSION 1c1 ON 24 SEP 2003 OF pmet.cls
%%
%% This is file`pmet.cls', a modification of `psychometrika.cls', which was a modification of `article.cls'.
%%
%% Created for the Psychometric Society by Integre Technical Publishing.
%%
%% This file may be freely distributed and modified.  If you modify the file,
%% please document any changes and rename.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{pmet}
%%              [last revised 2003/10/02]
%% from Eikhout; generic macro to test equivalence of token strings
\def\ifEqString#1#2{\edef\testa{#1}\edef\testb{#2}%
    \ifx\testa\testb}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\if@compatibility\else
\DeclareOption{custompaper}
   {\setlength\paperheight {10.25in}%
    \setlength\paperwidth  {7in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{submit}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{custompaper,twoside,onecolumn,final,submit}
\ProcessOptions
\input{psycho10.clo}
\setlength\paperheight {10.25in}%
    \setlength\paperwidth  {7in}%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@}
\emergencystretch10pt
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{3}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{4}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\newcounter{volume} \def\thevolume{\arabic{volume}}
\newcounter{issue}  \def\theissue{\arabic{issue}}
\newcounter{annual} \def\theannual{\arabic{annual}}\setcounter{annual}{0}
%\newcounter{submitted}\def\thesubmitted{\arabic{submitted}}
%    \setcounter{submitted}{0}
%\newcounter{annualabb} %\def\theannualabb{\theannual-\theissue}\setcounter{annualabb}{35}
\newtoks\articleid  %\def\thearticleid{\arabic{articleid}}
    \articleid={0000}
\newtoks\articletype
    \articletype={A}
    \edef\thearticletype{\the\articletype}%
\newtoks\reviewtype
    \reviewtype={R}
\newtoks\notestype
    \reviewtype={N}
\newtoks\erratatype
    \reviewtype={E}
\newcounter{tempfirstpage}  \def\thefirstpage{\arabic{tempfirstpage}}
\newcommand\firstpage[1]{\setcounter{tempfirstpage}{#1}\setcounter{page}{#1}}
\newcounter{lastpage}   \def\thelastpage{\arabic{lastpage}}
\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\normalsize\rlap{\thepage}\hfill\leftmark\hfill}%
      \def\@oddhead{\normalsize\hfill\textsc{\MakeLowercase{\rightmark}}\hfill\llap{\thepage}}%
      \let\@mkboth\markboth
    \markboth{\textsc{psychometrika submission}}{\textsc{psychometrika submission}}
    \def\sectionmark##1{}%
    \def\subsectionmark##1{}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
\def\ps@plain{\let\@mkboth\@gobbletwo
     \let\@oddhead\@empty\def\@oddfoot{\reset@font\rmfamily\hfil\thepage
     \hfil}\let\@evenhead\@empty
    \def\@evenfoot{\reset@font\rmfamily\hfil\thepage
     \hfil}}
\def\ps@titleplain{\let\@mkboth\@gobbletwo
     \def\@oddhead{\reset@font\normalsize\rmfamily
    $\smash{\footnotesize\begin{tabular}[t]{@{}l@{}}
%    \textsc{psychometrika---vol.} \thevolume, \textsc{no.} \theissue,
%        \ifEqString{\thefirstpage}{\thelastpage}\relax\thefirstpage\else
%        \thefirstpage--\thelastpage\fi\\
%        \textsc{\ifcase\theissue\or march\or june\or september\or december\fi}\
%         \theannual
         \end{tabular}}$\hfil}%
        \def\@oddfoot{\reset@font\normalsize\rmfamily
            \rlap{\footnotesize
            $\smash{\begin{tabular}[t]{@{}l@{}}
%            0033-3123/\theannual-\theissue/\thesubmitted-\the\articleid
%                -\the\articletype\ \$00.75/0\\
%            \copyright\ \theannual\ The Psychometric Society
            \end{tabular}}$}\hfil\thepage\hfil}%
        \let\@evenhead\@oddhead
        \def\@evenfoot{\reset@font\normalsize\rmfamily
                \thepage\hfil}}

\def\ps@reviewplain{\let\@mkboth\@gobbletwo
     \def\@oddhead{\reset@font\normalsize\rmfamily
    $\smash{\footnotesize\begin{tabular}[t]{@{}l@{}}
%    \textsc{psychometrika---vol.} \thevolume, \textsc{no.} \theissue,
%        \ifEqString{\thefirstpage}{\thelastpage}\relax\thefirstpage\else
%        \thefirstpage--\thelastpage\fi\\
%        \textsc{\ifcase\theissue\or march\or june\or september\or december\fi}\
%        \theannual\\
        \textsc{reviews}\end{tabular}}$\hfil}%
        \def\@oddfoot{\reset@font\normalsize\rmfamily
            \rlap{\footnotesize
            $\smash{\begin{tabular}[t]{@{}l@{}}
%            0033-3123/\theannual-\theissue/\thesubmitted-\the\articleid
%                -\the\articletype\ \$00.75/0\\
%            \copyright\ \theannual\ The Psychometric Society
            \end{tabular}}$}\hfil\thepage\hfil}%
        \let\@evenhead\@oddhead
        \let\@evenfoot\@oddfoot}

\def\ps@singlereviewplain{\let\@mkboth\@gobbletwo
     \def\@oddhead{\reset@font\normalsize\rmfamily
    $\smash{\footnotesize\begin{tabular}[t]{@{}l@{}}
%    \textsc{psychometrika---vol.} \thevolume, \textsc{no.} \theissue,
%        \ifEqString{\thefirstpage}{\thelastpage}\relax\thefirstpage\else
%        \thefirstpage--\thelastpage\fi\\
%        \textsc{\ifcase\theissue\or march\or june\or september\or december\fi}\
%        \theannual\\
        \textsc{review}\end{tabular}}$\hfil}%
        \def\@oddfoot{\reset@font\normalsize\rmfamily
            \rlap{\footnotesize
            $\smash{\begin{tabular}[t]{@{}l@{}}
%            0033-3123/\theannual-\theissue/\thesubmitted-\the\articleid
%                -\the\articletype\ \$00.75/0\\
%            \copyright\ \theannual\ The Psychometric Society
            \end{tabular}}$}\hfil\thepage\hfil}%
        \let\@evenhead\@oddhead
        \let\@evenfoot\@oddfoot}

\def\ps@errataplain{\let\@mkboth\@gobbletwo
     \def\@oddhead{\reset@font\normalsize\rmfamily
    $\smash{\footnotesize\begin{tabular}[t]{@{}l@{}}
%    \textsc{psychometrika---vol.} \thevolume, \textsc{no.} \theissue,
%        \ifEqString{\thefirstpage}{\thelastpage}\relax\thefirstpage\else
%        \thefirstpage--\thelastpage\fi\\
%        \textsc{\ifcase\theissue\or march\or june\or september\or december\fi}\
%        \theannual\\
        \textsc{errata}\end{tabular}}$\hfil}%
        \def\@oddfoot{\reset@font\normalsize\rmfamily
            \rlap{\footnotesize
            $\smash{\begin{tabular}[t]{@{}l@{}}
%            0033-3123/\theannual-\theissue/\thesubmitted-\the\articleid
%                -\the\articletype\ \$00.75/0\\
%            \copyright\ \theannual\ The Psychometric Society
            \end{tabular}}$}\hfil\thepage\hfil}%
        \let\@evenhead\@oddhead
        \let\@evenfoot\@oddfoot}
\def\ps@notesplain{\let\@mkboth\@gobbletwo
     \def\@oddhead{\reset@font\normalsize\rmfamily
    $\smash{\footnotesize\begin{tabular}[t]{@{}l@{}}
%    \textsc{psychometrika---vol.} \thevolume, \textsc{no.} \theissue,
%        \ifEqString{\thefirstpage}{\thelastpage}\relax\thefirstpage\else
%        \thefirstpage--\thelastpage\fi\\
%        \textsc{\ifcase\theissue\or march\or june\or september\or december\fi}\
%        \theannual\\
        \textsc{notes and comments}\end{tabular}}$\hfil}%
        \def\@oddfoot{\reset@font\normalsize\rmfamily
            \rlap{\footnotesize
            $\smash{\begin{tabular}[t]{@{}l@{}}
%            0033-3123/\theannual-\theissue/\thesubmitted-\the\articleid
%                -\the\articletype\ \$00.75/0\\
%            \copyright\ \theannual\ The Psychometric Society
            \end{tabular}}$}\hfil\thepage\hfil}%
        \let\@evenhead\@oddhead
        \let\@evenfoot\@oddfoot}
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let \footnote \thanks
  \null\vfil
    \vspace*{-14pt}
  \vskip 0\p@
  \begin{flushleft}%
    {\LARGE\sffamily \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{flushleft}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
%  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
%  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
        \thispagestyle{titleplain}\@thanks
    \ifEqString{\the\articletype}{\the\reviewtype}%
        \thispagestyle{reviewplain}%
        \markright{reviews}%
    \fi
    \ifEqString{\the\articletype}{\the\erratatype}%
        \thispagestyle{errataplain}%
    \fi
    \ifEqString{\the\articletype}{\the\notestype}%
        \thispagestyle{notesplain}%
    \fi
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
%  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
%  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\newcounter{andcounter}\setcounter{andcounter}{0}
%\def\and{\addtocounter{andcounter}}

\newif\ifnotitle    \global\notitlefalse
\def\notitle{\title{\strut}\global\notitletrue}

%% DEFINES ARTICLE TITLE
\def\dedication#1{\long\gdef\@dedication{#1}}
\def\address#1{\gdef\@address{#1}}
\def\@maketitle{%
  \newpage
\addtocounter{annual}{\thevolume}%
  \null%\enlargethispage{-1.5\baselineskip}
  \vspace*{36pt}%
\bgroup\parindent0pt\centering
  \let \footnote \thanks
    {\MakeUppercase\@title \par}%
    \vspace*{0pt}%
    \ifnotitle\vspace*{-34pt}\fi
\par
\egroup
  \vskip 0pt
\fi}
\def\author#1{\vspace*{12pt}
    \bgroup\centering\textsc{#1\strut}\par
    \egroup}
\def\affil#1{\vspace*{6pt}
    \bgroup\centering\textsc{\MakeLowercase{#1\strut}}\par
    \egroup}
\def\dedication#1{\vspace*{2pt}\normalsize{\itshape\@dedication}\par
        \vspace*{10pt}}
\long\def\reprints#1{\bgroup
    \def\thefootnote{}
    \footnotetext{#1}\egroup}
\def\received#1#2{\bgroup\parindent0pt\footnotesize\itshape#1\par#2\par\egroup}
\long\def\review#1{\bigskip\hangindent\parindent\hangafter=1\noindent#1\par
    \bigskip}
\def\reviewer#1#2{\medskip
    \hbox to\hsize{\MakeUppercase{#2}\hfill\textit{#1}}}

\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{\par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname~\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}
%% redefine @sect to add period after number
\def\@seccntformat#1{\csname the#1\endcsname.\hskip .5em}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {12\p@ \@plus 4\p@ \@minus 2\p@}%
                                   {9\p@ plus 1\p@ minus 1\p@}%
                                   {\normalfont\normalsize\centering}}
\newcommand\refsection{\@startsection {section}{1}{\z@}%
                                   {12\p@ \@plus 4\p@ \@minus 2\p@}%
                                   {9\p@ plus 1\p@ minus 1\p@}%
                                   {\normalfont\footnotesize\centering}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {12\p@ \@plus 4\p@ \@minus 2\p@}%
                                     {9\p@ plus 1\p@ minus 1\p@}%
                                     {\normalfont\normalsize
        \itshape\centering}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {12\p@ \@plus 4\p@ \@minus 2\p@}%
                                     {9\p@ plus 1\p@ minus 1\p@}%
                                     {\normalfont\normalsize
                    \itshape}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

\newenvironment{abstract}{%
        \list{}{\topsep12\p@ plus4\p@ minus2\p@
            \leftmargin24\p@\rightmargin24\p@
            \listparindent\parindent
            \labelwidth0pt\labelsep0pt
            \parsep0pt
            \itemindent\parindent}
            \footnotesize
            \item[\vrule height7.5pt width0pt]}
      {\endlist}

\newenvironment{keywords}{%
        \list{}{\topsep5\p@
            \leftmargin0\p@\rightmargin0\p@
            \listparindent\parindent
            \labelwidth0pt\labelsep0pt
            \parsep0pt
            \itemindent0pt}
            \item[]Key words: \ignorespaces}
      {\endlist}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\leftmargin\parindent
            \listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\leftmargin\parindent\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newenvironment{manfigure}
               {\vbox\bgroup%\let\caption\figcaption
                    \def\@captype{figure}}
               {\egroup}
\def\tfn{\par
    \hbox\bgroup\vtop\bgroup\hsize\tabwidth
    \raggedright\parindent0pt
    \footnotesize\noindent\arule\ignorespaces}
\def\endtfn{\egroup\egroup}
\def\figskip{\vspace{\textfloatsep}}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\let\caption\tablecaption\small\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\let\caption\tablecaption\small\@dblfloat{table}}
               {\end@dblfloat}
\def\mantable{\@ifnextchar [{\opargmantable}{\regmantable}}
\def\opargmantable[#1]{\hbox to\hsize\bgroup\hss\vbox\bgroup\hsize#1\parindent0pt
            \centering\small\let\caption\tablecaption
                    \def\@captype{table}}
\def\regmantable{\hbox to\hsize\bgroup\hss\vbox\bgroup\hsize\tabwidth\parindent0pt
            \centering\small\let\caption\tablecaption
                    \def\@captype{table}}
\def\endmantable{\egroup\hss\egroup}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{9\p@}
\setlength\belowcaptionskip{4.5\p@}
%% remove \addcontentsline from \@caption; it creates extra space at top of page, -dwd
\long\def\@caption#1[#2]#3{\par\begingroup
    \@parboxrestore
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
\def\caption{\refstepcounter\@captype \@dblarg{\@caption\@captype}}
\def\tablecaption{\refstepcounter\@captype \@dblarg{\@tablecaption\@captype}}
\long\def\@tablecaption#1[#2]#3{\par\begingroup
    \@parboxrestore
    \normalsize
    \@maketablecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \footnotesize\sbox\@tempboxa{#2}%
  \ifdim \wd\@tempboxa >\hsize
    \hb@xt@\hsize{\hfil\textsc{#1.}\hfil}%
    #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\textsc{#1.}\hfil}%
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  }
\newdimen\tabwidth
\setlength\tabwidth{30pc}
\long\def\@maketablecaption#1#2{%
  \footnotesize\sbox\@tempboxa{#2}%
  \ifdim \wd\@tempboxa >\hsize %\tabwidth
    \centerline{\hb@xt@\hsize{\hfil\textsc{#1.\strut}\hfil}}%
    \centerline{\hb@xt@\hsize{\begin{minipage}{\hsize}
        \parindent0pt\raggedright#2\end{minipage}}}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\textsc{#1.}\hfil}%
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
  }
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \itemsep0pt
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\renewenvironment{thebibliography}[1]
     {\refsection*{\refname}%
      \list{}%
           {\topsep3pt
    \leftmargin16pt
        \itemindent-\leftmargin
    \labelwidth0pt\labelsep0pt
    \itemsep0pt
            %\@openbib@code
            %\usecounter{enumiv}%
            %\let\p@enumiv\@empty
            %\renewcommand\theenumiv{\@arabic\c@enumiv}
    }%
\def\bibitem##1{\item\relax}
    \footnotesize
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\renewenvironment{thebibliography}
     {\refsection*{\refname}%
      \list{}%
           {\topsep3pt
    \leftmargin16pt
        \itemindent-\leftmargin
    \labelwidth0pt\labelsep0pt
    \itemsep0pt plus.2pt
            %\@openbib@code
            %\usecounter{enumiv}%
            %\let\p@enumiv\@empty
            %\renewcommand\theenumiv{\@arabic\c@enumiv}
    }%
    \let\bibitem\item
    \footnotesize
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule height0pt %\@width120pt height.5pt
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent16\p@
    \indent
    \@makefnmark#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\flushbottom

%%submit switch added to remove author ID from headers
\def\submit{\global\pagestyle{empty}%
            \global\trimmarkstrue%
            \renewcommand{\markright}{\@empty}}

\def\RepeatTitle#1{\bgroup\parindent0pt\begin{center}\normalsize\MakeUppercase{#1}\end{center}\par\egroup}

%%
%% Modify output for trim marks, tagline
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TRIM MARKS
%% Trim marks added here.  The default is to have the trim
%% marks on, to turn them off call \trimmarksfalse somewhere
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newdimen\fudgetrimdown     \fudgetrimdown=-6pt
\newdimen\fudgetrimright    \fudgetrimright=0pt
\newif\iftrimmarks  \global\trimmarkstrue
\def\final{\global\trimmarksfalse}

\def\tlmark{\hbox{\vrule height .5pt depth 0pt width 18pt%
        \hskip 5.5pt%
        \vrule height 24pt depth -6pt width .5pt}}

\def\trmark{\hbox{\vrule height 24pt depth -6pt width .5pt
        \hskip 5.5pt%
        \vrule height .5pt depth 0pt width 18pt}}%

\def\brmark{\hbox{\vrule height 0pt depth 0pt width 0pt
        \hskip 5.5pt%
        \vrule height 0pt depth 0pt width 0pt}}%

\def\blmark{\hbox{\vrule height 0pt depth 0pt width 0pt%
        \hskip 5.5pt%
        \vrule height 0pt depth 0pt width 0pt}}

\def\imagemarks{\vbox to 0pt{%
    \advance\paperwidth by 48pt\advance\paperheight by 48pt%
    %% I'm not sure why the below fudges are needed
    \advance\paperwidth by -1pt%
    \advance\paperheight by -26pt%
    \hbox{\hskip-24pt\hskip\fudgetrimright%
    \vbox to 0pt{\vskip -24pt\vskip\fudgetrimdown%
        \vbox to \paperheight{%
        \hbox to \paperwidth{\tlmark\hss\trmark}%
        \vss%
        \hbox to \paperwidth{\blmark\hss\brmark}%
        }%
    \vss}}}}

\def\timestring{\begingroup
    \count0 = \time \divide\count0 by 60
    \count2 = \count 0 %The hour.
    \count4 = \time \multiply\count0 by 60
    \advance\count4 by -\count0 %The minute.
    \ifnum\count4<10 \toks1 = {0}% Get a leading zero.
    \else            \toks1 = {}%
    \fi
    \ifnum\count2<12 \toks0 = {a.m.}%
    \else            \toks0 = {p.m.}%
        \advance\count2 by -12
    \fi
    \ifnum\count2=0 \global\count2=12\relax\fi % Make noon and midnight `12'.
    \number\count2:\the\toks1 \number\count4
    \thinspace \the\toks0
\endgroup}
\def\timestamp{\number\day\space\monthname\space\number\year\quad\timestring}

\def\@outputpage{%
  \let \protect \noexpand
  \shipout \vbox{%
    \set@typeset@protect
    \aftergroup\set@typeset@protect
    \@shipoutsetup
    \@begindvi

  
\iftrimmarks\vbox to0pt{\vskip-22pt\hbox to\hsize{\hskip\oddsidemargin\footnotesize
       % Unpublished Submission\qquad
        \hspace{\fill}\textit{Psychometrika} Submission\hspace{\fill}\today%\hspace{\fill}\timestring
            \hspace{\fill}\jobname\hspace{\fill} Page\ \thepage\hss}\vss}
            %\qquad\jobname\qquad     \ \    \hss}\vss}
       \imagemarks
            \global\voffset=-.5in
            \global\hoffset=-.25in
            \else
            \global\voffset=-67pt
            \global\hoffset=-72pt
            \vbox to 0pt{}\fi%
    \vskip \topmargin
    \moveright\@themargin \vbox {%
      \setbox\@tempboxa \vbox to\headheight{%
        \vfil
        \color@hbox
          \normalcolor
          \hbox to\textwidth {%
            \let \label \@gobble
            \let \index \@gobble
            \let \glossary \@gobble %% 21 Jun 91
            \@thehead
            }%
        \color@endbox
        }%                        %% 22 Feb 87
      \dp\@tempboxa \z@
      \box\@tempboxa
      \vskip \headsep
      \box\@outputbox
      \baselineskip \footskip
        \vskip-7pt %for footer position
      \color@hbox
        \normalcolor
        \hbox to\textwidth{%
          \let \label \@gobble
          \let \index \@gobble      %% 22 Feb 87
          \let \glossary \@gobble   %% 21 Jun 91
          \@thefoot
          }%
      \color@endbox
      }%
    }%
  \global \@colht \textheight
  \stepcounter{page}%
  \let\firstmark\botmark
}
\def \@shipoutsetup {%
     \@resetactivechars
     \let\-\@dischyph
     \let\'\@acci\let\`\@accii\let\=\@acciii
     \if@specialpage
       \global\@specialpagefalse\@nameuse{ps@\@specialstyle}%
     \fi
     \if@twoside
       \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
            \let\@themargin\oddsidemargin
       \else \let\@thehead\@evenhead
          \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
       \fi
     \fi
     \reset@font
     \normalsize
     \baselineskip\z@skip \lineskip\z@skip \lineskiplimit\z@
     \let\par\@@par          %% 15 Sep 87
}
\def \@begindvi{%
  \unvbox \@begindvibox
  \global\let \@begindvi \@empty
}

\def\@begintheorem#1#2{\list{}{\topsep12pt plus2pt minus2pt
    \leftmargin0pt\labelwidth0pt\labelsep.5em
    \listparindent\parindent
    \itemindent\parindent
    \def\makelabel##1{##1}}
   \item[\hskip \labelsep{\textit{#1\ #2.}}]}
\def\@opargbegintheorem#1#2#3{\list{}{\topsep12pt plus2pt minus2pt
    \leftmargin0pt\labelwidth0pt\labelsep.5em
    \listparindent\parindent
    \itemindent\parindent
    \def\makelabel##1{##1}}
      \item[\hskip \labelsep{\textit{#1\ #2.}\ (#3)}]}

\def\@endtheorem{\endlist}

\def\nametheorem[#1]{\list{}{\topsep12pt plus2pt minus2pt
    \leftmargin0pt\labelwidth0pt\labelsep.5em
    \listparindent\parindent
    \itemindent\parindent
    \def\makelabel##1{##1}}
      \item[\hskip \labelsep{\textit{#1.}}]}

\def\proof{\@ifnextchar [{\opargproof}{\regproof}}

\def\opargproof[#1]{\list{}{\topsep12pt plus2pt minus2pt
    \leftmargin0pt
    \labelwidth0pt\labelsep.5em
    \listparindent\parindent
    \itemindent\parindent
    \def\makelabel##1{\hskip\labelsep\textit{##1.}}}
    \item[#1]}
\def\regproof{\list{}{\topsep12pt plus2pt minus2pt
    \leftmargin0pt
    \labelwidth0pt\labelsep.5em
    \listparindent\parindent
    \itemindent\parindent
    \def\makelabel##1{\hskip\labelsep\textit{##1.}}}
    \item[Proof]}
\let\endproof\endlist

%\font\pmetrika=pmetrika at 34pt
\font\pmet=cmr5 at 34pt


\def\pline{\centerline{\pmetrika P\kern12.5pt s\kern12.5pt y\kern12.5pt c\kern12.5pt h\kern12.5pt o\kern12.5pt m\kern12.5pt e\kern12.5pt t\kern12.5pt r\kern12.5pt i\kern12.5pt k\kern12.5pt a}
\vskip6pt
\hrule height.5pt
\vskip2pt
\hrule height.5pt

\vspace*{32pt}
}


\def\toclist{\@ifnextchar [{\toca}{\tocb}}

\def\toca[#1]{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}
    \labelsep12pt
    \topsep12pt plus2pt minus2pt
    \itemsep0pt
    \settowidth\leftmargin{#1}
    \advance\leftmargin by\labelsep
    \advance\leftmargin by30pt
    \itemindent-30pt
    \listparindent12pt
    \def\makelabel##1{\hss\llap{##1}}}\fi}
\def\tocb{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}
    \topsep10pt
    \itemsep6pt
    \labelsep12pt
    \settowidth\leftmargin{\tocsize 100}
    \advance\leftmargin by\labelsep
    \advance\leftmargin by30pt
    \itemindent-30pt
    \listparindent-12pt\raggedright
    \parsep0pt
    \def\makelabel##1{\hss\llap{##1}}}
    \def\author##1{\vskip0pt\textit{##1}}%
    \def\listhead##1{\item[]\MakeUppercase{##1}
        \vspace*{-\itemsep}}%
    \tocsize\fi}
\let\endtoclist =\endlist


\def\enumerate{\@ifnextchar [{\enumeratea}{\enumerateb}}

\def\enumeratea[#1]{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}
    \ifnum \@enumdepth=1
        \topsep12pt plus2pt minus2pt
        \else
        \topsep0pt
    \fi
    \labelsep6pt
    \itemsep0pt
    \settowidth\leftmargin{#1}
    \advance\leftmargin by\labelsep
    \listparindent12pt
    \parsep0pt
    \def\makelabel##1{\hss\llap{##1}}}\fi}
\def\enumerateb{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}
    \ifcase\@enumdepth\or
        \topsep12pt plus2pt minus2pt
        \settowidth\leftmargin{1.}%
        \or
        \topsep0pt
        \settowidth\leftmargin{(b)}%
        \or
        \topsep0pt
        \settowidth\leftmargin{(ii)}%
    \fi
    \itemsep0pt
    \labelsep6pt
    \advance\leftmargin by\labelsep
    \listparindent12pt
    \parsep0pt
    \def\makelabel##1{\hss\llap{##1}}}\fi}
\let\endenumerate =\endlist

\def\flenumerate{\@ifnextchar [{\flenumeratea}{\flenumerateb}}

\def\flenumeratea[#1]{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}
    \labelsep6pt
    \topsep12pt plus2pt minus2pt
    \itemsep0pt
    \settowidth\leftmargin{#1}
    \advance\leftmargin by\labelsep
    \advance\leftmargin by\parindent
    \listparindent12pt
    \def\makelabel##1{\rlap{##1}\hss}}\fi}
\def\flenumerateb{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}
    \topsep12pt plus2pt minus2pt
    \itemsep0pt
    \labelsep6pt
    \settowidth\leftmargin{1.}
    \advance\leftmargin by\labelsep
    \listparindent12pt
    \def\makelabel##1{\hss\llap{##1}}}\fi}
\let\endflenumerate =\endlist

\def\itemize{%
  \ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
  \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
  \list{\csname\@itemitem\endcsname}{%
        \topsep12pt plus2pt minus2pt
        \leftmargin12pt
        \labelwidth12pt
        \labelsep0pt
        \itemsep0pt
        \listparindent12pt
       \def\makelabel##1{\rlap{##1}\hss}\fi}}
\let\enditemize =\endlist

\def\unlist{%
  \ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
  %\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
  \list{}{%
        \topsep12pt plus2pt minus2pt
        \leftmargin\parindent
        \labelsep0pt
        \itemsep\smallskipamount
        \def\makelabel##1{\rlap{##1}\hss}\fi}}
\let\endunlist =\endlist

\def\acknowledge{\@ifnextchar [{\acknowledgments}{\acknowledgment}}

\def\acknowledgments[#1]{\list{}{\topsep12pt plus2pt minus2pt
    \leftmargin0pt\rightmargin\leftmargin
    \labelwidth0pt\labelsep1em
    \listparindent\parindent
    \def\makelabel##1{\hskip\labelsep\textbf{##1}}}
    \item[#1]}
\def\acknowledgment{\list{}{\topsep12pt plus2pt minus2pt
    \leftmargin0pt\rightmargin\leftmargin
    \labelwidth0pt\labelsep1em
    \listparindent\parindent
    \def\makelabel##1{\hskip\labelsep\textbf{##1}}}
    \item[Acknowledgment]}
\let\endacknowledge\endlist

%% SPECIAL SECTION FOR NUMBER 4 EACH YEAR
\newcommand\meetinghead{\@startsection {meetinghead}{1}{\z@}%
                                   {12\p@ \@plus 4\p@ \@minus 2\p@}%
                                   {0.001\p@}%
                                   {\normalfont\frontsize\centering}}
\def\meetingheadmark#1{\relax}
\newcommand\indexhead{\@startsection {indexhead}{1}{\z@}%
                                   {12\p@ \@plus 4\p@ \@minus 2\p@}%
                                   {0.001\p@}%
                                   {\normalfont\frontsize\itshape}}
\def\indexheadmark#1{\relax}

\def\meetinglist{\list{}{\topsep0pt
    \leftmargin16pt
        \itemindent-\leftmargin
    \labelwidth0pt\labelsep0pt
    \itemsep0pt
            %\@openbib@code
            %\usecounter{enumiv}%
            %\let\p@enumiv\@empty
            %\renewcommand\theenumiv{\@arabic\c@enumiv}
    }}
\def\endmeetinglist{\endlist}
\let\indexlist\meetinglist
\let\endindexlist\endmeetinglist

\def\lefteqn#1{\hbox to2em{$\displaystyle #1$\hss}}

\newskip\jotskip
\jotskip=6pt plus2pt minus1pt
\jot=\jotskip

\def\eqnarray{\stepcounter{equation}\let\@currentlabel\theequation
\global\@eqnswtrue\m@th
\global\@eqcnt\z@\tabskip\@centering\let\\\@eqncr
\jot\medskipamount
$$\halign to\displaywidth\bgroup\@eqnsel\hskip\@centering
  $\displaystyle\tabskip\z@{##}$&\global\@eqcnt\@ne
  \hfil${\displaystyle {}##{}}$\hfil
  &\global\@eqcnt\tw@ $\displaystyle\tabskip\z@{##}$\hfil
   \tabskip\@centering&\llap{##}\tabskip\z@\cr}

\def\endeqnarray{\@@eqncr\egroup
      \global\advance\c@equation\m@ne$$\global\@ignoretrue}

\frenchspacing

%% various struts to adjust spacing to table rules
\def\abrule{\vrule height11.5pt width0pt depth5.5pt}
\def\arule{\vrule height11.5pt width0pt depth0pt}
\def\brule{\vrule height0pt width0pt depth5.5pt}
%% make tilde active character equivalent to width of "1",
%% for use within tables only
\def\settildes{\catcode`\~=\active
    \def~{\hphantom{1}}}

\def\newpage{\par\relax\vskip-\lastskip\penalty -\@M}

\hyphenation{Psycho-metric Psycho-metrika Table ex-ample}

\endinput
%%
%% End of file `article.cls'.
