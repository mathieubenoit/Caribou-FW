
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
		
--		--IP BUS
--		Bus2IP_Addr         : in std_logic_vector(31 downto 0);
--		Bus2IP_RD           : in std_logic;
--		Bus2IP_WR           : in std_logic;
--		Bus2IP_Data         : in std_logic_vector(31 downto 0);
--		IP2Bus_Data         : out std_logic_vector(31 downto 0);
--		RDACK               : out std_logic;
--		WRACK               : out std_logic;
		
		CMD_FLG             : in std_logic;		
		CTRL_IN             : in std_logic_vector(31 downto 0);
		WR_BUF              : in std_logic_vector(31 downto 0);
		RD_BUF              : out std_logic_vector(31 downto 0);
				
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

---- IP BUS Signal
--signal ipbus_wr               :std_logic;
--signal ipbus_rd               :std_logic;
--signal ipbus_addr             :std_logic_vector(31 downto 0);
--signal ipbus_rdack            :std_logic;
--signal ipbus_wrack          :std_logic;
--signal ipbus_data_in    :std_logic_vector(31 downto 0);
--signal ipbus_data_out   :std_logic_vector(31 downto 0);

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
--signal reg0         :std_logic_vector(31 downto 0);
--signal reg1         :std_logic_vector(31 downto 0);
--signal reg2         :std_logic_vector(31 downto 0);
--signal reg3         :std_logic_vector(31 downto 0);
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
iic_cmd_flg     <= CMD_FLG;

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
  wr_dat_buf <= (WR_BUF(7 downto 0), WR_BUF(15 downto 8), WR_BUF(23 downto 16), WR_BUF(31 downto 24));

  case state is  
  --
  when start =>
    iic_ena <= '0';
    if iic_cmd_flg = '1' and iic_cmd_flg_pre = '0' then
       
       cnt <= conv_integer(CTRL_IN(9 downto 8));
       cmd_cnt <= conv_integer(CTRL_IN(9 downto 8));     
       iic_addr        <= CTRL_IN(6 downto 0);
       iic_rw          <= CTRL_IN(7);
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

RD_BUF(31 downto 24) <= rd_dat_buf(3);
RD_BUF(23 downto 16) <= rd_dat_buf(2);
RD_BUF(15 downto  8) <= rd_dat_buf(1);
RD_BUF(7  downto  0) <= rd_dat_buf(0);

end Behavioral;
