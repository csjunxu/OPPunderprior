Pmet LaTeX2e Package for Psychometrika Authors: Version 1C1

Note 1: Obtain the latest information at:
http://www.psychometricsociety.org

Note2: When papers are submitted, author names need to removed from all pages except the title page. By default this LaTeX package is designed to produced a document that doesn't contain any author information in the headers; however, the name of your LaTeX file is printed in the header, so it's important that you not use any identifying information in your file's name. (An explanation of how you can disable these defaults is listed below, but we strongly encourage you to use the default header settings, when you make your submission.)


What is  contained in this file:
CONTENTS OF THE PACKAGE
INSTALLATION
HOW TO CONTACT US
WHERE TO GET TEX/LATEX HELP

CONTENTS OF THE PACKAGE

This disk contains the following files:

In the "root" directory:
+ readme.1st (Lists available packages and revision history.)

In the "Version 1C1" directory:
+ readme. txt (This document.)
+ pmet.cls (A modification of the file "psychometrika.cls"
    -- which is used in the preparation of page proofs.
    The "psychometrika.cls" file is a modification of the file "article.cls".
    Don Deland of Integre Technical Publications created the psychometrika.cls file,
    and Tim Null modified it to create the pmet.cls file.)
+ psycho10.clo (A modification of the file "size10.clo" that is required
    by the file "pmet.cls".)
+ article.tex (a template for articles that demonstrates how to use
    the above files in preparing an article for Psychometrika)
+ qedequation.sty (A package that provides the ability to include
    an end of proof symbol at the end of proofs using the \qed command.)
+ boldgreek.tex (Provides commands to have bold Greek letters.)
+ nohead.sty (Removes the trimmarks and header at the top of each page. If you enable the \usepackage{nohead} command, disable the \submit command, and then enable either the \markboth{}{} command or the \markright{} command, you will end up with a versatile document system.)

INSTALLATION

+ You need a text editor and a properly installed version of LaTeX on your
    computer system.
+ You need to put copies of pmet.cls, psycho10.clo, nohead.sty,qedequation.sty,
    and article.tex in a location where LaTeX can find them. 
    (You should read your local documentation on how to
    do this, but normally everything should run properly, 
    if all these files are in the same directory.)
+ Rename "article.tex", and open the new file in your text editor.
+ If you have ever used a template file before, the rest should become pretty
    clear as soon as you start reading "article.tex" in your text editor.
+ Section, subsection, and subsubsection titles are unnumbered by default.
    If you wish to use numbered sections etc.,
    change  \setcounter{secnumdepth}{0}
    to      \setcounter{secnumdepth}{3}
    Note: the zero has been changed to a three.

HOW TO CONTACT US

If you have questions, suggestions, or comments specifically related to the
Psychometrika LaTeX Package for Authors, they can be directed to the
Technical Editor (Tim Null) at tim@timnull.com.

WHERE TO GET TEX/LATEX HELP

When you have a TeX or LaTeX question, a good place to start looking
for an answer is the TeX User's Group (TUG) website at http://www.tug.org.
(If you live outside the U.S.A., you should be able to
find a listing on the TUG website for a user group "near"
(within flying distance) of your location.
