--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2006 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file jpeg_ht_nr_of_symbols.vhd when simulating
-- the core, jpeg_ht_nr_of_symbols. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synopsys directives "translate_off/translate_on" specified
-- below are supported by XST, FPGA Compiler II, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY jpeg_ht_nr_of_symbols IS
	port (
	A: IN std_logic_VECTOR(7 downto 0);
	CLK: IN std_logic;
	D: IN std_logic_VECTOR(7 downto 0);
	WE: IN std_logic;
	DPRA: IN std_logic_VECTOR(7 downto 0);
	DPO: OUT std_logic_VECTOR(7 downto 0);
	SPO: OUT std_logic_VECTOR(7 downto 0));
END jpeg_ht_nr_of_symbols;

ARCHITECTURE jpeg_ht_nr_of_symbols_a OF jpeg_ht_nr_of_symbols IS
 
COMPONENT dist_mem_gen_0
  PORT (
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dpra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    dpo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;
 
BEGIN
 
U0 : dist_mem_gen_0
  PORT MAP (
    a => a,
    d => d,
    dpra => dpra,
    clk => clk,
    we => we,
    spo => spo,
    dpo => dpo
  );
 

END jpeg_ht_nr_of_symbols_a;

