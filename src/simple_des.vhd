library IEEE;
use IEEE.std_logic_1164.all;

entity rf_expand is
    port(
        INDB : in STD_LOGIC_VECTOR(3 downto 0);
        OUDB : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture rf_expand_arch of rf_expand is
    begin 
    -- E([3 2 1 0]) = [0 3 2 1 2 1 0 3]
    OUDB(7) <= INDB(0);
    OUDB(6) <= INDB(3);
    OUDB(5) <= INDB(2);
    OUDB(4) <= INDB(1);
    OUDB(3) <= INDB(2);
    OUDB(2) <= INDB(1);
    OUDB(1) <= INDB(0);
    OUDB(0) <= INDB(3);
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity rf_xor_8 is
    port(
        IDB1 : in STD_LOGIC_VECTOR(7 downto 0);
        IDB2 : in STD_LOGIC_VECTOR(7 downto 0);
        OUDB : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture rf_xor_8_arch of rf_xor_8 is
begin 
    OUDB <= IDB1 xor IDB2;
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity rotate2 is
    port(
        IDB : in STD_LOGIC_VECTOR(4 downto 0);
        ODB : out STD_LOGIC_VECTOR(4 downto 0)
    );
end entity;

architecture rotate2_arch of rotate2 is
    begin 
    -- ROT2([4 3 2 1 0]) = [2 1 0 4 3]
    ODB <= IDB(2 downto 0) & IDB(4 downto 3);
end architecture;			

library IEEE;
use IEEE.std_logic_1164.all;

entity xor_4 is
    port(
        IDB1 : in STD_LOGIC_VECTOR(3 downto 0);
        IDB2 : in STD_LOGIC_VECTOR(3 downto 0);
        OUDB : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;

architecture xor_4_arch of xor_4 is
begin 
    OUDB <= IDB1 xor IDB2;
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity rotate1 is
    port(
        IDB : in STD_LOGIC_VECTOR(4 downto 0);
        ODB : out STD_LOGIC_VECTOR(4 downto 0)
    );
end entity;

architecture rotate1_arch of rotate1 is
    begin 
    -- ROT1([4 3 2 1 0]) = [3 2 1 0 4]
    ODB <= IDB(3 downto 0) & IDB(4);
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity rf_subst_1 is
    port(
        INDB : in STD_LOGIC_VECTOR(3 downto 0);
        OUDB : out STD_LOGIC_VECTOR(1 downto 0)
    );
end entity;

architecture rf_subst_1_arch of rf_subst_1 is
begin 
    -- S1([3 2 1 0]) = [1 0] by special table
    OUDB <= "00" when INDB = "0010" or INDB = "0111" or INDB = "1000" else
            "01" when INDB = "0000" or INDB = "0101" or INDB = "1011" or INDB = "1100" else
            "10" when INDB = "0011" or INDB = "0110" or INDB = "1010" or INDB = "1111" else
            "11"; -- when 0001 or 0100 or 1001 or 1101 or 1110
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity rf_subst_2 is
    port(
        INDB : in STD_LOGIC_VECTOR(3 downto 0);
        OUDB : out STD_LOGIC_VECTOR(1 downto 0)
    );
end entity;

architecture rf_subst_2_arch of rf_subst_2 is
begin 
    -- S2([3 2 1 0]) = [1 0] by special table
    OUDB <= "00" when INDB = "0000" or INDB = "0011" or INDB = "1010" or INDB = "1101" or INDB = "1110" else
            "01" when INDB = "0010" or INDB = "0101" or INDB = "1011" or INDB = "1100" else
            "10" when INDB = "0001" or INDB = "0100" or INDB = "1001" else
            "11"; -- when 0110 or 0111 or 1000 or 1111 
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity rf_permute is
    port(
        INDB : in STD_LOGIC_VECTOR(3 downto 0);
        OUDB : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;

architecture rf_permute_arch of rf_permute is
    begin 
    -- P([3 2 1 0]) = [2 0 1 3]
    OUDB(3) <= INDB(2);
    OUDB(2) <= INDB(0);
    OUDB(1) <= INDB(1);
    OUDB(0) <= INDB(3);
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity key_mux is
    port(
        IN1 : in STD_LOGIC_VECTOR(7 downto 0);
        IN2 : in STD_LOGIC_VECTOR(7 downto 0);
        MODE : in STD_LOGIC;
        SEL : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture key_mux_arch of key_mux is
    begin 
    -- bus mux
    SEL <= IN1 when MODE = '0' else IN2;
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity perm_choice1 is
    port(
        KEYIN : in STD_LOGIC_VECTOR(9 downto 0);
        KEYST : out STD_LOGIC_VECTOR(9 downto 0)
    );
end entity;

architecture perm_choice1_arch of perm_choice1 is
    begin 
    -- PC1([9 8 7 6 5 4 3 2 1 0]) = [7 5 8 3 6 0 9 1 2 4]
    KEYST(9) <= KEYIN(7);
    KEYST(8) <= KEYIN(5);
    KEYST(7) <= KEYIN(8);
    KEYST(6) <= KEYIN(3);
    KEYST(5) <= KEYIN(6);
    KEYST(4) <= KEYIN(0);
    KEYST(3) <= KEYIN(9);
    KEYST(2) <= KEYIN(1);
    KEYST(1) <= KEYIN(2);
    KEYST(0) <= KEYIN(4);
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity perm_choice2 is
    port(
        KSIN : in STD_LOGIC_VECTOR(9 downto 0);
        RKEY : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture perm_choice2_arch of perm_choice2 is
    begin 
    -- PC2([9 8 7 6 5 4 3 2 1 0]) = [4 7 3 6 2 5 0 1]
    RKEY(7) <= KSIN(4);
    RKEY(6) <= KSIN(7);
    RKEY(5) <= KSIN(3);
    RKEY(4) <= KSIN(6);
    RKEY(3) <= KSIN(2);
    RKEY(2) <= KSIN(5);
    RKEY(1) <= KSIN(0);
    RKEY(0) <= KSIN(1);
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity init_perm is
    port(
        INDB : in STD_LOGIC_VECTOR(7 downto 0);
        OUDB : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture init_perm_arch of init_perm is
    begin 
    -- by description:
    -- X[1 2 3 4 5 6 7 8]
    -- IP(X) = [ X[2] X[6] X[3] X[1] X[4] X[8] X[5] X[7] ]
    -- by hardware notation:
    -- IP_INV([7 6 5 4 3 2 1 0]) = [6 2 5 7 4 0 3 1]
    OUDB(7) <= INDB(6);
    OUDB(6) <= INDB(2);
    OUDB(5) <= INDB(5);
    OUDB(4) <= INDB(7);
    OUDB(3) <= INDB(4);
    OUDB(2) <= INDB(0);
    OUDB(1) <= INDB(3);
    OUDB(0) <= INDB(1);
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity init_perm_inv is
    port(
        INDB : in STD_LOGIC_VECTOR(7 downto 0);
        OUDB : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity;

architecture init_perm_inv_arch of init_perm_inv is
    begin 
    -- by description:
    -- X[1 2 3 4 5 6 7 8]
    -- IP_inv(X) = [ X[4] X[1] X[3] X[5] X[7] X[2] X[8] X[6] ]
    -- by hardware notation:
    -- IP_INV([7 6 5 4 3 2 1 0]) = [4 7 5 3 1 6 0 2]
    OUDB(7) <= INDB(4);
    OUDB(6) <= INDB(7);
    OUDB(5) <= INDB(5);
    OUDB(4) <= INDB(3);
    OUDB(3) <= INDB(1);
    OUDB(2) <= INDB(6);
    OUDB(1) <= INDB(0);
    OUDB(0) <= INDB(2);
end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity round_func is
    port(
        INDB : in STD_LOGIC_VECTOR(3 downto 0);
        INRK : in STD_LOGIC_VECTOR(7 downto 0);
        OUDB : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;

architecture round_func_arch of round_func is
    signal db_expanded : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal rf_state1 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal rf_state2 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin 

    rf_exp: entity work.rf_expand(rf_expand_arch)
    port map (
        INDB => INDB,
        OUDB => db_expanded
    );
    
    rf_xor_with_rk: entity work.rf_xor_8(rf_xor_8_arch)
    port map (
        IDB1 => db_expanded,
        IDB2 => INRK,
        OUDB => rf_state1
    );

    rf_s1: entity work.rf_subst_1(rf_subst_1_arch)
    port map (
        INDB => rf_state1(7 downto 4),
        OUDB => rf_state2(3 downto 2)
    );

    rf_s2: entity work.rf_subst_2(rf_subst_2_arch)
    port map (
        INDB => rf_state1(3 downto 0),
        OUDB => rf_state2(1 downto 0)
    );

    rf_perm: entity work.rf_permute(rf_permute_arch)
    port map (
        INDB => rf_state2,
        OUDB => OUDB
    );

end architecture;

library IEEE;
use IEEE.std_logic_1164.all;

entity simple_des_full_tb is
end entity;

architecture simple_des_full_tb_arch of simple_des_full_tb is
    signal input_msg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal cipher_key : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal cipher_mode : STD_LOGIC := '0';
	signal output_msg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal enc_res : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal dec_res : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin 

    UUT: entity work.simple_des_full(simple_des_full)
    port map (
		input_msg => input_msg,
		cipher_key => cipher_key,
        cipher_mode => cipher_mode,
		output_msg => output_msg
    );
    
    stim_gen: process
	begin
		-- test 1 - part 1: encrypt
		input_msg <= "11101010"; --EA
		cipher_key <= "0010111110";	--0BE
		cipher_mode <= '0'; -- encrypt
		wait for 10 ns;
		assert output_msg = "10011101" report "Test 1: Enc Open Text do not match!" severity ERROR;
		
		-- test 1 - part 2: decrypt
		input_msg <= "10010001"; --91
		cipher_key <= "0010111110";	--0BE
		cipher_mode <= '1'; -- decrypt
		wait for 10 ns;
		assert output_msg = "00110101" report "Test 1: Dec Close Text do not match!" severity ERROR;
		
		-- test 2 - part 1: encrypt
		input_msg <= "11011001"; --D9
		cipher_key <= "0001110000";	--070
		cipher_mode <= '0'; -- encrypt
		wait for 10 ns;
		assert output_msg = "00010101" report "Test 2: Enc Open Text do not match!" severity ERROR;
		
		-- test 2 - part 2: decrypt
		input_msg <= "11101111"; --EF
		cipher_key <= "0001110000";	--070
		cipher_mode <= '1'; -- decrypt
		wait for 10 ns;
		assert output_msg = "01111111" report "Test 2: Dec Close Text do not match!" severity ERROR;
		
	end process;

end architecture;