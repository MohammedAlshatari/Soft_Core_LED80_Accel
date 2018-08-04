-- progloader
-- LED80 with matrix accelerator
-- Set PMEM -> 9

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY progloader IS
	generic(
		LOADER_SIZE : integer:= 8
		);

	PORT(
		addr: IN STD_LOGIC_VECTOR(LOADER_SIZE - 1 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END progloader;

ARCHITECTURE dataflow OF progloader IS

SIGNAL index: INTEGER RANGE 0 TO 2**LOADER_SIZE - 1;
TYPE vector_array IS ARRAY (0 to 2**LOADER_SIZE-1) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT memory : vector_array := 
	(


-- Assembled by SoftAsm.py at Mon Mar 13 20:47:18 2017
-- Start location: 0x000
-- End location: 0x011
-- Highest program address: 0x139
-- .equ x0 0x00
-- .equ x1 0x01
-- .equ x2 0x02
-- .equ x3 0x03
-- .equ x4 0x04
-- .equ x5 0x05
-- .equ x6 0x06
-- .equ x7 0x07
-- .equ x8 0x08
-- .equ x9 0x09
-- .equ x10 0x0A
-- .equ x11 0x0B
-- .equ x12 0x0C
-- .equ x13 0x0D
-- .equ x14 0x0E
-- .equ x15 0x0F
-- .equ tx0 0x10
-- .equ tx1 0x14
-- .equ tx2 0x18
-- .equ tx3 0x1C
-- .equ tx4 0x1D
-- .equ tx5 0x11
-- .equ tx6 0x15
-- .equ tx7 0x19
-- .equ tx8 0x1A
-- .equ tx9 0x1E
-- .equ tx10 0x12
-- .equ tx11 0x16
-- .equ tx12 0x17
-- .equ tx13 0x1B
-- .equ tx14 0x1F
-- .equ tx15 0x13
-- .equ mx0 0x10
-- .equ mx4 0x14
-- .equ mx8 0x18
-- .equ mx12 0x1C
-- .equ k0 0x20
-- .equ k19 0x33
-- .equ step 0x34
-- .equ rnd 0x35
-- .equ kptr 0x36
-- .lbl lpst 0x000
-- .lbl lpnd 0x00F
-- .lbl stplp 0x012
-- .lbl stplp1 0x019
-- .lbl stpnd 0x028
-- .lbl rndlp 0x029
-- .lbl sbst 0x073
-- .lbl sbnd 0x07B
-- .lbl matwr 0x0EA
-- .lbl matrd 0x0FF
-- .lbl adky 0x119
-- .lbl adky1 0x11E
-- .lbl kprt 0x12B
-- .lbl kpct 0x12D
-- .lbl adkynd 0x136

x"90", --PC=0x000 jsr stplp
x"12",
x"50", --PC=0x002 mvi step, r0
x"34",
x"01", --PC=0x004 lds r0, r1
x"52", --PC=0x005 mvi 0x0B, r2
x"0B",
x"6C", --PC=0x007 sub r1, r2
x"16",
x"F8", --PC=0x009 bzi lpnd
x"0F",
x"61", --PC=0x00B inc r1
x"24", --PC=0x00C sts r1, r0
x"D0", --PC=0x00D jmp lpst
x"00",
x"91", --PC=0x00F jsr adky
x"19",
 -------PC=0x011---- end -----
x"40", --PC=0x011 nop
x"50", --PC=0x012 mvi 0x00, r0
x"00",
x"51", --PC=0x014 mvi rnd, r1
x"35",
x"21", --PC=0x016 sts r0, r1
x"91", --PC=0x017 jsr adky
x"19",
x"90", --PC=0x019 jsr rndlp
x"29",
x"50", --PC=0x01B mvi rnd, r0
x"35",
x"01", --PC=0x01D lds r0, r1
x"52", --PC=0x01E mvi 0x03, r2
x"03",
x"6C", --PC=0x020 sub r1, r2
x"16",
x"F8", --PC=0x022 bzi stpnd
x"28",
x"61", --PC=0x024 inc r1
x"24", --PC=0x025 sts r1, r0
x"D0", --PC=0x026 jmp stplp1
x"19",
x"A0", --PC=0x028 ret  
x"50", --PC=0x029 mvi 0x05, r0
x"05",
x"51", --PC=0x02B mvi x0, r1
x"00",
x"06", --PC=0x02D lds r1, r2
x"B2", --PC=0x02E xor r0, r2
x"29", --PC=0x02F sts r2, r1
x"50", --PC=0x030 mvi 0x04, r0
x"04",
x"51", --PC=0x032 mvi x4, r1
x"04",
x"06", --PC=0x034 lds r1, r2
x"B2", --PC=0x035 xor r0, r2
x"29", --PC=0x036 sts r2, r1
x"50", --PC=0x037 mvi 0x02, r0
x"02",
x"51", --PC=0x039 mvi x8, r1
x"08",
x"06", --PC=0x03B lds r1, r2
x"B2", --PC=0x03C xor r0, r2
x"29", --PC=0x03D sts r2, r1
x"50", --PC=0x03E mvi 0x03, r0
x"03",
x"51", --PC=0x040 mvi x12, r1
x"0C",
x"06", --PC=0x042 lds r1, r2
x"B2", --PC=0x043 xor r0, r2
x"29", --PC=0x044 sts r2, r1
x"50", --PC=0x045 mvi step, r0
x"34",
x"00", --PC=0x047 lds r0, r0
x"51", --PC=0x048 mvi 0x03, r1
x"03",
x"6C", --PC=0x04A sll r1, r0
x"74",
x"52", --PC=0x04C mvi rnd, r2
x"35",
x"0A", --PC=0x04E lds r2, r2
x"51", --PC=0x04F mvi 0x01, r1
x"01",
x"6C", --PC=0x051 sll r1, r2
x"76",
x"6C", --PC=0x053 add r2, r0
x"08",
x"51", --PC=0x055 mvi 0x10, r1
x"10",
x"6C", --PC=0x057 add r1, r0
x"04",
x"41", --PC=0x059 mov r0, r1
x"C0", --PC=0x05A trf t0, r0
x"61", --PC=0x05B inc r1
x"C1", --PC=0x05C trf t0, r1
x"52", --PC=0x05D mvi x1, r2
x"01",
x"0B", --PC=0x05F lds r2, r3
x"B3", --PC=0x060 xor r0, r3
x"2E", --PC=0x061 sts r3, r2
x"52", --PC=0x062 mvi x5, r2
x"05",
x"0B", --PC=0x064 lds r2, r3
x"B7", --PC=0x065 xor r1, r3
x"2E", --PC=0x066 sts r3, r2
x"52", --PC=0x067 mvi x9, r2
x"09",
x"0B", --PC=0x069 lds r2, r3
x"B3", --PC=0x06A xor r0, r3
x"2E", --PC=0x06B sts r3, r2
x"52", --PC=0x06C mvi x13, r2
x"0D",
x"0B", --PC=0x06E lds r2, r3
x"B7", --PC=0x06F xor r1, r3
x"2E", --PC=0x070 sts r3, r2
x"50", --PC=0x071 mvi x15, r0
x"0F",
x"01", --PC=0x073 lds r0, r1
x"C1", --PC=0x074 trf t0, r1
x"24", --PC=0x075 sts r1, r0
x"64", --PC=0x076 dec r0
x"F4", --PC=0x077 bni sbnd
x"7B",
x"D0", --PC=0x079 jmp sbst
x"73",
x"50", --PC=0x07B mvi x0, r0
x"00",
x"01", --PC=0x07D lds r0, r1
x"52", --PC=0x07E mvi tx0, r2
x"10",
x"26", --PC=0x080 sts r1, r2
x"60", --PC=0x081 inc r0
x"01", --PC=0x082 lds r0, r1
x"52", --PC=0x083 mvi tx1, r2
x"14",
x"26", --PC=0x085 sts r1, r2
x"60", --PC=0x086 inc r0
x"01", --PC=0x087 lds r0, r1
x"52", --PC=0x088 mvi tx2, r2
x"18",
x"26", --PC=0x08A sts r1, r2
x"60", --PC=0x08B inc r0
x"01", --PC=0x08C lds r0, r1
x"52", --PC=0x08D mvi tx3, r2
x"1C",
x"26", --PC=0x08F sts r1, r2
x"60", --PC=0x090 inc r0
x"01", --PC=0x091 lds r0, r1
x"62", --PC=0x092 inc r2
x"26", --PC=0x093 sts r1, r2
x"60", --PC=0x094 inc r0
x"01", --PC=0x095 lds r0, r1
x"52", --PC=0x096 mvi tx5, r2
x"11",
x"26", --PC=0x098 sts r1, r2
x"60", --PC=0x099 inc r0
x"01", --PC=0x09A lds r0, r1
x"52", --PC=0x09B mvi tx6, r2
x"15",
x"26", --PC=0x09D sts r1, r2
x"60", --PC=0x09E inc r0
x"01", --PC=0x09F lds r0, r1
x"52", --PC=0x0A0 mvi tx7, r2
x"19",
x"26", --PC=0x0A2 sts r1, r2
x"60", --PC=0x0A3 inc r0
x"01", --PC=0x0A4 lds r0, r1
x"62", --PC=0x0A5 inc r2
x"26", --PC=0x0A6 sts r1, r2
x"60", --PC=0x0A7 inc r0
x"01", --PC=0x0A8 lds r0, r1
x"52", --PC=0x0A9 mvi tx9, r2
x"1E",
x"26", --PC=0x0AB sts r1, r2
x"60", --PC=0x0AC inc r0
x"01", --PC=0x0AD lds r0, r1
x"52", --PC=0x0AE mvi tx10, r2
x"12",
x"26", --PC=0x0B0 sts r1, r2
x"60", --PC=0x0B1 inc r0
x"01", --PC=0x0B2 lds r0, r1
x"52", --PC=0x0B3 mvi tx11, r2
x"16",
x"26", --PC=0x0B5 sts r1, r2
x"60", --PC=0x0B6 inc r0
x"01", --PC=0x0B7 lds r0, r1
x"62", --PC=0x0B8 inc r2
x"26", --PC=0x0B9 sts r1, r2
x"60", --PC=0x0BA inc r0
x"01", --PC=0x0BB lds r0, r1
x"52", --PC=0x0BC mvi tx13, r2
x"1B",
x"26", --PC=0x0BE sts r1, r2
x"60", --PC=0x0BF inc r0
x"01", --PC=0x0C0 lds r0, r1
x"52", --PC=0x0C1 mvi tx14, r2
x"1F",
x"26", --PC=0x0C3 sts r1, r2
x"60", --PC=0x0C4 inc r0
x"01", --PC=0x0C5 lds r0, r1
x"52", --PC=0x0C6 mvi tx15, r2
x"13",
x"26", --PC=0x0C8 sts r1, r2
x"50", --PC=0x0C9 mvi mx0, r0
x"10",
x"90", --PC=0x0CB jsr matwr
x"EA",
x"51", --PC=0x0CD mvi x0, r1
x"00",
x"90", --PC=0x0CF jsr matrd
x"FF",
x"50", --PC=0x0D1 mvi mx4, r0
x"14",
x"90", --PC=0x0D3 jsr matwr
x"EA",
x"51", --PC=0x0D5 mvi x1, r1
x"01",
x"90", --PC=0x0D7 jsr matrd
x"FF",
x"50", --PC=0x0D9 mvi mx8, r0
x"18",
x"90", --PC=0x0DB jsr matwr
x"EA",
x"51", --PC=0x0DD mvi x2, r1
x"02",
x"90", --PC=0x0DF jsr matrd
x"FF",
x"50", --PC=0x0E1 mvi mx12, r0
x"1C",
x"90", --PC=0x0E3 jsr matwr
x"EA",
x"51", --PC=0x0E5 mvi x3, r1
x"03",
x"90", --PC=0x0E7 jsr matrd
x"FF",
x"A0", --PC=0x0E9 ret
x"52", --PC=0x0EA mvi 0x00, r2
x"00",
x"03", --PC=0x0EC lds r0, r3
x"6C", --PC=0x0ED mtw r2, r3
x"CB",
x"60", --PC=0x0EF inc r0
x"62", --PC=0x0F0 inc r2
x"03", --PC=0x0F1 lds r0, r3
x"6C", --PC=0x0F2 mtw r2, r3
x"CB",
x"60", --PC=0x0F4 inc r0
x"62", --PC=0x0F5 inc r2
x"03", --PC=0x0F6 lds r0, r3
x"6C", --PC=0x0F7 mtw r2, r3
x"CB",
x"60", --PC=0x0F9 inc r0
x"62", --PC=0x0FA inc r2
x"03", --PC=0x0FB lds r0, r3
x"6C", --PC=0x0FC mtw r2, r3
x"CB",
x"A0", --PC=0x0FE ret
x"50", --PC=0x0FF mvi 0x04, r0
x"04",
x"52", --PC=0x101 mvi 0x00, r2
x"00",
x"6C", --PC=0x103 mtr r2, r3
x"FB",
x"2D", --PC=0x105 sts r3, r1
x"6C", --PC=0x106 add r0, r1
x"01",
x"62", --PC=0x108 inc r2
x"6C", --PC=0x109 mtr r2, r3
x"FB",
x"2D", --PC=0x10B sts r3, r1
x"6C", --PC=0x10C add r0, r1
x"01",
x"62", --PC=0x10E inc r2
x"6C", --PC=0x10F mtr r2, r3
x"FB",
x"2D", --PC=0x111 sts r3, r1
x"6C", --PC=0x112 add r0, r1
x"01",
x"62", --PC=0x114 inc r2
x"6C", --PC=0x115 mtr r2, r3
x"FB",
x"2D", --PC=0x117 sts r3, r1
x"A0", --PC=0x118 ret
x"52", --PC=0x119 mvi kptr, r2
x"36",
x"0A", --PC=0x11B lds r2, r2
x"50", --PC=0x11C mvi x0, r0
x"00",
x"01", --PC=0x11E lds r0, r1
x"0B", --PC=0x11F lds r2, r3
x"B7", --PC=0x120 xor r1, r3
x"2C", --PC=0x121 sts r3, r0
x"53", --PC=0x122 mvi k19, r3
x"33",
x"6C", --PC=0x124 sub r2, r3
x"1B",
x"F9", --PC=0x126 bzi kprt
x"2B",
x"62", --PC=0x128 inc r2
x"D1", --PC=0x129 jmp kpct
x"2D",
x"52", --PC=0x12B mvi k0, r2
x"20",
x"53", --PC=0x12D mvi 0x0F, r3
x"0F",
x"6C", --PC=0x12F sub r0, r3
x"13",
x"F9", --PC=0x131 bzi adkynd
x"36",
x"60", --PC=0x133 inc r0
x"D1", --PC=0x134 jmp adky1
x"1E",
x"51", --PC=0x136 mvi kptr, r1
x"36",
x"29", --PC=0x138 sts r2, r1
x"A0", --PC=0x139 ret
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00"



);

BEGIN

	index <= to_integer(unsigned(addr));
	dout <= memory(index);

END dataflow;
