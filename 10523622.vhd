----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/05/2019 08:20:24 PM
-- Design Name:
-- Module Name: project_reti_logiche - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity project_reti_logiche is
port (
      i_clk         : in  std_logic; --i_clk è il segnale di CLOCK in ingresso generato dal TestBench
      i_start       : in  std_logic; --i_start è il segnale di START generato dal Test Bench
      i_rst         : in  std_logic; --i_rst è il segnale di RESET che inizializza la macchina pronta per ricevere il primo segnale di START
      i_data        : in  std_logic_vector(7 downto 0); --i_data è il segnale (vettore) che arriva dalla memoria in seguito ad una richiesta di lettura;
      o_address     : out std_logic_vector(15 downto 0) := "0000000000000000"; --o_address è il segnale (vettore) di uscita che manda l'indirizzo alla memoria
      o_done        : out std_logic := '0'; --o_done è il segnale di uscita che comunica la fine dell'elaborazione e il dato di uscita scritto in memoria
      o_en          : out std_logic := '0'; --o_en è il segnale di ENABLE da dover mandare alla memoria per poter comunicare (sia in lettura che in scrittura)
      o_we          : out std_logic := '0'; --o_we è il segnale di WRITE ENABLE da dover mandare alla memoria (=1) per poter scriverci. Per leggere da memoria esso deve essere 0
      o_data        : out std_logic_vector (7 downto 0) := "00000000" --o_data è il segnale (vettore) di uscita dal componente verso la memoria
      );
end project_reti_logiche;

architecture  progetto of project_reti_logiche is

signal maschera_entrata : std_logic_vector(7 downto 0) := "00000000" ;
signal maschera_uscita : std_logic_vector(7 downto 0) := "00000000" ;

signal coordinata_x_centroide_1 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_x_centroide_2 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_x_centroide_3 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_x_centroide_4 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_x_centroide_5 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_x_centroide_6 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_x_centroide_7 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_x_centroide_8 : std_logic_vector(7 downto 0) := "00000000" ;

signal coordinata_y_centroide_1 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_centroide_2 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_centroide_3 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_centroide_4 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_centroide_5 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_centroide_6 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_centroide_7 : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_centroide_8 : std_logic_vector(7 downto 0) := "00000000" ;

signal and_centroide_1 : std_logic_vector(7 downto 0) := "00000000" ;
signal and_centroide_2 : std_logic_vector(7 downto 0) := "00000000" ;
signal and_centroide_3 : std_logic_vector(7 downto 0) := "00000000" ;
signal and_centroide_4 : std_logic_vector(7 downto 0) := "00000000" ;
signal and_centroide_5 : std_logic_vector(7 downto 0) := "00000000" ;
signal and_centroide_6 : std_logic_vector(7 downto 0) := "00000000" ;
signal and_centroide_7 : std_logic_vector(7 downto 0) := "00000000" ;
signal and_centroide_8 : std_logic_vector(7 downto 0) := "00000000" ;

signal distanza_1: integer := 0;
signal distanza_2: integer := 0;
signal distanza_3: integer := 0;
signal distanza_4: integer := 0;
signal distanza_5: integer := 0;
signal distanza_6: integer := 0;
signal distanza_7: integer := 0;
signal distanza_8: integer := 0;

signal distanza_minima: integer := 9999;


signal coordinata_x_punto : std_logic_vector(7 downto 0) := "00000000" ;
signal coordinata_y_punto : std_logic_vector(7 downto 0) := "00000000" ;

type state_type is (SR, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21,
                        s22, s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33, s34, s35, s36, s37, s38, s39, s40, s41,
                            s42, s43, s44, s45, s46,
                                w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22);

signal CURRENT_STATE: state_type := SR;

begin

    process (i_clk, i_rst, i_start) begin
          if rising_edge(i_clk) then
            if (i_rst = '1') then
                CURRENT_STATE <= SR;
            end if;
            if (i_start = '1') then
                    o_en <= '1';
                   CURRENT_STATE <= s0;
            end if;





        case CURRENT_STATE is

            when SR =>


            when s0 => --prepara per leggere maschera entrata
                        o_en <= '1';
                        CURRENT_STATE <= s1;

            when s1 => --leggi maschera entrata e prepara per leggere x centroide 1
                        o_en <= '1';
                        maschera_entrata <= i_data;
                        o_address <= "0000000000000001";
                        CURRENT_STATE <= w1;

             when w1 => --aspetta CLOCK
                        CURRENT_STATE <= s2;

             when s2 =>  --leggi x centroide 1 e prepara per leggere y centroide 1
                        o_en <= '1';
                        coordinata_x_centroide_1 <= i_data;
                        o_address <= "0000000000000010";
                        CURRENT_STATE <= w2;

             when w2 => --aspetta CLOCK
                        CURRENT_STATE <= s3;

             when s3 =>  --leggi y centroide 1 e prepara per leggere x centroide 2
                        o_en <= '1';
                        coordinata_y_centroide_1 <= i_data;
                        o_address <= "0000000000000011";
                        CURRENT_STATE <= w3;

             when w3 =>
                        CURRENT_STATE <= s4;

             when s4 =>
                        o_en <= '1';
                        coordinata_x_centroide_2 <= i_data;
                        o_address <= "0000000000000100";
                        CURRENT_STATE <= w4;

             when w4 =>
                        CURRENT_STATE <= s5;

             when s5 =>
                        o_en <= '1';
                        coordinata_y_centroide_2 <= i_data;
                        o_address <= "0000000000000101";
                        CURRENT_STATE <= w5;

             when w5 =>
                        CURRENT_STATE <= s6;

             when s6 =>
                        o_en <= '1';
                        coordinata_x_centroide_3 <= i_data;
                        o_address <= "0000000000000110";
                        CURRENT_STATE <= w6;

             when w6 =>
                        CURRENT_STATE <= s7;

             when s7 =>
                        o_en <= '1';
                        coordinata_y_centroide_3 <= i_data;
                        o_address <= "0000000000000111";
                        CURRENT_STATE <= w7;

             when w7 =>
                        CURRENT_STATE <= s8;

             when s8 =>
                        o_en <= '1';
                        coordinata_x_centroide_4 <= i_data;
                        o_address <= "0000000000001000";
                             CURRENT_STATE <= w8;

             when w8 =>
                        CURRENT_STATE <= s9;

             when s9 =>
                        o_en <= '1';
                        coordinata_y_centroide_4 <= i_data;
                        o_address <= "0000000000001001";
                        CURRENT_STATE <= w9;

             when w9 =>
                        CURRENT_STATE <= s10;

             when s10 =>
                        o_en <= '1';
                        coordinata_x_centroide_5 <= i_data;
                        o_address <= "0000000000001010";
                        CURRENT_STATE <= w10;

             when w10 =>
                        CURRENT_STATE <= s11;

             when s11 =>
                        o_en <= '1';
                        coordinata_y_centroide_5 <= i_data;
                        o_address <= "0000000000001011";
                        CURRENT_STATE <= w11;

             when w11 =>
                        CURRENT_STATE <= s12;

             when s12 =>
                        o_en <= '1';
                        coordinata_x_centroide_6 <= i_data;
                        o_address <= "0000000000001100";
                        CURRENT_STATE <= w12;

             when w12 =>
                        CURRENT_STATE <= s13;

             when s13 =>
                        o_en <= '1';
                        coordinata_y_centroide_6 <= i_data;
                        o_address <= "0000000000001101";
                        CURRENT_STATE <= w13;

             when w13 =>
                        CURRENT_STATE <= s14;

             when s14 =>
                        o_en <= '1';
                        coordinata_x_centroide_7 <= i_data;
                        o_address <= "0000000000001110";
                        CURRENT_STATE <= w14;

             when w14 =>
                        CURRENT_STATE <= s15;

             when s15 =>
                        o_en <= '1';
                        coordinata_y_centroide_7 <= i_data;
                        o_address <= "0000000000001111";
                        CURRENT_STATE <= w15;

             when w15 =>
                        CURRENT_STATE <= s16;

             when s16 =>
                        o_en <= '1';
                        coordinata_x_centroide_8 <= i_data;
                        o_address <= "0000000000010000";
                        CURRENT_STATE <= w16;

             when w16 =>
                        CURRENT_STATE <= s17;

             when s17 =>
                        o_en <= '1';
                        coordinata_y_centroide_8 <= i_data;
                        o_address <= "0000000000010001";
                        CURRENT_STATE <= w17;

             when w17 =>
                        CURRENT_STATE <= s18;

             when s18 =>
                          o_en <= '1';
                          coordinata_x_punto <= i_data;
                          o_address <= "0000000000010010";
                          CURRENT_STATE <= w18;

             when w18 =>
                        CURRENT_STATE <= s19;

             when s19 =>
                        coordinata_y_punto <= i_data;
                        CURRENT_STATE <= w19;

             when w19 =>
                        CURRENT_STATE <= s20;






             when s20 => --confronti and: vedo quali sono i bit validi della maschera di entrata per capire i centroidi validi
                    and_centroide_1 <= maschera_entrata and "00000001";
                    CURRENT_STATE <= s21;
             when s21 =>
                    and_centroide_2 <= maschera_entrata and "00000010";
                    CURRENT_STATE <= s22;
             when s22 =>
                    and_centroide_3 <= maschera_entrata and "00000100";
                    CURRENT_STATE <= s23;
             when s23 =>
                    and_centroide_4 <= maschera_entrata and "00001000";
                    CURRENT_STATE <= s24;
             when s24 =>
                    and_centroide_5 <= maschera_entrata and "00010000";
                    CURRENT_STATE <= s25;
             when s25 =>
                    and_centroide_6 <= maschera_entrata and "00100000";
                    CURRENT_STATE <= s26;
             when s26 =>
                    and_centroide_7 <= maschera_entrata and "01000000";
                    CURRENT_STATE <= s27;
             when s27 =>
                    and_centroide_8 <= maschera_entrata and "10000000";
                    CURRENT_STATE <= s28;





               when s28 => --calcolo distanze: se il centroide è valido calcolo la sua distanza dal punto specifico
                     if (and_centroide_1 /= "00000000") then
                        distanza_1 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_1)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_1)));
                     end if;
                     CURRENT_STATE <= s29;
               when s29 =>
                     if (and_centroide_2 /= "00000000") then
                        distanza_2 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_2)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_2)));
                     end if;
                     CURRENT_STATE <= s30;
               when s30 =>
                     if (and_centroide_3 /= "00000000") then
                        distanza_3 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_3)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_3)));
                     end if;
                     CURRENT_STATE <= s31;
               when s31 =>
                     if (and_centroide_4 /= "00000000") then
                        distanza_4 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_4)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_4)));
                     end if;
                     CURRENT_STATE <= s32;
                when s32 =>
                     if (and_centroide_5 /= "00000000") then
                        distanza_5 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_5)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_5)));
                     end if;
                     CURRENT_STATE <= s33;
                when s33 =>
                     if (and_centroide_6 /= "00000000") then
                        distanza_6 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_6)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_6)));
                     end if;
                     CURRENT_STATE <= s34;
                when s34 =>
                     if (and_centroide_7 /= "00000000") then
                        distanza_7 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_7)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_7)));
                     end if;
                     CURRENT_STATE <= s35;
                when s35 =>
                     if (and_centroide_8 /= "00000000") then
                        distanza_8 <= abs(to_integer(unsigned(coordinata_x_punto)) - to_integer(unsigned(coordinata_x_centroide_8)))+abs(to_integer(unsigned(coordinata_y_punto)) - to_integer(unsigned(coordinata_y_centroide_8)));
                     end if;
                     CURRENT_STATE <= s36;





                when s36 => --calcolo maschera uscita: pongo il primo a distanza minima e inizializzo la distanza minima, poi vedo se ne esiste uno più vicino. In questo considero sempre e solo i centoridi validi trovati con il confronto and
                        if (and_centroide_1 /= "00000000") then
                            distanza_minima <= distanza_1;
                            maschera_uscita <= "00000001";
                        end if;
                        CURRENT_STATE <= s37;

                when s37 =>
                        if (and_centroide_2 /= "00000000") then
                            if (distanza_minima = 9999) then --caso in cui il primo centoride non era valido e quindi non aveva ancora cambiato il valore della distanza
                                distanza_minima <= distanza_2;
                                maschera_uscita <= "00000010";
                            else
                                if (distanza_2 < distanza_minima) then --caso in cui il secondo centroide è più vicino al punto del primo
                                    maschera_uscita <= "00000010";
                                    distanza_minima <= distanza_2;
                                elsif (distanza_2 = distanza_minima) then --caso in cui il primo e il secondo sono a distanza uguale minima
                                    maschera_uscita(1) <= '1';
                                end if;
                            end if;
                        end if;
                        CURRENT_STATE <= s38;

                when s38 =>
                       if (and_centroide_3 /= "00000000") then
                            if (distanza_minima = 9999) then
                                distanza_minima <= distanza_3;
                                maschera_uscita <= "00000100";
                            else
                                if (distanza_3 < distanza_minima) then
                                    maschera_uscita <= "00000100";
                                    distanza_minima <= distanza_3;
                                elsif (distanza_3 = distanza_minima) then
                                     maschera_uscita(2) <= '1';
                                end if;
                            end if;
                        end if;
                        CURRENT_STATE <= s39;

                when s39 =>
                         if (and_centroide_4 /= "00000000") then
                            if (distanza_minima = 9999) then
                                distanza_minima <= distanza_4;
                                maschera_uscita <= "00001000";
                            else
                                if (distanza_4 < distanza_minima) then
                                    maschera_uscita <= "00001000";
                                    distanza_minima <= distanza_4;
                                elsif (distanza_4 = distanza_minima) then
                                     maschera_uscita(3) <= '1';
                                end if;
                            end if;
                        end if;
                        CURRENT_STATE <= s40;

               when s40 =>
                         if (and_centroide_5 /= "00000000") then
                            if (distanza_minima = 9999) then
                                distanza_minima <= distanza_5;
                                maschera_uscita <= "00010000";
                            else
                                if (distanza_5 < distanza_minima) then
                                    maschera_uscita <= "00010000";
                                    distanza_minima <= distanza_5;
                                elsif (distanza_5 = distanza_minima) then
                                     maschera_uscita(4) <= '1';
                                end if;
                            end if;
                        end if;
                        CURRENT_STATE <= s41;

                 when s41 =>
                         if (and_centroide_6 /= "00000000") then
                            if (distanza_minima = 9999) then
                                distanza_minima <= distanza_6;
                                maschera_uscita <= "00100000";
                            else
                                if (distanza_6 < distanza_minima) then
                                    maschera_uscita <= "00100000";
                                    distanza_minima <= distanza_6;
                                elsif (distanza_6 = distanza_minima) then
                                     maschera_uscita(5) <= '1';
                                end if;
                            end if;
                        end if;
                        CURRENT_STATE <= s42;

                 when s42 =>
                         if (and_centroide_7 /= "00000000") then
                            if (distanza_minima = 9999) then
                                distanza_minima <= distanza_7;
                                maschera_uscita <= "01000000";
                            else
                                if (distanza_7 < distanza_minima) then
                                    maschera_uscita <= "01000000";
                                    distanza_minima <= distanza_7;
                                elsif (distanza_7 = distanza_minima) then
                                     maschera_uscita(6) <= '1';
                                end if;
                            end if;
                        end if;
                        CURRENT_STATE <= s43;

                  when s43 =>
                         if (and_centroide_8 /= "00000000") then
                            if (distanza_minima = 9999) then
                                distanza_minima <= distanza_8;
                                maschera_uscita <= "10000000";
                            else
                                if (distanza_8 < distanza_minima) then
                                    maschera_uscita <= "10000000";
                                    distanza_minima <= distanza_8;
                                elsif (distanza_8 = distanza_minima) then
                                     maschera_uscita(7) <= '1';
                                end if;
                            end if;
                        end if;
                        CURRENT_STATE <= s44;





            when s44 => --scrivo maschera_uscita su o_data per scriverla poi in memoria
                        o_we <= '1';
                        o_data <= maschera_uscita;
                        o_address <= "0000000000010011";
                        CURRENT_STATE <= w20;

            when w20 =>
                        CURRENT_STATE <= s45;

            when s45 =>
                         o_done <= '1';
                         CURRENT_STATE <= w21;

            when w21 =>
                            CURRENT_STATE <= s46;

            when s46 =>
                         o_done <= '0';
                         CURRENT_STATE <= w22;

            when w22 =>


             end case;
            end if;
          end process;

end;
