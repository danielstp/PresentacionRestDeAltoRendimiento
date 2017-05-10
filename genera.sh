#!/bin/bash

Genera(){
  ## --use-part-section
  nombreArchivo=$1
  idioma=es
  generadoPor='s/longtable/longtabu/g'
  tipoDocumento=report
  tamPapel=letterpaper
  tamLetra=11pt
  opcionesDoc=$tamPapel,$tamLetra
  plantilla=./latex2e/xelatex.tex
  opcionesGenera="--template=$plantilla --documentclass=$tipoDocumento --documentoptions=$opcionesDoc --use-latex-docinfo --use-latex-citations --figure-citations --section-subtitles --smart-quotes=yes -r 3 --section-numbering --compound-enumerators -l $idioma"
  rst2xetex $opcionesGenera $nombreArchivo.rst $nombreArchivo.tex
  #sed -i $generadoPor  $nombreArchivo.tex
  sed -i 's/... continued on next page/... continua en la siguiente página/g' $nombreArchivo.tex
  sed -i 's/{[ ]*/{/g' $nombreArchivo.tex
  sed -i 's/[ ]*}/}/g' $nombreArchivo.tex
  sed -i 's/\DUrole{imagentex}{([[:print:]])\\}\\{([[:print:]])}/\DUrole{imagentex}{\1}{\2}/g' $nombreArchivo.tex
  #sed -i 's/\\end{quote}/\\end{quotation}/g' $nombreArchivo.tex

  latexmk -latexoption="-synctex=1 -interaction=batchmode -shell-escape" -xelatex $nombreArchivo.tex
}

GeneraPresentacion(){
  hovercraft $1.rst docs
}

#nombreArchivo=Lista
#Genera $nombreArchivo

GeneraPresentacion Presenta
