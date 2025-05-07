# RISC-V on FPGA in 90 minutes

This repository contains the material used in the "RISC-V on FPGA in 90 minutes" workshop at the [RISC-V Summit Europe 2025](https://riscv-europe.org/summit/2025/).

The main point of the tutorial is to experience how to design and implement a simple RISC-V processor from scratch to executing programs on an FPGA-board within the timeframe of 90 minutes. The take-aways should include how RISC-V can be used to raise educational goals and accomplishments, as well as the incredible, combined power and simplicity of open-source tools applied to open architecture specifications.

## Background

The Workshop is based on material developed at

[![Logo for the Faculty of Engineering at Lund University](/assets/lth_logo_en.svg)](https://www.lth.se/)

by Per Andersson as part of the effort to develop and improve education in Digital System Design, e.g., in the introductory course [Design of Digital Circuits - A Systems Approach](https://kurser.lth.se/lot/course-syllabus-en/25_26/EITF65) given during the second year of the EE and CE programs.

## Main Links used during the Workshop

Browser based [FPGA tool environment](https://digitalteknik.eit.lth.se/) 

RISC-V [ISA Summary](https://pages.hmc.edu/harris/ddca/ddcarv/DDCArv_AppB_Harris.pdf) from text book referenced below

On-line [RISC-V assembler](https://riscvasm.lucasteske.dev/)

## The RISC-V design used

We go for maximum simplicity but include the full RV32I instruction set, making it possible to run programs from standard compilers.

1. Single cycle implementation - no pipeline, no wait-states
2. Only on-FPGA memory, no caching
3. Very simple I/O, just on-FPGA-board digital pins
4. No interrupts, traps,...

Also, not well verified/tested. No warranties whatsoever! 

## Additional Material

FPGA Board used, the [Lattice5 based ULX3S](https://radiona.org/ulx3s/) designed at the University of Zagreb

Text book [Digital Design and Computer Architecture](https://shop.elsevier.com/books/digital-design-and-computer-architecture-risc-v-edition/harris/978-0-12-820064-3) by Harris & Harris

## Credits

This workshop was made possible by grants from

[![Logo for the Chips of Europe project](/assets/ChipsOfEurope.png)](https://chipsofeurope.eu/)

[![Logo for the Swedish Chips Competence Center](/assets/SCCC-logo_liggande_rgb.png)](https://sccc.se/)

Our work in System level Chip design is conducted within the national Competence Center, classIC:

[![Logo for the classIC competence center](/assets/classIC.png)](https://www.chalmers.se/en/centres/classic/)

<img src="/assets/classIC.png" alt="Logo for the classIC competence center" width="100">

funded by

[![Logo for the Swedish Foundation for Strategic Research](/assets/SSF_Logo.svg)](https://strategiska.se/en/)








