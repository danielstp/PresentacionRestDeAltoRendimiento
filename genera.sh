#!/bin/bash

GeneraPresentacion(){
  hovercraft -t template/default/template.cfg $1.rst $1_html
}
rm -r HowToScaleWithoutUpgradingInfrastructure HowToScaleWithoutUpgradingInfrastructure.zip HowToScaleWithoutUpgradingInfrastructure.7z

GeneraPresentacion Presenta
GeneraPresentacion EnglishVersion

mv EnglishVersion_html HowToScaleWithoutUpgradingInfrastructure
cp EnglishVersion.rst HowToScaleWithoutUpgradingInfrastructure/HowToScaleWithoutUpgradingInfrastructure.rst

rm HowToScaleWithoutUpgradingInfrastructure/js/impress.js
cp impress.js-2.0.0/js/impress.js HowToScaleWithoutUpgradingInfrastructure/js/

zip -r HowToScaleWithoutUpgradingInfrastructure.zip HowToScaleWithoutUpgradingInfrastructure/* &
7z a -mmt=24 -mx=9 HowToScaleWithoutUpgradingInfrastructure.7z HowToScaleWithoutUpgradingInfrastructure

wait