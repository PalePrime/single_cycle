# RISC-V on FPGA in 90 minutes

This repository contains the material used in the "RISC-V on FPGA in 90 minutes" workshop at the [RISC-V Summit Europe 2025](https://riscv-europe.org/summit/2025/).

The main point of the tutorial is to experience how to design and implement a simple RISC-V processor from scratch to executing programs on an FPGA-board within the timeframe of 90 minutes. The take-aways should include how RISC-V can be used to raise educational goals and accomplishments, as well as the incredible, combined power and simplicity of open-source tools applied to open architecture specifications.

## Background

The Workshop is based on material developed at

[![Logo for the Faculty of Engineering at Lund University](/assets/lth_logo_en.svg)](https://www.lth.se/)

by Per Andersson as part of the effort to develop and improve education in Digital System Design, e.g., in the introductory course [Design of Digital Circuits - A Systems Approach](https://kurser.lth.se/lot/course-syllabus-en/25_26/EITF65) given during the second year of the EE and CE programs.

The background is summarized [in this presentation](/assets/RISC-V%20in%2090%20Minutes.pdf)

## Main Links used during the Workshop

Browser based [FPGA tool environment](https://digitalteknik.eit.lth.se/) 

RISC-V [ISA Summary](https://pages.hmc.edu/harris/ddca/ddcarv/DDCArv_AppB_Harris.pdf) from text book referenced below

On-line [RISC-V assembler](https://riscvasm.lucasteske.dev/)

## The RISC-V design implemented

We go for maximum simplicity but include the full RV32I instruction set, making it possible to run programs from standard compilers.

1. Single cycle implementation - no pipeline, no wait-states
2. Only on-FPGA memory, no caching
3. Very simple I/O, just on-FPGA-board digital pins
4. No interrupts, traps,...

Also, not well verified/tested, no warranties whatsoever! 

## How to Use the Material

The files RV_???.ice represent the steps taken to complete the design. Download any ice-file locally and import into FPGA tool environment to start from a certain step.

During development we use a simple program in RISC-V assembly found in the file "p1.s", it can be pasted into the on-line assembler to produce machine code in hexadecimal code.

There is also a set of System Verilog files which can be used outside of the browser based design environment if you install native versions of tools like Verilator and Yosys. These files represent the same design as the final ice-file.

## Next steps

We will run a three-day summer school, essentially an expanded version of this workshop, June 10-12, 2025, at Lund University. We target to generate interest in Digital Chip design among prospective or first-year students. [Please sign up here](). 

## Additional Material

FPGA Board used, the [Lattice5 based ULX3S](https://radiona.org/ulx3s/) designed at the University of Zagreb

Text book [Digital Design and Computer Architecture](https://shop.elsevier.com/books/digital-design-and-computer-architecture-risc-v-edition/harris/978-0-12-820064-3) by Harris & Harris

## Can I Contribute to the Tool environment?

At present the source code tree behind the Browser based FPGA tool environment is a mess. We aim to make everything available through GitHub pending clean-up and refactoring. For now there is a start in the repository [ToolsForWasm](https://github.com/PalePrime/ToolsForWasm) representing the way underlying tools are integrated into our environment. 

## Credits

This workshop was made possible by grants from

[<img src="/assets/ChipsOfEurope.png" alt="Logo for the Chips of Europe project" width="200">](https://chipsofeurope.eu/)

[<img src="/assets/SCCC-logo_liggande_rgb.png" alt="Logo for the Swedish Chips Competence Center" width="200">](https://sccc.se/)

Our work in System level Chip design is conducted within the national Competence Center, classIC:

[<img src="/assets/classIC.png" alt="Logo for the classIC competence center" width="150">](https://www.chalmers.se/en/centres/classic/)

funded by

[<img src="/assets/SSF_Logo.svg" alt="Logo for the Swedish Foundation for Strategic Research" width="200">](https://strategiska.se/en/)

Special credits to all open-source projects that underpins our on-line FPGA tool environment, primarily:

[Icestudio](https://icestudio.io/)

[Verilator](https://www.veripool.org/verilator/)

[Yosys](http://yosyshq.net/yosys/)

[nextpnr](https://github.com/YosysHQ/nextpnr)

[Emscripten](https://emscripten.org/)
