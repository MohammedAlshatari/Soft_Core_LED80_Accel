# Soft_Core_LED80_Accel
LED-80 Lightweight Block Cipher for Soft Core with Accelerator
Based on Soft Core Microprocessor William Diehl Version 1.3 07-23-2018

I. Contents:

    Program Loader (PROGLOAD.vhd) and Data Loader (DATALOAD.vhd) Soft Core VHDL source files
    Custom soft core datapath (Datapath.vhd) and GF4_mul.vhd accelerator
    LED-80 encryption application source file and simulator files
    LED-80 encryption object file
    
II. Limitations: Assembler and Simulator verified in Windows 8; Does not function correctly in LINUX

III. Quick Start Guide:

    See "Quick Start Guide" for SoftCore Project
    
    For assembly and simulation: Use ledmatmul80.txt for source file, or pre-assembled ledmatmul80obj.txt.  Use matdata.txt and ledtable80.txt for simulation.
    
    For VHDL simulation, replace PROGLOAD.vhd and DATALOAD.vhd in SoftCore Project with PROGLOAD.vhd and DATALOAD.vhd from this project.  Update relevant generics and constants in loader_tb.vhd and loader.vhd.  Add GF4_mul.vhd to project, and replace Datapath.vhd from SoftCore Project with Datapath.vhd from this project.
