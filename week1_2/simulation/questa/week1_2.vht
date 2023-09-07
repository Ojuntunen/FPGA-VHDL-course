LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY week1_2_vhd_tst IS
END week1_2_vhd_tst;
ARCHITECTURE week1_2_arch OF week1_2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL cin : STD_LOGIC;
SIGNAL cout : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LEDR_XOR : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT week1_2
	PORT (
	a 			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	b 			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	cin 		: IN STD_LOGIC;
	cout 		: OUT STD_LOGIC;
	s 			: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDR_XOR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : week1_2
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	cin => cin,
	cout => cout,
	s => s,
	LEDR_XOR => LEDR_XOR
	);
init : PROCESS                                               
-- variable declarations
	constant period: time := 20 ps;                                     
BEGIN                                                        
        -- code that executes only once
	a <= "0000";
	b <= "0000";
	cin <= '0';
	wait for period;
	LEDR_XOR <= a XOR b;
	wait for period;
	assert ((s = "0000") and (cout = '0') and (LEDR_XOR = "0000"));
	report "test failed for a = 0000, b = 0000" severity error;
	
	a <= "0011";
	b <= "1100";
	wait for period;
	LEDR_XOR <= a XOR b;
	wait for period;
	assert ((s = "1111") and (cout = '0') and (LEDR_XOR = "1111"));
	report "test failed for a = 0011, b = 1100" severity error;
	
	
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END week1_2_arch;
