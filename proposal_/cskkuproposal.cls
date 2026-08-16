% ===============================
% cskkuproposal.cls
% Thai Project Proposal Class (XeLaTeX)
% สาขาวิชาวิทยาการคอมพิวเตอร์
% วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น
% ===============================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cskkuproposal}[2025/05/08 CS KKU Proposal Class]

\newcommand{\ThaiAlph}[1]{%
  \ifcase#1\relax ก\or ข\or ค\or ง\or จ\or ฉ\or ช\or ซ\or ฌ\or ญ\or ฎ\or ฏ\or ฐ\or ฑ\or ฒ\or ณ\or ด\or ต\or ถ\or ท\or ธ\or น\or บ\or ป\or ผ\or ฝ\or พ\or ฟ\or ภ\or ม\or ย\or ร\or ล\or ว\or ศ\or ษ\or ส\or ห\or ฬ\or อ\or ฮ\else ?\fi
}

% ------------------------------------------------
% Base class
% ------------------------------------------------
\LoadClass[12pt,oneside]{article}

% ------------------------------------------------
% Require XeLaTeX
% ------------------------------------------------
\RequirePackage{ifxetex}
\ifxetex\else
  \ClassError{cskkuproposal}
    {This class requires XeLaTeX}
    {Please compile using XeLaTeX}
\fi

% ------------------------------------------------
% Page layout
% ขอบบน 1.5", ขอบซ้าย 1.5", ขอบขวา 1", ขอบล่าง 1"
% ------------------------------------------------
\RequirePackage[
  a4paper,
  top=1.5in,
  left=1.5in,
  right=1in,
  bottom=1in,
  headheight=15pt
]{geometry}

% ------------------------------------------------
% Packages
% ------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{microtype}
\RequirePackage{xurl}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{amsmath,amssymb}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage[table]{xcolor}
\RequirePackage{colortbl}
\RequirePackage{needspace}
\RequirePackage{indentfirst}

\newlength{\firstindentlength}
\newlength{\secondindentlength}
\newlength{\thirdindentlength}

\setlength{\firstindentlength}{3em}
\setlength{\secondindentlength}{7.1em}
\setlength{\thirdindentlength}{12.2em}

\setlength{\parindent}{\firstindentlength}
\setlength{\parskip}{0pt}

\RequirePackage[
  colorlinks=true,
  linkcolor=black,
  urlcolor=blue,
  pageanchor=false
]{hyperref}

% ตาราง: ชื่อชิดซ้าย ลำดับตัวหนา
\RequirePackage{caption}
\captionsetup[table]{
  labelfont=bf,
  textfont=normalfont,
  labelsep=space,
  justification=raggedright,
  singlelinecheck=false
}
\captionsetup[figure]{labelfont=bf,labelsep=space}

% ------------------------------------------------
% Thai font setup (XeLaTeX)
% ------------------------------------------------
\XeTeXlinebreaklocale "th"
\XeTeXlinebreakskip = 0pt plus 1pt

\pretolerance=1000
\tolerance=2000
\emergencystretch=3em

\setmainfont{Sarabun}[
  Path = ../theme/fonts/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic,
  Scale = 1.16667,
]

\setsansfont{Sarabun}[
  Path = ../theme/fonts/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic,
  Scale = 1.16667,
]

% ------------------------------------------------
% Table/Figure numbering (not reset per section)
% ------------------------------------------------
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\thefigure}{\arabic{figure}}

% Thai names
\renewcommand{\tablename}{ตารางที่}
\renewcommand{\figurename}{ภาพที่}

% ------------------------------------------------
% Line spacing
% ------------------------------------------------
\singlespacing

% ------------------------------------------------
% Header / Footer
% ------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\makeatletter
\let\ps@plain\ps@fancy
\makeatother

% ------------------------------------------------
% Section formatting
% ------------------------------------------------
\RequirePackage{titlesec}

\setcounter{secnumdepth}{4}
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\theparagraph}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}

% หัวข้อใหญ่: 16pt Bold (\large)
\titleformat{\section}
  {\bfseries\fontsize{13.7pt}{16.5pt}\selectfont\upshape}
  {\thesection}
  {0.45\firstindentlength}
  {}

\titleformat{name=\section,numberless}
  {\bfseries\fontsize{13.7pt}{16.5pt}\selectfont\upshape}
  {}
  {0pt}
  {}

% หัวข้อย่อยระดับที่ 1
\titleformat{\subsection}
  {\normalsize\upshape}
  {\thesubsection}
  {0.45\firstindentlength}
  {}

\titleformat{name=\subsection,numberless}
  {\normalsize\upshape}
  {}
  {0pt}
  {}

% หัวข้อย่อยระดับที่ 2
\titleformat{\subsubsection}
  {\normalsize\upshape}
  {\thesubsubsection}
  {0.45\firstindentlength}
  {}

\titleformat{name=\subsubsection,numberless}
  {\normalsize\upshape}
  {}
  {0pt}
  {}

\titlespacing{\section}
  {0pt}
  {0.5\baselineskip}
  {0.0\baselineskip}

\titlespacing{\subsection}
  {\firstindentlength}
  {0.5\baselineskip}
  {0.0\baselineskip}

\titlespacing{\subsubsection}
  {\secondindentlength}
  {0.5\baselineskip}
  {0.0\baselineskip}

\titlespacing{\paragraph}
  {\thirdindentlength}
  {0.5\baselineskip}
  {0.0\baselineskip}

% ------------------------------------------------
% ป้องกันหัวข้ออยู่คนเดียวปลายหน้า (orphan headings) และตั้งค่า parindent
% ------------------------------------------------
\widowpenalty=10000
\clubpenalty=10000
\interfootnotelinepenalty=10000

\pretocmd{\section}{\needspace{5\baselineskip}\setlength{\parindent}{\firstindentlength}}{}{}
\pretocmd{\subsection}{\needspace{4\baselineskip}\setlength{\parindent}{\firstindentlength}}{}{}
\pretocmd{\subsubsection}{\needspace{3\baselineskip}\setlength{\parindent}{\firstindentlength}}{}{}

% ------------------------------------------------
% Enumerate / Itemize (ปรับตาม cskkuproject.cls)
% ------------------------------------------------
\setlist[itemize]{label=\textendash}
\setlist[enumerate]{label*=\arabic*.}

\setlist[itemize,1]{
  leftmargin=*,
  labelindent=\parindent,
  labelsep=1em,
  listparindent=0pt,
  itemsep=0pt,
  topsep=0.3\baselineskip,
  partopsep=0pt,
}
\setlist[itemize,2]{
  leftmargin=*,
  labelindent=0em,
  labelsep=1em,
  listparindent=0pt,
  itemsep=0pt,
  topsep=0.3\baselineskip,
  partopsep=0pt,
}

\setlist[enumerate,1]{
  label=\arabic*.,
  leftmargin=*,
  labelwidth=2.5em,
  labelindent=\parindent,
  labelsep=1em,
  listparindent=0pt,
}
\setlist[enumerate,2]{
  label=\arabic{enumi}.\arabic*.,
  leftmargin=*,
  labelwidth=3.5em,
  labelindent=0em,
  labelsep=1em,
  listparindent=0pt
}
\setlist[description]{
  leftmargin=*,
  labelindent=\parindent,
  labelsep=1em,
  listparindent=0pt,
}

% ------------------------------------------------
% Bibliography
% ------------------------------------------------
\renewcommand{\refname}{เอกสารอ้างอิง}

% ------------------------------------------------
% Utility: check if empty
% ------------------------------------------------
\makeatletter
\newcommand{\IfEmptyTF}[3]{%
  \edef\@temp{#1}%
  \ifx\@temp\@empty
    #2%
  \else
    #3%
  \fi
}
\makeatother

% ------------------------------------------------
% Title Page Variables
% ------------------------------------------------
\makeatletter
\newcommand{\titleTH}[1]{\def\@titleTH{#1}}
\newcommand{\titleEN}[1]{\def\@titleEN{#1}}
\newcommand{\advisorTH}[1]{\def\@advisorTH{#1}}
\newcommand{\advisorEN}[1]{\def\@advisorEN{#1}}
\newcommand{\degreeTH}[1]{\def\@degreeTH{#1}}
\newcommand{\degreeEN}[1]{\def\@degreeEN{#1}}
\newcommand{\majorTH}[1]{\def\@majorTH{#1}}
\newcommand{\majorEN}[1]{\def\@majorEN{#1}}
\newcommand{\academicYearEN}[1]{\def\@academicYearEN{#1}}
\newcommand{\academicYearTH}[1]{\def\@academicYearTH{#1}}
\newcommand{\courseCode}[1]{\def\@courseCode{#1}}
\newcommand{\courseName}[1]{\def\@courseName{#1}}
\newcommand{\semester}[1]{\def\@semester{#1}}

% นักศึกษาคนที่ 1
\newcommand{\firstStudentID}[1]{\def\@firstStudentID{#1}}
\newcommand{\firstStudentPrefixTH}[1]{\def\@firstStudentPrefixTH{#1}}
\newcommand{\firstStudentNameTH}[1]{\def\@firstStudentNameTH{#1}}
\newcommand{\firstStudentPrefixEN}[1]{\def\@firstStudentPrefixEN{#1}}
\newcommand{\firstStudentNameEN}[1]{\def\@firstStudentNameEN{#1}}

% นักศึกษาคนที่ 2
\newcommand{\secondStudentID}[1]{\def\@secondStudentID{#1}}
\newcommand{\secondStudentPrefixTH}[1]{\def\@secondStudentPrefixTH{#1}}
\newcommand{\secondStudentNameTH}[1]{\def\@secondStudentNameTH{#1}}
\newcommand{\secondStudentPrefixEN}[1]{\def\@secondStudentPrefixEN{#1}}
\newcommand{\secondStudentNameEN}[1]{\def\@secondStudentNameEN{#1}}

% ค่าเริ่มต้น
\def\@courseCode{CP354 771}
\def\@courseName{โครงงานคอมพิวเตอร์ 1}
\def\@semester{1}
\def\@secondStudentID{}
\def\@secondStudentPrefixTH{}
\def\@secondStudentNameTH{}
\def\@secondStudentPrefixEN{}
\def\@secondStudentNameEN{}

% ------------------------------------------------
% Cover Page — แบบ proposal (หน้าปก)
% ------------------------------------------------
\newcommand{\makeproposaltitlepage}{
\begin{titlepage}
\clearpage
\thispagestyle{empty}
\centering

\includegraphics[scale=0.5]{../theme/kku-logo.png}

{\Large\bfseries CS \@academicYearTH}

\vspace{0.5cm}

{\Large\bfseries การเสนอเค้าโครงโครงงาน}

\vfill

{\Large \@titleTH \\[0.5cm] \@titleEN}

\vfill

{\large โดย \\}
{\large \@firstStudentID~\@firstStudentPrefixTH\@firstStudentNameTH \\}
\IfEmptyTF{\@secondStudentID}{}{%
  {\large \@secondStudentID~\@secondStudentPrefixTH\@secondStudentNameTH \\}%
}
\vspace{1cm}

{\large อาจารย์ที่ปรึกษา : \@advisorTH \\}

\vfill

{\large รายงานนี้เป็นส่วนหนึ่งของการศึกษาวิชา \@courseCode{} \@courseName\\}
{\large ภาคเรียนที่ \@semester{} ปีการศึกษา \@academicYearTH\\}
{\large สาขาวิชา\@majorTH{} วิทยาลัยการคอมพิวเตอร์\\}
{\large มหาวิทยาลัยขอนแก่น\\}
{\large (กรกฎาคม \@academicYearTH)}

\end{titlepage}
}

% ------------------------------------------------
% Proposal Header Page (หน้าที่ 1 — ชื่อ/ที่อยู่)
% ------------------------------------------------
\newcommand{\makeproposalheader}{
\thispagestyle{empty}
\begin{center}
  {\large\bfseries การเสนอเค้าโครงโครงงานคอมพิวเตอร์}\\[4pt]
  {\normalsize สาขาวิชาวิทยาการคอมพิวเตอร์ วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น}
\end{center}

\vspace{1.2cm}

\noindent
\begin{tabular}{@{}p{1.5cm} l p{2.8cm} l@{}}
\textbf{ชื่อ} &
\@firstStudentPrefixTH\@firstStudentNameTH &
รหัสประจำตัว &
\@firstStudentID \\[2pt]
&
\@firstStudentPrefixEN~\@firstStudentNameEN & & \\[6pt]
\IfEmptyTF{\@secondStudentID}{}{%
&
\@secondStudentPrefixTH\@secondStudentNameTH &
รหัสประจำตัว &
\@secondStudentID \\[2pt]
&
\@secondStudentPrefixEN~\@secondStudentNameEN & & \\[6pt]
}%
\end{tabular}

\vspace{0.3cm}

\noindent
\begin{tabular}{@{}p{4.5cm}p{10cm}@{}}
\textbf{นักศึกษาระดับปริญญาตรี} &
หลักสูตร\@degreeTH{} สาขาวิชา\@majorTH{} \\[4pt]
\textbf{อาจารย์ที่ปรึกษาโครงงาน} &
\@advisorTH \\[2pt]
\textbf{Project Advisor Lecturer} &
\@advisorEN \\
\end{tabular}

\vspace{0.8cm}
}

\makeatother

% ------------------------------------------------
% End of class
% ------------------------------------------------
