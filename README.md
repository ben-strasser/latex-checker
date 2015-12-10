# Latex-Checker

Consider the following erroneous latex code with an error:

```latex
\documentclass{beamer}

\begin{document}

\begin{frame}

\begin{itemize}
\item Foo
\item Bar

\end{frame}

\end{document}
```

The error is the missing \end{itemize}. The standard pdflatex output is not very helpful:

```
[...]
(/usr/share/texmf/tex/latex/beamer/base/translator/dicts/translator-theorem-dic
tionary/translator-theorem-dictionary-English.dict) (./main.nav))
Runaway argument?
\let \AtEndDocument \@firstofone \@enddocumenthook \@checkend {docume\ETC.
! File ended while scanning use of \beamer@collect@@body.
<inserted text> 
                \par 
<*> main.tex
```

It does state that there is probably a problem with a missing parenthesis (Runaway argument) somewhere. There is no line number. There is no name of a problematic command. Identifying the cause of such an error in a large Latex documents essentially boils down to performing a binary search by commenting out half of the code and checking whether the error is gone. Latex-Checker fixes this by checking for very few but very common error types and provides a useful error message for these. Applied to the code above the message is:

```
Error in line 11: on line 7 a "\begin{itemize}" was opened but has not yet been closed. The "\end{frame}" does not fit. A matching "\begin{frame}" was opened on line 5 but one parenthesis must be closed first.
```

This is a significantly more helpful message. It contains a line number. It tells you what type of block needs to be closed and where it was opened.

Latex-Checker is a command line tool that reads a latex file from stdin and write diagnostics to stdout.

Latex-Checker has no dependencies except a sufficiently recent C++ compiler.

Note that Latex-Checker does not attempt to fully understand latex and is not meant to. If you do funky stuff such as changing category code then you are on your own.
