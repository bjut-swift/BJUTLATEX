\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjutthesis}[2022/12/30 By WangPeiKe]

% base settings for cls file
\LoadClass[UTF8,scheme=plain,zihao=-4,linespread=1.42,sub3sectiuon,openany]{ctexbook}
\ctexset{
  punct = quanjiao,
  space = auto,
  autoindent = true,
  today = old,
}

% k-v settings
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family = bjut,
  prefix = bjut@,
  setkeys = \kvsetkeys,
}

% font settings
\RequirePackage[T1]{fontenc}
\PassOptionsToPackage{no-math}{fontspec}
% IMPORTANT
\RequirePackage[nofontspec]{newtxtext}
\RequirePackage{mathptmx}
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{newtxmath}
\RequirePackage{mathtools}
\DeclareSymbolFont{cmsymbols}{OMS}{cmsy}{m}{n}
\SetSymbolFont{cmsymbols}{bold}{OMS}{cmsy}{b}{n}
\DeclareSymbolFontAlphabet{\mathcal}{cmsymbols}

\newcommand\bjut@fontset{\csname g__ctex_fontset_tl\endcsname}
% TODO windows font config
\setCJKfamilyfont{song}{Songti SC}[AutoFakeBold=1.75]
\setCJKfamilyfont{hei}{SimHei}[AutoFakeBold=1.75]
\setCJKfamilyfont{kai}{Kaiti SC}[AutoFakeBold=1.75]
\setCJKfamilyfont{fang}{STFangsong}[AutoFakeBold=4.5]

\renewcommand{\songti}{\CJKfamily{song}}
\renewcommand{\heiti}{\CJKfamily{hei}}
\renewcommand{\kaishu}{\CJKfamily{kai}}
\renewcommand{\fangsong}{\CJKfamily{fang}}


\xeCJKsetup{CJKspace=true}

%\renewcommand{\baselinestretch}{1.3}

% 组内往届毕业生封面部分英文数字使用了加粗黑体
% 这与规范文件不符，又足内毕业生的模版均为古早毕业生流传下来的word版本
% 姑且以为他们全都错了。

%\xeCJKDeclareCharClass{CJK}{`0 -> `9}
%\xeCJKDeclareCharClass{CJK}{`A -> `Z}

\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=13bp \@plus 2bp \@minus 2bp
  \abovedisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\belowdisplayskip
}

\def\bjut@def@fontsize#1#2{
  \expandafter\newcommand\csname #1 \endcsname[1][1.3]{
  \fontsize{#2}{##1\dimexpr #2}\selectfont}
}


% layout
\RequirePackage{geometry}

%TODO check
\geometry{
  a4paper,
  hcentering,
  ignoreall,
  nomarginpar,
  headheight = 5.0mm,
  headsep = 5.5mm,
  top = 25.40mm,
  bottom = 25.4mm,
  left = 31.7mm,
  right = 31.7mm,
  footskip = 8.5mm
}

% page styles
\def\bjut@header@text{北京工业大学硕士学位论文}
\def\bjut@header@font{\fontsize{9.5bp}{11.5bp}\selectfont\kaishu}
\RequirePackage{fancyhdr}

\fancypagestyle{bjut@headings}{
  \fancyhead{}
  \fancyhead[OC]{\bjut@header@font\leftmark}
  \fancyhead[EC]{\bjut@header@font\bjut@header@text}
  \fancyfoot{}
  \fancyfoot[C]{\zihao{-5}--\ \thepage\ --}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{\z@}
}

\renewcommand\frontmatter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{bjut@headings}
}

\renewcommand\mainmatter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{bjut@headings}
}

\renewcommand\backmatter{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagestyle{bjut@headings}
}

% number
\renewcommand{\theparagraph}{(\arabic{paragraph})}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% caption
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[list=off]{bicaption}

\captionsetup{font=small}
\captionsetup[bi]{labelsep=space, format=hang, justification=centerlast, width=\textwidth}
\captionsetup[figure][bi-first]{name=图}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table]{labelsep=space, format=hang}
\captionsetup[table][bi-first]{name=表}
\captionsetup[table][bi-second]{name=Table}

% cross references
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\hypersetup{
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  breaklinks         = true,
  colorlinks         = false,
  plainpages         = false,
  pdfborder          = 0 0 0
}
\urlstyle{same}

% item
\RequirePackage[shortlabels]{enumitem}
\setlist[itemize]{wide=2\ccwd}
\setlist[enumerate]{label=(\arabic*), wide=2\ccwd, labelsep=.5\ccwd}
\setlist[enumerate,2]{label=\arabic*), wide=4\ccwd, labelsep=.5\ccwd, leftmargin=2\ccwd}
\setlist[description]{wide=2\ccwd}
\setlist{nosep}

% equation
\RequirePackage{tabularx}
\setlength\belowdisplayskip{.5ex}
\NewDocumentEnvironment{where}{O{式中：}}{
    #1\tabularx{\textwidth-\widthof{#1}}[t]{@{}r@{~——~}X@{}}%
}{\endtabularx\\[.5ex]}

% table
\RequirePackage{bitoc}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{2}

% ToC
\tocloftpagestyle{bjut@headings}

% dotline: shape and seperation
\renewcommand\cftdot{$\cdot$}
\renewcommand\cftdotsep{0}
% pagenumber width
\cftsetpnumwidth{1\ccwd}
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
% list of figures/tables
\renewcommand{\cftfigpresnum}{图~}
\setlength{\cftfignumwidth}{3.25\ccwd}
\renewcommand{\cfttabpresnum}{表~}
\setlength{\cfttabnumwidth}{3.25\ccwd}

% chapter entries
\renewcommand{\cftchapfont}{\zihao{-4}\heiti}
\setlength\cftbeforechapskip{\z@}

\renewcommand{\cftchapaftersnumb}{}
\renewcommand{\cftchapdotsep}{0}

% section entries
\setlength\cftsecindent{1.5\ccwd}
\setlength\cftsecnumwidth{1.5\ccwd}
\renewcommand{\cftsecaftersnumb}{}

% subsection entries
\setlength\cftsubsecindent{3\ccwd}
\setlength\cftsubsecnumwidth{2\ccwd}
\renewcommand{\cftsubsecaftersnumb}{}

% bibliography
\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{gbt7714-numerical}
\renewcommand\bibfont{\zihao{5}}
\addtolength\bibsep{-0.7em}

% pages
\RequirePackage[pagecolor=white,nopagecolor=white]{pagecolor}
\RequirePackage[copies]{contour}
\RequirePackage[normalem]{ulem}
\RequirePackage{ragged2e}
\contourlength{2pt}
\setlength\RaggedRightParindent{0pt}
\setlength\JustifyingParindent{0pt}

\RequirePackage{ezinfo}
\RequirePackage{xcolor}
% TODO check
\definecolor{bjut@color@official}{RGB}{0,150,195}

% TODO 专业学位
\definecolor{bjut@color@coverbg}{RGB}{6,146,190}

\RequirePackage{graphicx}
\RequirePackage{tabularx}

\newcommand{\makecover}{
  \begin{titlepage}
    % TODO check
    \newgeometry{left=10mm,right=10mm,top=10mm}
    \pagecolor{bjut@color@coverbg}
    \begin{flushleft}\zihao{5}\heiti\bfseries
      \renewcommand\arraystretch{.75}
      \begin{tabular}{@{}p{28mm}@{：}l}
        \makebox[28mm][s]{中文图书分类号} & \ez@clc \\
        \makebox[28mm][s]{密级}           & \ez@secretlevel \\
        \makebox[28mm][s]{\hfill UDC}     & \ez@udc \\
        \makebox[28mm][s]{学校代码}       & \ez@schoolcode \\
      \end{tabular}
    \end{flushleft}

    % TODO check
    \vskip 1.5cm
    \begin{center}
      \includegraphics[width=10.8cm]{bjut_logo_white.pdf}
      \vskip 1.6cm
      \contour[20]{white}{
        \makebox[12.6cm][s]{\fontsize{42}{0}\heiti\bfseries 硕士学位论文}
      }
      \vskip 0.8cm
      \makebox[10.8cm][s]{\fontsize{24}{30}\selectfont MASTERAL DISSERTATION}
    \end{center}
    \vfill
    \begin{center}\zihao{-2}\heiti
      \renewcommand\arraystretch{1.6}
      \begin{tabularx}{140mm}{@{}r@{：}X@{}}
        \makebox[45mm][s]{论文题目}      & \ez@ctitle \\
        \makebox[45mm][s]{论文作者}      & \ez@cauthor \\
        \makebox[45mm][s]{学科}          & \ez@cdiscipline \\
        \makebox[45mm][s]{指导教师}      & \ez@csupervisor~\ez@csupervstitle \\
        \makebox[45mm][s]{论文提交日期}  & \ez@cdate
      \end{tabularx}
    \end{center}\normalsize\normalfont
  \end{titlepage}
  \restoregeometry
  \nopagecolor
  \global\let\makecover\relax
  \let\cleardoublepage\clearpage
}

% 内封
\usepackage{ragged2e}
\usepackage{booktabs}
\newcolumntype{L}{>{\RaggedRight\hangafter=1\hangindent=0em}X}
\renewcommand{\maketitle}{
  \begin{titlepage}
    %\newgeometry{left=32.31mm,top=26.18mm}
    \vspace*{-0.44cm}
    \begin{center}\zihao{5}
      %\renewcommand\arraystretch{0.9}
      \setlength\tabcolsep{0pt}
      \begin{tabular}{p{28.9mm}p{68.83mm}p{18.0mm}l}
        \makebox[28.9mm][s]{\hfill UDC：} & \ez@udc & \makebox[18.0mm][s]{学校代码：} & \ez@schoolcode \\
        \makebox[28.9mm][s]{中文图书分类号：} & \ez@clc &
        \makebox[18.0mm][s]{学号：} & \ez@studentid
      \end{tabular}
    \end{center}
    \vskip 2.2cm
    \begin{center}
      \makebox[12cm][s]{\zihao{-1}\kaishu\bfseries{北京工业大学工学硕士学位论文}}
    \end{center}
    \vskip 0.98cm
    \begin{center}
      \renewcommand\arraystretch{1.5}
      \begin{tabularx}{122.6mm}{@{}r@{：}L@{}}
        \makebox[25mm][s]{\zihao{4}\songti\bfseries{题目}} & \zihao{4}\ez@ctitle\\
        \cline{2-2}
        \makebox[25mm][s]{\zihao{4}\songti\bfseries{英文题目}} & \zihao{4}\MakeUppercase{\ez@etitle\hfill\mbox{}}\\
        \cline{2-2}
      \end{tabularx}
    \end{center}
    \vskip 4.5cm
    \begin{center}\zihao{4}\fangsong
      \setlength\tabcolsep{0pt}
      \begin{tabularx}{122.6mm}{@{}p{35.3mm}@{：\ \ }l}
        \makebox[35.3mm][s]{\fangsong\bfseries{论文作者}}  &  \ez@cauthor\\
        \makebox[35.3mm][s]{\fangsong\bfseries{学科专业}}  &  \ez@cdiscipline\\
        \makebox[35.3mm][s]{\fangsong\bfseries{研究方向}}  &  \ez@cmajor\\
        \makebox[35.3mm][s]{\fangsong\bfseries{申请学位}}  &  \ez@cdegree\\
        \makebox[35.3mm][s]{\fangsong\bfseries{指导教师}}  &  \ez@csupervisor~\ez@csupervstitle\\
        \makebox[35.3mm][s]{\fangsong\bfseries{所在单位}}  &  \ez@ccollege\\
        \makebox[35.3mm][s]{\fangsong\bfseries{答辩日期}}  &  \ez@cdate\\
        \makebox[35.3mm][s]{\fangsong\bfseries{授予学位单位}}  &  \ez@corganization\\
      \end{tabularx}
    \end{center}
  \end{titlepage}
  \global\let\maketitle\relax
}

\newcommand{\makestate}{
  \begin{titlepage}
       \mbox{}
    \vskip .5cm
    \begin{center}
      \makebox[4cm][s]{\zihao{3}\heiti\bfseries 独创性声明}
    \end{center}
    \vskip 0.1cm
    \linespread{1.08}\selectfont
    {\justifying
  \hspace{2\ccwd}本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，\kern-.2em也不包含为获得北京工业大学或其它教育机构的学位或证书而使用过的材料。\kern-.2em与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。}
    \begin{flushright}
      \renewcommand\arraystretch{1.75}
      \setlength\tabcolsep{0pt}
      \begin{tabular}{rp{18mm}@{：}p{38mm}@{}}
        & \makebox[18mm][s]{签名} & \rule[-2mm]{37mm}{.4pt}\\
        & \makebox[18mm][s]{日期} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日
      \end{tabular}
    \end{flushright}
    \vfill
    \begin{center}
      \makebox[6.5cm][s]{\zihao{3}\heiti\bfseries 关于论文使用授权的说明}
    \end{center}
    {\justifying
      \hspace{2\ccwd}本人完全了解北京工业大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被查阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存论文。\par
    \vskip 0.1cm
      \RaggedRight
      \hspace{2\ccwd}（保密的论文在解密后应遵守此规定）}
    \begin{flushright}
      \renewcommand\arraystretch{1.75}
      \setlength\tabcolsep{0pt}
      \begin{tabular}{p{18mm}@{：}p{38mm}p{20mm}p{18mm}@{：}p{38mm}@{}}
        \makebox[18mm][s]{签名}     & \rule[-2mm]{37mm}{.4pt} & & \makebox[18mm][s]{日期} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日\\
        \makebox[18mm][s]{导师签名} & \rule[-2mm]{37mm}{.4pt} & & \makebox[18mm][s]{日期} & \hspace{\stretch{2}}年{\hfill}月{\hfill}日\\
      \end{tabular}
    \end{flushright}
    \vfill
  \end{titlepage}
  \global\let\makestate\relax
}

\setcounter{secnumdepth}{4}
\def\bjut@chapter@font{\zihao{3}\heiti}
\def\bjut@section@font{\zihao{4}\heiti}
\def\bjut@subsection@font{\zihao{-4}\heiti}
\def\bjut@subsubsection@font{\zihao{-4}\kaishu}
\def\bjut@subsubsubsection@font{\zihao{-4}\kaishu}
\let\subsubsubsection\paragraph
\setlength{\parskip}{\z@}

\ctexset {
  chapter = {
    beforeskip   = \z@,
    afterskip    = 5mm,
    fixskip      = false,
    indent       = \z@,
    format       = \bjut@chapter@font\centering,
    name         = {第,章},
    nameformat   = {},
    titleformat  = {},
    numberformat = {},
    number       = \arabic{chapter},
    aftername    = \hspace{\ccwd},
    afterindent  = true,
    aftertitle   = {},
    pagestyle    = bjut@headings
  },
  section = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@section@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true
  },
  subsection = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@subsection@font\raggedright,
    aftername    = \hspace{\ccwd},
    afterindent  = true
  },
  subsubsection = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = \z@,
    format       = \bjut@subsubsection@font,
    runin        = true,
    aftertitle   = \hspace{\ccwd}
  },
  paragraph = {
    beforeskip   = \z@,
    afterskip    = \z@,
    indent       = 2\ccwd,
    format       = \bjut@subsubsubsection@font,
    runin        = true,
    aftername    = {},
    aftertitle   = \hspace{\ccwd}
  },
}

\RequirePackage{fancyvrb}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{setspace}
\RequirePackage{amsmath}
\captionsetup[algorithm]{labelfont=rm,labelsep=colon}
\renewcommand\thealgorithm{\thechapter-\arabic{algorithm}}
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{输入：}
\renewcommand{\algorithmicensure}{输出：}
