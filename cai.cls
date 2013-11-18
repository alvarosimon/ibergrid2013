\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cai}
              [private
 Non-standard LaTeX document class]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\ExecuteOptions{10pt,twoside,onecolumn,draft,titlepage}
\ProcessOptions
\input{my1\@ptsize.clo}
\input{latexsym.sty}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.8}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.8}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.1}
\renewcommand\floatpagefraction{.9}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
%%%%%%%%%%%%%

 \def\surname#1{{\scbn#1}}

\font\rmbn=cmr12 scaled\magstep1
\font\scbn=cmcsc10 scaled\magstep2
\font\scs=cmcsc9 scaled\magstep1
\font\bfbn=cmbx12 scaled\magstep1
\font\bigrm=cmr12
\font\bigbf=cmbx12 %scaled \magstephalf


\newskip\@indentskip
\newskip\smallindent
\newskip\@footindent
\newskip\@leftskip

\@indentskip=0.70cm
\smallindent=1em
\@footindent=\smallindent
\@leftskip=1pc

\mark{{}{}}

\newcount\authorcount@
\authorcount@=0
\newif\ifbufempty\bufemptytrue
\expandafter\gdef\csname @author\the\authorcount@\endcsname{\mbox{}}
\expandafter\gdef\csname @affil\the\authorcount@\endcsname{\mbox{}}
\def\author{\global\advance\authorcount@ by 1\@ifnextchar [{\@authortwo}{\@authorone}}%
\def\@shortauthor{}
\def\@authorcomma{\ifbufempty\else,\fi}
\def\@authortwo[#1]#2{\expandafter\gdef\csname @author\the\authorcount@\endcsname{#2}\@sauthor{#1}}
\def\@authorone#1{\expandafter\gdef\csname @author\the\authorcount@\endcsname{#1}\@sauthor{#1}}
\newtoks\buffer
\def\@sauthor#1{\expandafter\buffer\expandafter{\the\buffer\@authorcomma~#1\bufemptyfalse}}
\def\affiliation#1{\expandafter\gdef\csname @affil\the\authorcount@\endcsname{#1}
\expandafter\gdef\csname @email\the\authorcount@\endcsname{\relax}}
\gdef\@shortauthor{\the\buffer}

\def\email#1{\expandafter\gdef\csname @email\the\authorcount@\endcsname{{\tt\ignorespaces#1}}}
\def\www#1{\expandafter\gdef\csname @www\the\authorcount@\endcsname{{\tt\ignorespaces#1}}}
\gdef\@title{\mbox{}}
\def\title{\@ifnextchar [{\@titletwo}{\@titleone}}
\def\@titletwo[#1]#2{\gdef\@title{\uppercase{#2}}\gdef\@shorttitle{#1}}
\def\@titleone#1{\gdef\@title{\uppercase{#1}}\gdef\@shorttitle{#1}}
\def\shorttitle#1{\gdef\@shorttitle{#1}}
\gdef\@shorttitle{\@title}
\def\volume#1{\gdef\@volume{#1}}
\gdef\@volume{20}
\def\yyear#1{\gdef\@year{#1}}
\gdef\@year{2001}
\def\pagerange#1{\gdef\@pagerange{#1}}
\gdef\@pagerange{\pagerange}
\gdef\@journal{Computing and Informatics,
 Vol.~\@volume, \@year, \@pagerange\@pageproof}

\gdef\page#1{\setcounter{page}{#1}}
\gdef\@pageproof{, V~\the\year-\ifcase\the\month\or Jan\or Feb\or Mar\or Apr\or May\or Jun\or Jul\or Aug\or Sep\or Oct\or Nov\or Dec\fi-\the\day}
\gdef\noversion{\gdef\@pageproof{}}
\pagerange{\pageref{firstpage}--\pageref{lastpage}}

\def\communicated#1{\gdef\@communicated{Communicated by #1}}
\def\nocommunicated{\gdef\@communicated{}}
\gdef\@communicated{Communicated by\dots}
\def\received#1#2{\gdef\@received{Manuscript received #1%
\def\mak{#2}\ifx\mak\empty\else; revised #2\fi}}
\gdef\@received{Manuscript received \dots}
\def\noreceived{\gdef\@received{}}
\gdef\revised#1{\gdef\@received{Revised manuscript received #1}}

  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\hss\vbox {\hsize=\textwidth \hbox to \textwidth
                  {\strut\small\bigrm\thepage\hfill\it\@shortauthor}
               \vskip 2.5pt\vss}}%
      \def\@oddhead{\hss\vbox {\hsize=\textwidth \hbox to \textwidth
               {\strut\small\it \@shorttitle \hfill\bigrm\thepage}
               \vskip 2.5pt\vss}}%
      \let\@mkboth\markboth
}
\def\ps@titlepage{\let\@mkboth\@gobbletwo
 \def\@oddhead{\hss\vbox to \headheight{\hsize=\textwidth \hbox to \textwidth
               {\strut\small\rm\@journal\hfill}
                \vss}}
 \def\@oddfoot{}
 \def\@evenhead{\hss\vbox to \headheight{\hsize=\textwidth \hbox to \textwidth
               {\strut\small\rm\@journal\hfill}
               \vss}}
 \def\@evenfoot{}
}

\newcommand\maketitle{\par
  \begingroup
    \def\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \thispagestyle{titlepage}
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \def\and{\end{author@tabular}\vskip .25em\par
   \begin{author@tabular}[t]{@{}c@{}}}
}
\def\@maketitle{%
  \newpage
  \null
   \vspace*{1.8cm}
 {\parindent 0pt \sloppy
  {\raggedright\fontsize{14.4pt}{16pt}\bfseries\@title%\if\@thanks\empty\else$^{\footnotemark}$\fi
  \par}
  \vskip0.2cm
  \count@\z@ \loop\ifnum\count@<\authorcount@\advance\count@\@ne
  {\vskip 20pt{\fontsize{14.4pt}{16pt}\rmfamily
   \begin{tabular}[t]{@{}l@{}}\csname @author\the\count@\endcsname
   \end{tabular}\par}
  \kern0.3cm\it
   \begin{tabular}[t]{@{}l@{}}%\renewcommand{\arraystretch}{1.1}
   \csname @affil\the\count@\endcsname\\
   \def\param@{\csname @email\the\count@\endcsname}%
   \if\param@\empty\else e-mail:~\csname @email\the\count@\endcsname\\\fi
   \def\param@{\csname @www\the\count@\endcsname}%
   \if\param@\empty\else www:~\csname @www\the\count@\endcsname\fi
   \end{tabular}\par}
 \repeat\global\authorcount@=0
  \vskip12truept
  \small\noindent\@received\par
  \noindent\@communicated\par}
}
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@arabic\c@part}
\renewcommand \thesection{\@arabic\c@section}
\renewcommand\thesubsection{\@arabic\c@section.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
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

\def\@seccntformat#1{\csname the#1\endcsname~}

\newcommand\section[1]{\@startsection {section}{1}{\z@}%
                                   {19pt plus 3pt minus 2pt}%
                                   {14.5pt plus 0pt minus 2pt}%
                                   {\global\@afterindentfalse\noindent\bigbf}{\MakeUppercase{#1}}}

\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {16.5pt plus 3pt minus 2pt}%
                                     {14.5pt plus 0pt minus 2pt}%
                                     {\global\@afterindentfalse\noindent\bigbf}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {14.5pt plus 3pt minus 2pt}%
                                     {12.5pt plus 0pt minus 2pt}%
                                     {\global\@afterindentfalse\normalfont\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}

\setlength\leftmargini {\@indentskip}
\leftmargin  \leftmargini
\setlength\leftmarginii  {1.5pc}
\setlength\leftmarginiii {1.5pc}
\setlength\leftmarginiv  {1.5pc}
\setlength\leftmarginv  {1pc}
\setlength\leftmarginvi {1pc}
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
\newcommand\labelenumiii{\theenumiii}
\newcommand\labelenumiv{\theenumiv}
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

\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -\@indentskip%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin \@indentskip}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent \smallindent
                        \itemindent    \listparindent
                        \leftmargin2.5pc
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax\small}
               {\endlist}

\newenvironment{quote}
               {\list{}{\leftmargin2.5pc\rightmargin\leftmargin}%
                \item\relax\small}
               {\endlist}

\newenvironment{unnum}{\list{}{\labelwidth\z@
       \leftmargin \parindent
       \itemindent-\parindent}}
       {\endlist}

\def\newtheorem#1{%
  \@ifnextchar[{\@othm{#1}}{\@nthm{#1}}}
\def\@nthm#1#2{%
  \@ifnextchar[{\@xnthm{#1}{#2}}{\@ynthm{#1}{#2}}}
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
          \@thmcounter{#1}}%
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}
\def\@ynthm#1#2{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}%
     \expandafter\xdef\csname the#1\endcsname{\@thmcounter{#1}}%
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}
\def\@othm#1[#2]#3{%
  \@ifundefined{c@#2}{\@nocounterr{#2}}%
    {\expandafter\@ifdefinable\csname #1\endcsname
    {\global\@namedef{the#1}{\@nameuse{the#2}}%
  \global\@namedef{#1}{\@thm{#2}{#3}}%
  \global\@namedef{end#1}{\@endtheorem}}}}
\def\@thm#1#2{%
  \refstepcounter{#1}%
  \@ifnextchar[{\@ythm{#1}{#2}}{\@xthm{#1}{#2}}}
\def\@xthm#1#2{%
  \@begintheorem{#2}{\csname the#1\endcsname}\ignorespaces}
\def\@ythm#1#2[#3]{%
  \@opargbegintheorem{#2}{\csname the#1\endcsname}{#3}\ignorespaces}
\def\@thmcounter#1{\noexpand\arabic{#1}}
\def\@thmcountersep{.}
\def\@begintheorem#1#2{\trivlist
   \item[\hskip \labelsep{\bfseries #1 #2.}]}
\def\@opargbegintheorem#1#2#3{\trivlist
      \item[\hskip \labelsep{\bfseries #1\ #2\ {\mdseries(#3)}.}]}
\def\@endtheorem{\endtrivlist}

\newenvironment{proof}{\trivlist\item\relax{\bf Proof.\ }\ignorespaces}
{\hfill{\large$\Box$}\endtrivlist}
\newenvironment{proof*}{\trivlist\item\relax{\bf Proof.\ }\ignorespaces}
{\endtrivlist}

\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{6\p@}
\setlength\tabcolsep{7\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{1.5\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}

\def\caption{\refstepcounter\@captype \@dblarg{\@caption\@captype}}
\long\def\@caption#1[#2]#3{%
  \par
  \addcontentsline{\csname ext@#1\endcsname}{#1}%
    {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fcapjust@#1\endcsname
                \csname fcapsize@#1\endcsname
                \csname fname@#1\endcsname
                \csname fnum@#1\endcsname}%
               {#3}\par%\csname fcapstyle@#1\endcsname

  \endgroup}

\newbox\bbb
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{htbp}
\def\ftype@figure{2}
\def\ext@figure{lof}
\def\fname@figure{\global\setbox\bbb=\hbox{Fig.\ }}
\def\fnum@figure{\figurename\ \thefigure}
\newenvironment{figure}
               {\@float{figure}\centering}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}\centering}
               {\end@dblfloat}

\def\fcapjust@figure{\sloppy}
\def\fcapsize@figure{\small\rm}
\def\fcapstyle@figure{\small\rm}

\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{htbp}
\def\ftype@table{1}
\def\ext@table{lot}
\def\fname@table{\global\setbox\bbb=\hbox{Table\ }}
\def\fnum@table{\tablename\ \thetable}
\newenvironment{table}
               {\@float{table}\centering\small}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}\centering}
               {\end@dblfloat}

\def\fcapjust@table{\sloppy}
\def\fcapsize@table{\small\rm}
\def\fcapstyle@table{\small\rm}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10pt}
\setlength\belowcaptionskip{0\p@}

\newbox\allparagraph
\newbox\faa
\newcount\linenum
\long\def\@makecaption#1#2{%
%\linenum=0
\def\textcp{#2}
\setbox\faa=\hbox{#1.\ }
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\ifx\textcp\empty\else.\ \ignorespaces\small\rm#2\fi\par}%
  \ifdim \wd\@tempboxa >\hsize
  \noindent\hangindent\wd\bbb\hangafter1\relax
  \hbox to \wd\faa{#1\ifx\textcp\empty\else.\ \fi\hfill}\small\rm#2\endgraf
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  %\vskip\belowcaptionskip
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

\def\bibitem{\expandafter\@bibitem\bibitem@}

\def\@bibitem#1{\item\if@filesw \immediate\write\@auxout
        {\string\bibcite{#1}{\the\value{\@listctr}}}\fi\ignorespaces
}

\def\2#1{{\fontsize{11pt}{10pt}\fontshape{sc}\selectfont#1}}
\def\bib#1 et al.#2 et al.#3\bib{\if|#3|\2{\gobblespace#1}\else
\2{\gobblespace#1} et al.\fi}
\def\bibi#1:\bibi{#1}
\def\bibit#1:#2\bibit{\if|#2|#1\else
\bib#1 et al. et al.\bib:\bibi#2\bibi\fi}
\def\gobblespace#1{#1}

\def\bibitem@#1#2\par{{#1}\bibit#2:\bibit\par}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\goodbreak\vskip25pt plus3pt\noindent{\bigbf \refname}
\nobreak \vskip6pt plus3pt
\nobreak
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{\small#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
             \parskip0pt plus0.5pt
             \itemsep 2pt plus0.5pt
              \partopsep 2pt
             \parsep 0pt\small
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
\let\endthebibliography=\endlist

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth height 0.4pt \kern 3
  \p@}

\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent\small
    \hbox to 2em{\hss\normalsize$^{\@thefnmark}$\kern0.5em}#1}

\newcommand\contentsname{Contents}
\newcommand\refname{REFERENCES}
\newcommand\indexname{Index}
\newcommand\figurename{Fig.}
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

  \onecolumn

\def\abstract{\vspace{0.5cm}\list{}{\leftmargin 1.1cm\topsep 0.7cm
    \parsep 0pt plus 1pt\listparindent 1em\labelsep \z@}%
    \item[]\small{\bf Abstract.~}\ignorespaces}
\def\endabstract{\endlist}

\def\keywords{\list{}{\leftmargin 1.1cm\topsep 0cm
    \parsep 0pt plus 0pt\listparindent 1em\labelsep \z@}%
    \item[]\small{\bf Keywords:~}\ignorespaces}
\def\endkeywords{\endlist\vspace{17pt}}

\def\mathclass{\list{}{\leftmargin 1.1cm\topsep 0cm
    \parsep 0pt plus 0pt\listparindent 1em\labelsep \z@}%
    \item[]\small{\bf Mathematics Subject Classification 2010:~}\ignorespaces}
\def\endmathclass{\endlist\vspace{17pt}}

\def\thanks#1{\def\@thanks{\footnotetext[1]{#1}}}

\DeclareFontShape{OT1}{cmr}{bx}{sc}%
     {%
      <8><9><10><10.95><12>%
      <14.4><17.28><20.74><24.88>cmbcsc10%
      }{}

\newbox\biobox
\long\def\bio#1#2,#3\\#4\par{\vskip0.5cm%\small%
\setbox\biobox=
\vtop{\small%\vspace{0.3cm}
\ignorespaces\hangindent4.3cm\hangafter-10
\noindent%
{\bfseries\ignorespaces#2~\fontshape{sc}\selectfont\ignorespaces#3}#4\par}
\newbox\photo\setbox\photo=\hbox{#1}
\wd\photo=0cm\dp\photo=0cm\ht\photo=0cm
\noindent\rlap{\lower4cm\box\photo}\box\biobox\vspace{0.3cm}}

\newbox\biobox
\long\def\bio#1#2,#3\\#4\par{\vskip0.5cm\def\mak{#1}%\small%
\setbox\biobox=
\vtop{\small%\vspace{0.3cm}
\ignorespaces
\ifx\mak\empty\else\hangindent4.3cm\hangafter-10\fi
\noindent%
{\bfseries\ignorespaces#2~\fontshape{sc}\selectfont\ignorespaces#3}#4\par}
\newbox\photo\setbox\photo=\hbox{#1}
\wd\photo=0cm\dp\photo=0cm\ht\photo=0cm
\noindent\rlap{\lower4cm\box\photo}\box\biobox\vspace{0.3cm}}

\mag833
 \endinput
%%
%% End of file `article.cls'.
