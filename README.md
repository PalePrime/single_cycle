# Design your own RISC-V in three days

This repository contains material used in the Summer School ["Design your own RISC-V in three days"](https://summerschool.eit.lth.se/) and previously
in the "RISC-V on FPGA in 90 minutes" workshop at the [RISC-V Summit Europe 2025](https://riscv-europe.org/summit/2025/).

For programs to run on more than one computer, they need to be standardized. We will focus on RISC-V, which is uniquely not owned by any computer chip manufacturer.

Computers are built from chips performing simple instructions. To really understand what's going on we investigate how these chips are created.

During the summer school, we will create our own physical version of a computer chip. It will be realized in an FPGA allowing a lot of existing, simple building blocks to be hooked up to your liking. We will work together to complete the design of a fully working computer, capable of running real programs, in three days.

The main point of the summer school is to experience how to design and implement a fully functional computer from first principles to executing programs. 
The take-aways should include how RISC-V can be used to raise educational goals and accomplishments, as well as the incredible, combined power and simplicity of open-source tools applied to open architecture specifications.

## Background

The Summer School is based on material developed at

[![Logo for the Faculty of Engineering at Lund University](/assets/lth_logo_en.svg)](https://www.lth.se/)

by Per Andersson as part of the effort to develop and improve education in Digital System Design, e.g., in the introductory course [Design of Digital Circuits - A Systems Approach](https://kurser.lth.se/lot/course-syllabus-en/25_26/EITF65) given during the second year of the EE and CE programs.

The background is summarized [in this presentation](/assets/RISC-V%20in%2090%20Minutes.pdf)

## Main Links used during the Summer School

Browser based [FPGA tool environment](https://summerschool.eit.lth.se/tools/) 

RISC-V [ISA Summary](https://pages.hmc.edu/harris/ddca/ddcarv/DDCArv_AppB_Harris.pdf) from text book referenced below

On-line [RISC-V Assembler](https://riscvasm.lucasteske.dev/) 

On-line [RISC-V C Compiler](https://godbolt.org/)

RISC-V [instruction encoder/decoder](https://luplab.gitlab.io/rvcodecjs/)

Browser based [Computer Text Terminal](https://console.zacharyschneider.ca/) used to communicate with the completed computer design

Calculators and converters for binary numbers [simple and effective](https://calc.50x.ca/) or [elaborate, spread-sheet like](https://instacalc.com/)

## The RISC-V design implemented

We go for maximum simplicity but include the full RV32I instruction set, <em>making it possible to run programs developed using standard compilers</em>.

1. Single cycle implementation - no pipeline, no wait-states
2. Only on-FPGA memory, no caching
3. Very simple I/O, just on-FPGA-board digital pins
4. No interrupts, traps,...

Also, not well verified/tested, no warranties whatsoever! 

## How to Use the Material

Any files named ???.ice, located in the ice directory, represent a digital design in our FPGA tool environment. All of them are available directly in the tool under the "File->Examples" menu. Most of these designs are available both in a completed version and as template designs intended as a starting point for your own work. Files named RV_???.ice represent appropriate steps to complete the RISC-V processor. 

During development we will primarily use a simple program in RISC-V assembly found in the file "p1.s", it can be pasted into the on-line assembler to produce machine code in hexadecimal notation. The hexadecimal code can in turn be copied and pasted into the design tool. At the final step of development we use program from the file "monitor.c" as to start-up our computer and will then be able to load and execute real programs on the running system.

The idea behind the step-wise refinement of the processor design is to develop skills in digital design in parallel with insights into the inner workings of a computer. The steps are:

1. The basic mechanism whereby the processor picks instructions, in sequence, one by one.
2. Adding a store for the instructions so that the instructions from the "p1.s" example gets picked one at a time.
3. Implement one single instruction, JAL, allowing the main loop in the program to run repeatedly.
4. Implementing the processor registers in which all values, used or computed, are picked up or stored by almost all instructions.
5. Implement most of the remaining instructions, effectively making the example program actually do something.
6. Implement the instructions and mechanisms required for the program to read from and write to memory after which "p1.s" should perform exactly as intended.
7. Wrapping up the parts still missing to finally complete the RV32I instruction set.
8. Adding input and output capabilities so that our computer can interact with the buttons and leds on the FPGA board. Now, we can use "p2.s".
9. Adding the capability to communicate with a user, and load programs on-the-fly. Now, we can finally compile and run real programs!

There is also a set of System Verilog files which can be used outside of the browser based design environment if you install native versions of tools like Verilator and Yosys. These files represent the same design as the ice-files at step seven.

## Information and Settings for the Tools

### FPGA tool environment

#### Use Chrome!

Note, at present our main tool environment is (fully) usable <em>only on Chrome or Chromium browsers</em>.

#### Where are the files?

Anything you "Save" or "Open" inside the tool environment is stored solely in your web browser's cache. It will be preserved unless you explicitly clear the cache or otherwise ask the browser to free up its storage.

To permanently save something on your computer you need to "Export" it from the tool. Similarly, to use any ice-file, or other example information, in the tool you need to use "Import" or copy-paste of text. 

#### First start

At first start you will need to select the proper FPGA board, use "ULX3S-85".

A major part of the tool is a port of [Icestudio](https://icestudio.io/) from its original form as an installed program to the web with everything running in the browser. Its basic functionality remains intact and you can access the original Icestudio documentation from the "Help" menu.

Note: The "Verify" function is not available, use the simulator to analyze your System Verilog code.

#### Simulation

The original Icestudio does not have a simulator. In our tool you move from the Icestudio design view by pressing the cogwheel with an "S" inside, the one with a "B" behaves like the original and prepares the design for use in an FPGA.

When moving back and forth between the tabs and after updates to files, please use the "Refresh" button on the simulator tab to make sure information is in sync.

The simulator environment opens in a separate browser tab. So far documentation is lacking. But the basic steps are:

1. Select the project saved from Icestudio, and you can access the files "main.sv" containing the complete System Verilog code and "main_tb.sv" containing a template test bench for your design.
2. Edit the test bench by adding any changes to input signals that should occur during simulation. Don't forget to "Save" your changes.
3. Run "Verilate" and check for any reported problems in your design. Then build the simulator using "Compile". Make sure to let it finnish, the last step says "linking" in the log. Finally, run "Simulate".
4. Press the "Refresh" button and open the resulting wave.vcd file in the "Waveform" view. Select signals to view the simulation results.

#### Windows specific issue

For upload to FPGA to work under Windows you may need to update the driver Windows selects for the FPGA board. In case uploading doesn't work do the following:

1. Download the [Zadig driver update tool](https://zadig.akeo.ie/#) and run it as Windows admin.
2. Choose "List all devices" from the Options-menu.
3. Select "ULX3S FPGA..." in the upper box.
4. Select "WinUSB..." to the right of the green arrow.
5. Click the large "Replace/Reinstall Driver" button.

![Zadig Window image](/assets/Zadig.png)

To restore the drivers and make the USB connection on the FPGA board be usable as a terminal you need to restore the driver by re-installing the original which you can download from [the FTDI VCD driver homepage](https://ftdichip.com/drivers/vcp-drivers/) or directly [through this link](https://ftdichip.com/wp-content/uploads/2025/03/CDM2123620_Setup.zip).

### Compiler Explorer

Select "C" as the language and select the "RISC-V rv32gc clang 20.1.0" compiler.

Put "-O1  -march=rv32i -mabi=ilp32 -fno-inline" in the compiler flag box.

## Additional Material

Text book [Digital Design and Computer Architecture](https://shop.elsevier.com/books/digital-design-and-computer-architecture-risc-v-edition/harris/978-0-12-820064-3) by Harris & Harris

Book on [System Verilog for Design](https://ia801306.us.archive.org/18/items/springer_10.1007-978-1-4757-6682-0/10.1007-978-1-4757-6682-0.pdf) by Sutherland, Davidmann & Flake

FPGA Board used, the [Lattice5 based ULX3S](https://radiona.org/ulx3s/) designed at the University of Zagreb

Simulator illustrating the [basic operation of a RISC-V Processor](https://eseo-tech.github.io/emulsiV/)

## Can I Contribute to the Tool environment?

At present the source code tree behind the Browser based FPGA tool environment is a mess. We aim to make everything available through GitHub pending clean-up and refactoring. For now there is a start in the repository [ToolsForWasm](https://github.com/PalePrime/ToolsForWasm) representing the way underlying tools are integrated into our environment. 

## Credits

This workshop was made possible by grants from

[<img src="/assets/ChipsOfEurope.png" alt="Logo for the Chips of Europe project" width="200">](https://chipsofeurope.eu/)

[<img src="/assets/SCCC-logo_liggande_rgb.png" alt="Logo for the Swedish Chips Competence Center" width="200">](https://sccc.se/)

Our work in System level Chip design is conducted within the national Competence Center, classIC:

[<img src="/assets/classIC.png" alt="Logo for the classIC competence center" width="150">](https://www.chalmers.se/en/centres/classic/)

funded by

[<img src="/assets/SSF_Logo.svg" alt="Logo for the Swedish Foundation for Strategic Research" width="150">](https://strategiska.se/en/)

Special credits to all open-source projects that underpins our on-line FPGA tool environment, primarily:

[Icestudio](https://icestudio.io/)

[Verilator](https://www.veripool.org/verilator/)

[Yosys](http://yosyshq.net/yosys/)

[nextpnr](https://github.com/YosysHQ/nextpnr)

[Emscripten](https://emscripten.org/)
