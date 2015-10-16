
library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity iic_controller is
      generic (
        BASE_ADDR: std_logic_vector(31 downto 0) := x"43c00100"
        );
        port ( 
	    RST    : in std_logic;
		SYSCLK : in std_logic;
		
		--IP BUS
		Bus2IP_Addr         : in std_logic_vector(31 downto 0);
		Bus2IP_RD           : in std_logic;
		Bus2IP_WR           : in std_logic;
		Bus2IP_Data         : in std_logic_vector(31 downto 0);
		IP2Bus_Data         : out std_logic_vector(31 downto 0);
		RDACK               : out std_logic;
		WRACK               : out std_logic;
		
		--IIC IO
		SCL                 : inout std_logic;
		SDA                 : inout std_logic
  		);		  
end iic_controller;
  

architecture Behavioral of iic_controller is

COMPONENT i2c_master IS
  GENERIC(
    input_clk : INTEGER := 50_000_000; --input clock speed from user logic in Hz
    bus_clk   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz
  PORT(
    clk       : IN     STD_LOGIC;                    --system clock
    reset_n   : IN     STD_LOGIC;                    --active low reset
    ena       : IN     STD_LOGIC;                    --latch in command
    addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
    rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
    data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
    busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
    data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
    ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
    sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
    scl       : INOUT  STD_LOGIC);                   --serial clock output of i2c bus
END COMPONENT;

-- IP BUS Signal
signal ipbus_wr               :std_logic;
signal ipbus_rd               :std_logic;
signal ipbus_addr             :std_logic_vector(31 downto 0);
signal ipbus_rdack            :std_logic;
signal ipbus_wrack          :std_logic;
signal ipbus_data_in    :std_logic_vector(31 downto 0);
signal ipbus_data_out   :std_logic_vector(31 downto 0);

signal iic_ena      :std_logic;
signal iic_addr     :std_logic_vector(6 downto 0);
signal iic_rw       :std_logic;
signal iic_data_wr  :std_logic_vector(7 downto 0);
signal iic_busy     :std_logic;
signal iic_busy_pre :std_logic;
signal iic_data_rd  :std_logic_vector(7 downto 0);
signal iic_scl      :std_logic;
signal iic_sda      :std_logic;

signal iic_cmd_flg  :std_logic;
signal iic_cmd_flg_pre :std_logic;
signal reg0         :std_logic_vector(31 downto 0);
signal reg1         :std_logic_vector(31 downto 0);
signal reg2         :std_logic_vector(31 downto 0);
signal reg3         :std_logic_vector(31 downto 0);
TYPE iic_enable IS(start, enable, busy, finish); --needed states
SIGNAL state         : iic_enable;  
signal cmd_cnt     :integer range 0 to 3:= 0;
signal cnt         :integer range 0 to 3:= 0;
type dat_buf is array(0 to 3) of std_logic_vector(7 downto 0);
signal wr_dat_buf :dat_buf := (others => (others => '0'));
signal rd_dat_buf :dat_buf := (others => (others => '0'));

--attribute MARK_DEBUG : string;
--attribute MARK_DEBUG of reg0,reg1,reg2,rd_dat_buf : signal is "TRUE";

begin
-- REG assignment
iic_cmd_flg     <= reg0(0);

process(SYSCLK, RST)
begin
if RST = '1' then
  state <= start;
  iic_ena <= '0';
  iic_addr <= (others => '0');
  iic_rw  <= '0';
  cnt <= 0;
  cmd_cnt <= 0;
  iic_cmd_flg_pre <= '0';
  iic_busy_pre <= '0';
  wr_dat_buf <= (others => (others => '0'));
  rd_dat_buf <= (others => (others => '0'));
  
elsif rising_edge(SYSCLK) then

  iic_cmd_flg_pre <= iic_cmd_flg;
  iic_busy_pre <= iic_busy;
  wr_dat_buf <= (reg2(7 downto 0), reg2(15 downto 8), reg2(23 downto 16), reg2(31 downto 24));

  case state is  
  --
  when start =>
    iic_ena <= '0';
    if iic_cmd_flg = '1' and iic_cmd_flg_pre = '0' then
       
       cnt <= conv_integer(reg1(9 downto 8));
       cmd_cnt <= conv_integer(reg1(9 downto 8));     
       iic_addr        <= reg1(6 downto 0);
       iic_rw          <= reg1(7);
       iic_data_wr <= wr_dat_buf(0);
       rd_dat_buf <= (others => (others => '0'));
       state <= enable;
    end if; 
  
  when enable =>
    iic_ena <= '1';
    if iic_busy_pre = '0' and iic_busy = '1' then
        if cnt = 0 then
           state <= finish;
        else
           cnt <= cnt -1;          
           state <= busy;
           iic_data_wr <= wr_dat_buf(cmd_cnt - cnt + 1);
        end if;
    end if;
     
  when busy =>
    if iic_busy_pre = '1' and iic_busy = '0' then
      state <= enable;
      if iic_rw = '1' then
        rd_dat_buf(cnt + 1) <= iic_data_rd;
      end if;
    end if;    
     
  when finish =>
    iic_ena <= '0';
    if iic_busy_pre = '1' and iic_busy = '0' then     
        if iic_rw = '1' then
            rd_dat_buf(0) <= iic_data_rd;
        end if;
        state <= start;
    end if;    
      
  --
  when others =>
    null;
  end case;
end if;
end process;

     
iic_master_test:i2c_master
 GENERIC MAP(
   input_clk => 100_000_000,
   bus_clk   => 100_000
   )
 PORT MAP(
   clk       => SYSCLK,
   reset_n   => not RST,
   ena       => iic_ena,
   addr      => iic_addr,
   rw        => iic_rw,
   data_wr   => iic_data_wr,
   busy      => iic_busy,
   data_rd   => iic_data_rd, 
   ack_error => open,
   sda       => iic_sda,
   scl       => iic_scl
 );
SCL <= iic_scl;
SDA <= iic_sda;

----------------------------------IP BUS------------------------------------------------------
ipbus_wr      <= Bus2IP_WR;
ipbus_rd      <= Bus2IP_RD;
ipbus_addr    <= Bus2IP_Addr;
ipbus_data_in <= Bus2IP_Data;

process(SYSCLK,RST)
begin
		if (RST = '1') then
        ipbus_rdack <= '0';
        ipbus_wrack <= '0'; 
		else
			if rising_edge(SYSCLK) then
				if  (ipbus_addr(31 downto 8) = BASE_ADDR(31 downto 8)) then
					case ipbus_addr(7 downto 0) is
						--ADC DCLK frequency readout
                        when x"00" =>   if (ipbus_wr = '1') then 
                                            reg0 <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                            ipbus_data_out <= reg0;
                                        end if; 
                        when x"04" =>   if (ipbus_wr = '1') then 
                                            reg1 <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                            ipbus_data_out <= reg1;
                                        end if;    
                        when x"08" =>   if (ipbus_wr = '1') then 
                                          reg2 <= ipbus_data_in;
                                        elsif (ipbus_rd = '1') then
                                          ipbus_data_out <= reg2;
                                        end if;     
                                                                                                    						
                        when x"0C" =>   if (ipbus_rd = '1') then 
                                            ipbus_data_out(31 downto 24) <= rd_dat_buf(3);
                                            ipbus_data_out(23 downto 16) <= rd_dat_buf(2);
                                            ipbus_data_out(15 downto  8) <= rd_dat_buf(1);
                                            ipbus_data_out(7  downto  0) <= rd_dat_buf(0);
                                        else
                                           ipbus_data_out <= (others => '0');
                                        end if;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              											
						when others =>
										  ipbus_data_out(31 downto 0) <= (others => '0');
				   end case;
				   
				   --read acknowlege generation
				   if(ipbus_rd = '1') then 
				     ipbus_rdack <= '1'; 
				   else 
				     ipbus_rdack <= '0';
				   end if;
				   
                   --write acknowlege generation
				   if(ipbus_wr = '1') then 
				     ipbus_wrack <= '1'; 
				   else 
				     ipbus_wrack <= '0'; 
				   end if;	
				  			  		   				   
				end if;
			end if;
		end if;
end process;	


select_output:process(ipbus_addr)
begin
    if  (ipbus_addr(31 downto 8) = BASE_ADDR(31 downto 8)) then 
    IP2Bus_Data <= ipbus_data_out;
    else
    IP2Bus_Data <= (others => 'Z');
    end if;
end process;	

process(SYSCLK)
begin
  if rising_edge(SYSCLK) then
    if  (ipbus_addr(31 downto 8) = BASE_ADDR(31 downto 8)) then 
      RDACK <= ipbus_rdack;
      WRACK <= ipbus_wrack;
    else
      RDACK <= 'Z';
      WRACK <= 'Z';
   end if;
 end if;
end process;


end Behavioral;
