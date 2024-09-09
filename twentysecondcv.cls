%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Twenty Seconds Curriculum Vitae in LaTex
% ****************************************
% 
% License: MIT
%
% For further information please visit:
% https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%
% CLASS %
%%%%%%%%%
\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%
% PACKAGES %
%%%%%%%%%%%%
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontawesome} % <================ for \faGithub github symbol
\RequirePackage[alpine]{ifsym} % <================ for \faGithub Trekking symbol
%\usepackage{makecell}
\usepackage{titlesec}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%
% OPTIONS %
%%%%%%%%%%%
% icons
\newbool{icon}
\DeclareOption{icon}{%
  \booltrue{icon}
}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\ifbool{icon}{\RequirePackage{fontawesome}}{}

\usetikzlibrary{calc}

%%%%%%%%%%
% colors %
%%%%%%%%%%
\definecolor{white}{RGB}{255,255,255} 
\definecolor{darkgray}{HTML}{333333} 
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB0B00}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{cerulean}{HTML}{007BA7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{maindarkgray}{HTML}{B3B3B3}

\definecolor{violettoFrankCV}{RGB}{96, 60, 140}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{asidecolor}{sidecolor}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
  \colorlet{asidecolor}{sidecolor}
\fi

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%%%%%%%%%
% Profile left SideBar %
%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

% compute size of profile picture
\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%
																%\rule[raise-height]{width}{height}
\newcommand{\profilesection}[2]{{\noindent\color{white} \huge #1 \rule[0.15\baselineskip]{#2}{1pt} \vspace{1pt}}}

\newcommand{\cvdate}[1]{\renewcommand{\givencvdate}{#1}}                % date
\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}                % mail
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}    % phone
\newcommand{\cvaddress}[1]{\renewcommand{\givencvaddress}{#1}}          % address
\newcommand{\cvsite}[1]{\renewcommand{\givencvsite}{#1}}                % site
\newcommand{\cvgit}[1]{\renewcommand{\givencvgit}{#1}}                % git
\newcommand{\cvlinkedin}[1]{\renewcommand{\givencvlinkedin}{#1}}                % LinkedIn
\newcommand{\aboutme}[1]{\renewcommand{\givenaboutme}{  \justifying#1}} % about me
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}        % picture
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}                % name
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}        % job title

\newcommand{\givencvname}{REQUIRED!} % name
\newcommand{\givencvdate}{}          % date
\newcommand{\givencvmail}{}          % mail
\newcommand{\givennumberphone}{}     % phone
\newcommand{\givencvaddress}{}       % address
\newcommand{\givenaboutme}{}         % about me
\newcommand{\givenprofilepic}{}      % picture
\newcommand{\givencvsite}{}          % site
\newcommand{\givencvgit}{}           % git
\newcommand{\givencvlinkedin}{}      % LinkedIn
\newcommand{\givencvjobtitle}{}      % job title

% icon in blue circle; #1 -> icon
%\newcommand*\icon[1]{\tikz[baseline=(char.base)]{
%  \node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}
%}

\newcommand*\icon[2][-1.7mm]{\tikz[baseline={(0,-1.5mm)}]{
		\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white,minimum width=6.5mm] (char) {\makebox[0pt][c]{\raisebox{#1}[0pt][0pt]{#2}}};}}
	
% Text in square node with rounded corners; #1 -> text, #2 -> color
\newcommand*\round[2]{%
\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, midway,
  rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm,
  fill=#2,#2,text=violettoFrankCV](char){#1};%,text=white](char){#1};%{\makecell{#1}};%
}

%\node [yshift=-5.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Teamwork};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% MIO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
		\node[shape=circle,draw,inner sep=2pt,fill=violettoFrankCV,minimum size=5mm] (char) {#1};}}
	
\newcommand\blfootnote[1]{%
	\begingroup
	\renewcommand\thefootnote{}\footnote{#1}%
	\addtocounter{footnote}{-1}%
	\endgroup
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% skill bar graphs
\newcommand\skills[1]{
  \renewcommand{\givenskill}{
    \noindent
    \begin{tikzpicture}
    \foreach [count=\i] \x/\y in {#1}
    {
      \draw[fill=maingray,maingray] (0,-\i) rectangle (6,-\i+0.4);
      \draw[fill=white,mainblue](0,-\i) rectangle (1.2*\y,-\i+0.4);
      \node [above right ] at (0,-\i+0.4) {\x};
      \foreach \z in {0,1,2,...,10}
      {
        \coordinate (A\z) at ($(0,-\i)+(1.2*\z*0.5cm,0)$) {};
        \ifodd\z
            \draw[white] ($(A\z)$) -- ($(A\z)+(0,2.5pt)$);
        \else
            \draw[white] ($(A\z)$) -- ($(A\z)+(0,5pt)$);
        \fi
      }
    }
    \end{tikzpicture}
  }
}

% text style skills
\newcommand{\givenskill}{}
  \newcommand\skillstext[1]{
    \renewcommand{\giventextskill}{
    \begin{flushleft}
    \noindent
    \foreach [count=\i] \x/\y in {#1}
    {
      \x$ \star $\y
    }
    \end{flushleft}
  }
}

\newcommand{\giventextskill}{}

% language bar graphs
\newcommand\languages[1]{
	\renewcommand{\givenlanguage}{
		\noindent
		\begin{tikzpicture}
		\foreach [count=\i] \x/\y in {#1}
		{
			\draw[fill=maingray,maingray] (0,-\i) rectangle (6,-\i+0.4);
			\draw[fill=white,mainblue](0,-\i) rectangle (1.2*\y,-\i+0.4);
			\node [above right ] at (0,-\i+0.4) {\x};
			\foreach \z in {0,1,2,...,10}
			{
				\coordinate (A\z) at ($(0,-\i)+(1.2*\z*0.5cm,0)$) {};
				\ifodd\z
				\draw[white] ($(A\z)$) -- ($(A\z)+(0,2.5pt)$);
				\else
				\draw[white] ($(A\z)$) -- ($(A\z)+(0,5pt)$);
				\fi
			}
		}
		\end{tikzpicture}
	}
}

% text style languages
\newcommand{\givenlanguage}{}
\newcommand\languagestext[1]{
	\renewcommand{\giventextlanguage}{
		\begin{flushleft}
			\noindent
			\foreach [count=\i] \x/\y in {#1}
			{
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

\newcommand{\giventextlanguage}{}

\newcommand{\makeprofile}
{
  % grey bar on the left side
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=violettoFrankCV, anchor=north, minimum width=9.90cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  \begin{textblock}{6}(0.5, 0.2)
    \begin{flushleft}
    	%se levi node nel tikzpicture del prossimo if allora ci vanno anche questi
      %\hspace{13pt}
      %\vspace{170pt}

      % profile picture
      \ifthenelse{\equal{\givenprofilepic}{}}{}{\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
          %\clip (600/2, 567/2) circle (567/2);
%          \node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\givenprofilepic}};
			\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\hspace*{0.5cm}\includegraphics[width=\imagewidth]{\givenprofilepic}\hspace*{0.5cm}};
      \end{tikzpicture}}

      % name
      {\Huge\color{white}\givencvname}

      % jobtitle
      %\begin{flushright}
        {\Large\color{white!80}\givencvjobtitle}
      %\end{flushright}
      \renewcommand{\arraystretch}{1.6}

      % table with icons 
      \begin{tabular}{c @{\hskip 0.2cm} p{5cm}}
        % CV birthdate
        \ifthenelse{\equal{\givencvdate}{}}{}{\textsc{\Large\icon{\faBirthdayCake}} & \givencvdate\\}
        % CV address
        \ifthenelse{\equal{\givencvaddress}{}}{}{\textsc{\Large\icon{\faMapMarker}} & \givencvaddress\\}
        % CV phone
        \ifthenelse{\equal{\givennumberphone}{}}{}{\textsc{\Large\icon{\faPhone}} & \href{tel:\givennumberphone}{\textcolor{cerulean}\givennumberphone}\\}
        % CV site
        \ifthenelse{\equal{\givencvsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \href{\givencvsite}{\textcolor{cerulean}\givencvsite}\\}
        % CV mail
        \ifthenelse{\equal{\givencvmail}{}}{}{\textsc{\Large\icon{\faEnvelope}} & \href{mailto:\givencvmail}{\textcolor{cerulean}\givencvmail}\\}
        % CV git
        \ifthenelse{\equal{\givencvgit}{}}{}{\textsc{\Large\icon{\faGithub}} & \href{https://github.com/\givencvgit}{\textcolor{cerulean}\givencvgit}\\}
        %\textsc{\Large\icon{\faGithub}} & \cvgithub\\
        % CV LinkedIn
        \ifthenelse{\equal{\givencvlinkedin}{}}{}{\textsc{\Large\icon{\faLinkedin}} & \href{https://www.linkedin.com\givencvlinkedin}{\textcolor{cerulean}\givencvlinkedin}\\}
      \end{tabular}

      % about me text
      %\profilesection{About me}{3.2cm}
      %\givenaboutme

%      % skills with scale
%      \profilesection{Skill}{5cm}
%      \givenskill
%      \giventextskill
%      \noindent
%      \scriptsize
%      \noindent
%      (*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
      
%      % languages with scale
%      \profilesection{Language}{3.2cm}
%      \givenlanguage
%      \giventextlanguage
%      \noindent
%      \scriptsize
%      \noindent
%      (*)[The language scale is from 0 (Fundamental Awareness) to 5 (Native/C2).]
%      
%	  \profilesection{Soft Skills}{5cm}
%	  %sarebbe da fare automatio con un for come le skill
%	  \begin{tikzpicture}
%	  \node [yshift=-5.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Teamwork};
%	  \node [xshift=23.0ex, yshift=3.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Critical Thinking};
%	  \node [xshift=5.0ex, yshift=10.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Organization};
%	  \node [xshift=23.0ex, yshift=18.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Integrity};
%	  \node [yshift=18.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Empathy};
%	  \node [xshift=15.0ex, yshift=26.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Problem-Solving};
%	  \node [yshift=33.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Flexibility};
%	  \node [xshift=23.0ex, yshift=33.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Adaptability};
%	 
%	  \end{tikzpicture}
	  
	  

    \end{flushleft}
  \end{textblock}
  \vspace{-10pt}
}


\newcommand{\makeprofilesecondpage}
{
	% grey bar on the left side
	\begin{tikzpicture}[remember picture,overlay]
		\node [rectangle, fill=violettoFrankCV, anchor=north, minimum width=9.90cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	\begin{textblock}{6}(0.5, 0.2)
		\begin{flushleft}
			% languages with scale
			\profilesection{Language}{3.2cm}
			\givenlanguage
			\giventextlanguage
			\noindent
			\scriptsize
			\noindent
			(*)[The language scale is from 0 (Fundamental Awareness) to 5 (Native/C2).]
			
			\profilesection{Soft Skills}{5cm}
			%sarebbe da fare automatio con un for come le skill
			\begin{tikzpicture}
				\node [yshift=-5.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Teamwork};
				\node [xshift=23.0ex, yshift=3.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Critical Thinking};
				\node [xshift=5.0ex, yshift=10.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Organization};
				\node [xshift=23.0ex, yshift=18.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Integrity};
				\node [yshift=18.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Empathy};
				\node [xshift=15.0ex, yshift=26.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Problem-Solving};
				\node [yshift=33.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Flexibility};
				\node [xshift=23.0ex, yshift=33.0ex, midway,rectangle,draw=white,rounded corners=2pt,inner sep=1pt,fill=orange]{\Large Adaptability};
				
			\end{tikzpicture}
		\end{flushleft}
	\end{textblock}
}

\newcommand{\makeprofilenewpage}
{
	% grey bar on the left side
	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=violettoFrankCV, anchor=north, minimum width=9.90cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}
	
	\begin{textblock}{6}(0.5, 0.2)
		\begin{flushleft}
			\hspace{20pt}
			
%			% profile picture
%			\ifthenelse{\equal{\givenprofilepic}{}}{}{\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
%				\clip (600/2, 567/2) circle (567/2);
%				\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\givenprofilepic}};
%				\end{tikzpicture}}
%			
%			% name
%			{\Huge\color{mainblue}\givencvname}
%			
%			% jobtitle
%			%\begin{flushright}
%			{\Large\color{black!80}\givencvjobtitle}
			%\end{flushright}
			\renewcommand{\arraystretch}{1.6}
			
			\profilesection{Interests}{5cm}
			Volunteer
			\begin{itemize}
				\item Scouts (AGESCI)
				\item Village Festivals
			\end{itemize}
			Agonistic Sports
			\begin{itemize}
				\item Rugby 2008 - 2014
				\item Football (Socc.) 2001 - 2009
			\end{itemize}
			% table with icons 
			Hobbies
			\vspace{-100pt}
			\begin{tabular}{c @{\hskip 0.2cm} p{5cm}}
				% CV birthdate
				%        \ifthenelse{\equal{\givencvdate}{}}{}{\textsc{\Large\icon{\faBirthdayCake}} & \givencvdate\\}
				%        % CV address
				%        \ifthenelse{\equal{\givencvaddress}{}}{}{\textsc{\Large\icon{\faMapMarker}} & \givencvaddress\\}
				%        % CV phone
				%        \ifthenelse{\equal{\givennumberphone}{}}{}{\textsc{\Large\icon{\faPhone}} & \href{tel:\givennumberphone}{\givennumberphone}\\}
				%        % CV site
				%        \ifthenelse{\equal{\givencvsite}{}}{}{\textsc{\Large\icon{\Mundus}} & \href{\givencvsite}{\textcolor{cerulean}\givencvsite}\\}
				%        % CV mail
				%        \ifthenelse{\equal{\givencvmail}{}}{}{\textsc{\Large\icon{\faEnvelope}} & \href{mailto:\givencvmail}{\givencvmail}\\}
				%        % CV git
				%        \ifthenelse{\equal{\givencvgit}{}}{}{\textsc{\Large\icon{\faGithub}} & \href{https://github.com/\givencvgit}{\textcolor{cerulean}\givencvgit}\\}
				%        %\textsc{\Large\icon{\faGithub}} & \cvgithub\\
				%        % CV LinkedIn
				%        \ifthenelse{\equal{\givencvlinkedin}{}}{}{\textsc{\Large\icon{\faLinkedin}} & \href{https://www.linkedin.com\givencvlinkedin}{\textcolor{cerulean}\givencvlinkedin}\\}
				
				\icon{\faTv} & Films, TV Series, Anime\\
				\icon{\faSoccerBallO} & Soccer\\
				\icon{\faHeadphones} & Music\\
				\icon{\faPlane} & Travel\\
				\icon{\faGamepad} & Videogames\\
				\icon{\Mountain} & Trekking\\
			\end{tabular}
			
			
%			% about me text
%			\profilesection{About me}{3.2cm}
%			\givenaboutme
			
%			      % skills with scale
%			      \profilesection{Skill}{5cm}
%			      \givenskill
%			      \giventextskill
%			      \noindent
%			      \scriptsize
%			      \noindent
%			      (*)[The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).]
			
%			% languages with scale
%			\profilesection{Language}{3.2cm}
%			\givenlanguage
%			\giventextlanguage
%			\noindent
%			\scriptsize
%			\noindent
%			(*)[The language scale is from 0 (Fundamental Awareness) to 6 (Expert).]
			
		\end{flushleft}
	\end{textblock}
	\vspace{-10pt}
}
%%%%%%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%%%%%%
%\makeatletter
%\patchcmd{\@sect}% <cmd>
%{\ifnum}% <search>
%{\edef\nowtitle{#7}\ifnum}% <replace>
%{}{}% <success><failure>
%\patchcmd{\@ssect}% <cmd>
%{\@tempskipa}% <search>
%{\edef\nowtitle{#5}\@tempskipa}% <replace>
%{}{}% <success><failure>
%\makeatother
%
%\newcommand{\nowtitle}{}

\newcounter{colorCounter}
%\def\@sectioncolor#1#2#3{ %#10#11#12#13#14#15#16
%  {%
%  % Switch between blue and gray
%   \round{#1#2#3}{%
%      \ifodd\value{colorCounter}%
%        mainblue%
%      \else%
%        maingray%
%        %violettoFrankCV%
%      \fi%
%    }%
%  }%
%  \stepcounter{colorCounter}%
%}

\def\@sectioncolor{ %#10#11#12#13#14#15#16
	{%
		% Switch between blue and gray
		\round{}{%
			\ifodd\value{colorCounter}%
			mainblue%
			\else%
			maingray%
			%violettoFrankCV%
			\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par%
  {%
    \LARGE 
    %\color{headercolor}%
    \color{violettoFrankCV}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\newcommand{\sectionicon}[2]{
  \par%
  {%
    \LARGE 
    #1 
    \color{headercolor}%
    %\color{violettoFrankCV}% %non ho notato cambiamenti
    \@sectioncolor #2%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
%  \large\color{headercolor} #1%
	\Large\color{black}{#1}% %%non riesco a farlo in grasssetto
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List twenty environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twenty}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitem}[4]{%
  \hspace{5pt}#1&\parbox[t]{9.5cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize#3}\\%
    #4\vspace{\parsep}%
  }\\%
}
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyicon}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemicon}[5]{%
 \hspace{3pt}\faicon{#1}\hspace{2pt}#2&\parbox[t]{11.2cm}{%
    \textbf{#3}%
    \hfill%
    {\footnotesize#4}\\%
    #5\vspace{\parsep}%
  }\\%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Small twenty List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshort}[2]{%
  \hspace{5pt}#1&\parbox[t]{11.5cm}{%
    \textbf{#2}%
  }\\%
}
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyshorticon}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshorticon}[3]{%
  \hspace{3pt}\faicon{#1}\hspace{3pt}#2&
      \parbox[t]{11.5cm}{%
    \textbf{#3}%
  }\\%
}

%%%%%%%%%%%%%%%%
% Page Setting %
%%%%%%%%%%%%%%%%
\RequirePackage[left=7.3cm,top=0.1cm,right=0.5cm,bottom=0.2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
