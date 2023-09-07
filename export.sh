#!/usr/bin/env bash
mkdir -p outputs/jlc
PROJ=colorlight-cnc-proto
kikit fab jlcpcb --missingWarn --schematic $PROJ.kicad_sch --assembly --field "LCSC#" $PROJ.kicad_pcb outputs/jlc
kicad-cli sch export pdf -o outputs/$PROJ-schematic.pdf $PROJ.kicad_sch
kicad-cli sch export python-bom -o outputs/bom.xml $PROJ.kicad_sch
/usr/bin/python3 "/usr/share/kicad/plugins/bom_csv_grouped_by_value.py" outputs/bom.xml "outputs/bom.csv"

