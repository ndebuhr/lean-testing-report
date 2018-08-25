\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LeanTestReport}[2018/08/07 v.2.0 (multipage) Lean Test Report templates]
\LoadClass[letterpaper, 10pt]{article}

%\RequirePackage[top=0.5in,bottom=0.8in,left=0.5in,right=0.5in]{geometry} % define page set up
\RequirePackage[  portrait,
                  %showframe,
                  margin = 0.5in,
                  left = 0.7in,
                  includehead,
                  headheight = 0.5in,
                  includefoot,
                  footskip = 14pt,
                  marginparsep = 0 pt,
                  marginparwidth = 0 pt]{geometry} % define page set up
\RequirePackage{atbegshi,color,picture}
\RequirePackage{fancyhdr}
\RequirePackage{tcolorbox}
\RequirePackage{textcomp} %for euro symbol
%\RequirePackage{eurosym} % for other euro symbol
\RequirePackage[utf8]{inputenc} % for german characters
\RequirePackage{tabularx} 
\RequirePackage{ifthen} % for properly displaying 'hour' 'hours'
\RequirePackage{calc} % counters for totaling hours and cost
\RequirePackage{color}
\RequirePackage{lastpage} % to count number of pages for \pageref{LastPage}
\RequirePackage{everypage}
\RequirePackage{makecell}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{arrows,shapes,positioning,calc}
\RequirePackage[hidelinks]{hyperref} % hidelinks - do not put borders around links
\urlstyle{same} % use the same font to print urls

\DeclareOption{estimate}{%
\newcounter{cost}%
\setcounter{cost}{0}%
\newcounter{hoursA}%
\newcounter{hoursB}%
\newcounter{hoursC}%
\newcounter{hoursD}%
\newcounter{hoursE}%
\newcounter{hoursF}%
\setcounter{hoursA}{0}%
\setcounter{hoursB}{0}%
\setcounter{hoursC}{0}%
\setcounter{hoursD}{0}%
\setcounter{hoursE}{0}%
\setcounter{hoursF}{0}%
%
\newcommand*{\rowA}[1]{#1 & \ifthenelse{ \equal{#1}{1} }{hour}{hours} & \posNameA \\\addtocounter{hoursA}{#1}}%
\newcommand*{\rowB}[1]{#1 & \ifthenelse{ \equal{#1}{1} }{hour}{hours} & \posNameB \\\addtocounter{hoursB}{#1}}%
\newcommand*{\rowC}[1]{#1 & \ifthenelse{ \equal{#1}{1} }{hour}{hours} & \posNameC \\\addtocounter{hoursC}{#1}}%
\newcommand*{\rowD}[1]{#1 & \ifthenelse{ \equal{#1}{1} }{hour}{hours} & \posNameD \\\addtocounter{hoursD}{#1}}%
\newcommand*{\rowE}[1]{#1 & \ifthenelse{ \equal{#1}{1} }{hour}{hours} & \posNameE \\\addtocounter{hoursE}{#1}}%
\newcommand*{\rowF}[1]{#1 & \ifthenelse{ \equal{#1}{1} }{hour}{hours} & \posNameF \\\addtocounter{hoursF}{#1}}%
}
\ProcessOptions\relax

\newcolumntype{C}{>{\centering\arraybackslash}X} % centered version of 'X' columns in tabluarx
\newcommand{\niceeuro}{\fontfamily{futs}\selectfont \texteuro}
\newcommand{\edit}{\textcolor{red}} % marker to designate areas that need future attention
\newcommand{\XClacksOverhead}{GNU Terry Pratchett}

\pagestyle{fancy}
\graphicspath{ {./img/} }
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

% Header
\fancyhead{%
\begin{minipage}[t]{1.0\linewidth}%
  \begin{minipage}{0.4\linewidth}%
    \includegraphics[scale=0.20]{dummyLogo}%
  \end{minipage}%
  \begin{minipage}{0.6\linewidth}%
    \begin{flushright}%
      Full Name \\
      \url{https://www.example.com} \\
      jane.doe@example.com \\
    \end{flushright}%
  \end{minipage}%
  \vspace{0.1cm}~\\%
\vspace{0.4cm}\noindent\makebox[\linewidth]{\rule{\linewidth}{0.4pt}}\noindent%
\end{minipage}%
}
% Footer
\rfoot{Page \thepage\ of \pageref{LastPage}} 

% First page style change
\fancypagestyle{first}{%
  \fancyhf{}
  \rfoot{Page \thepage\ of \pageref{LastPage}}
}
\fancypagestyle{firstNoF}{\fancyhf{}}

%leftside
\AddEverypageHook{\tikz[remember picture,overlay]%
{\node[fill=customcolor,anchor=north,minimum width=0.1in, minimum height=\paperheight] (names)%
   at ([xshift=0.45in]current page.north west) {}}}

\newtcolorbox{mybox}{colback=litecustomcolor,colframe=customcolor}
\definecolor{customcolor}{HTML}{6c3082}
\definecolor{litecustomcolor}{rgb}{0.97255,0.95294,1}

\newcommand {\custShortHeader} {%
  \begin{minipage}{0.4\linewidth}%
    \vspace{0.08in}%
    \includegraphics[scale=0.20]{dummyLogo}%
  \end{minipage}%
  \begin{minipage}{0.6\linewidth}%
    \begin{flushright}%
    Full Name \\
    \url{https://www.example.com} \\
    jane.doe@example.com \\
    \end{flushright}
  \end{minipage}
\vspace{-0.3cm}~\\
\vspace{0.4cm}\noindent\makebox[\linewidth]{\rule{\linewidth}{0.4pt}}
\noindent%
}
\newcommand {\pageOneMargins}%
  {\newgeometry{%           
  %showframe,%
  margin = 0.5in,%
  left = 0.7in,%
  includehead,%
  headheight = -0.34in,%
  includefoot,%
  footskip = 14pt,%
  marginparsep = 0 pt,%
  marginparwidth = 0 pt}% skip header for page one
  }
