module MyDatapath(
    input clk
);

wire [31:0] add_result_1;
wire [31:0] add_result_2;
wire [31:0] add_result_3;
wire [31:0] instruction;
wire [31:0] instruction_2;
wire [25:0] instruction_3;
wire [4:0] instruction_4;
wire [4:0] instruction_5;
wire [31:0] data_read1;
wire [31:0] data_read2;
wire [31:0] data_read1_B;
wire [31:0] data_read2_B;
wire [31:0] data_read2_C;
wire [31:0] Mux_ALU_in2;
wire [31:0] Mux_ALU_in2_B;
wire Jump;
wire Jump_2;
wire Jump_3;
wire Jump_4;
wire [31:0] Add_In2_MuxPC;
wire [31:0] Add_In2_MuxPC_2;
wire tr_zf;
wire tr_zf_2;
wire [31:0] alu_result;
wire [31:0] alu_result_2;
wire [31:0] alu_result_3;
wire [4:0] Dir_Wri_BR;
wire [4:0] Dir_Wri_BR_2;
wire [4:0] Dir_Wri_BR_3;
wire [31:0] data_mem;
wire [31:0] data_mem_2;
wire [27:0]JAddress;
wire [31:0]JAddress_2;
wire [31:0]JAddress_3;
wire RegDst;
wire ALU_Src;
wire [2:0] control_aluop;
wire RegDst_2;
wire ALU_Src_2;
wire [2:0] control_aluop_2;
wire Branch;
wire control_memwrite;
wire control_memread;
wire Branch_2;
wire control_memwrite_2;
wire control_memread_2;
wire [2:0] M;
wire control_memreg;
wire control_regwrite;
wire control_memreg_2;
wire control_regwrite_2;
wire [1:0]WB;
wire [1:0]WB_2;
wire [31:0] data_write;

wire [3:0] control_alusel;
wire [31:0] address_result;
wire [31:0] Oper_2;
wire [31:0] pc_out;
wire [31:0] SL2_adder;
wire [31:0] MuxPC_PCin;
wire [31:0] MPC_MJ; 


MyPC _PC(.clk(clk),.in(MuxPC_PCin),.out(pc_out));
MyADD_4 _ADD(.operand(pc_out),.result(add_result_1));
MyIMem _IM(.address(pc_out),.data(instruction_2));
MyBR _BR(.clk(clk), .address_reg1(instruction[25:21]), .address_reg2(instruction[20:16]), .address_write(Dir_Wri_BR_3), .data_write(data_write), .enable(control_regwrite_2), .data_read1(data_read1), .data_read2(data_read2));
MyControlUnit _ControlUnit(.opcode(instruction[31:26]), .reg_Dst(RegDst), .branch(Branch), .memory_read(control_memread), .memory_register(control_memreg), .alu_operation(control_aluop), .memory_write(control_memwrite), .ALU_Src(ALU_Src), .reg_write(control_regwrite), .jump(Jump));
MyALUControl _ALUControl(.alu_operation(control_aluop_2), .function_code(Mux_ALU_in2[5:0]), .alu_select(control_alusel));
MyALU _ALU(.operand1(data_read1_B), .operand2(Oper_2), .alu_select(control_alusel), .zero_flag(tr_zf) ,.result(alu_result));
MyMem _Mem(.address(alu_result_2), .data_write(data_read2_C), .write_enable(control_memwrite_2), .read_enable(control_memread_2), .data_read(data_mem));
MyDatapathMux _MuxWriteBR(.control_signal(control_memreg_2),.input_data_1(alu_result_3),.input_data_2(data_mem_2), .output_data(data_write));
MyDatapathMux_5B _Mux_Dir_BR(.control_signal(RegDst_2), .input_data_1(instruction_4), .input_data_2(instruction_5), .output_data(Dir_Wri_BR));
MyDatapathMux _Mux_D2_ALU(.control_signal(ALU_Src_2), .input_data_1(data_read2_B), .input_data_2(Mux_ALU_in2), .output_data(Oper_2));
sign_extend _Sig_Ext(.Data_in(instruction[15:0]), .Data_out(Mux_ALU_in2_B));
Shift_Left_2 _Sh_Lef_2(.SL_in(Mux_ALU_in2), .SL_out(SL2_adder));
ADDER _Sumador(.O1(add_result_3), .O2(SL2_adder), .Res(Add_In2_MuxPC));
MyDatapathMux _Mux_PC(.control_signal(Branch_2&tr_zf_2), .input_data_1(add_result_1), .input_data_2(Add_In2_MuxPC_2), .output_data(MPC_MJ));
MyDatapathMux _Mux_J(.control_signal(Jump_4), .input_data_1(MPC_MJ), .input_data_2(JAddress_3), .output_data(MuxPC_PCin));
Shift_Left_26_28 _SL_26_28(.SL_in(instruction_3), .SL_out(JAddress));
IFID Buffer_1(.clk(clk),.Next_address(add_result_1),.Instruction(instruction_2),.O_Next_address(add_result_2),.O_Instruction(instruction));
IDEX Buffer_2(.clk(clk), .I_WB({control_memreg,control_regwrite}), .I_M({control_memwrite,control_memread,Branch}), .I_EX({ALU_Src,control_aluop,RegDst}), .I_Next_address(add_result_2), .I_O1(data_read1), .I_O2(data_read2), .I_Ext_Inmed(Mux_ALU_in2_B), .I_RT(instruction[20:16]), .I_RD(instruction[15:11]), .I_Jump(Jump), .I_Instr_J(instruction[25:0]), .O_WB(WB), .O_M(M), .O_EX_RegDst(RegDst_2), .O_EX_ALUOp(control_aluop_2), .O_EX_ALUSrc(ALU_Src_2), .O_Next_address(add_result_3), .O_O1(data_read1_B), .O_O2(data_read2_B), .O_Ext_Inmed(Mux_ALU_in2), .O_RT(instruction_4), .O_RD(instruction_5), .O_Jump(Jump_2), .O_Instr_J(instruction_3));
EXMEM Buffer_3(.clk(clk), .I_WB(WB), .I_M(M), .I_ADD_Res(Add_In2_MuxPC), .I_ZF(tr_zf), .I_ALU_Res(alu_result), .I_DatWri_Mem(data_read2_B), .I_Addr_Reg_Wri(Dir_Wri_BR), .I_Jump(Jump_2), .I_Ins32_J({add_result_3[31:28],JAddress}), .O_WB(WB_2), .O_M_Branch(Branch_2), .O_M_MemRead(control_memread_2), .O_M_MemWrite(control_memwrite_2), .O_ADD_Res(Add_In2_MuxPC_2), .O_ZF(tr_zf_2), .O_ALU_Res(alu_result_2), .O_DatWri_Mem(data_read2_C), .O_Addr_Reg_Wri(Dir_Wri_BR_2), .O_Jump(Jump_3), .O_Ins32_J(JAddress_2));
MEMWB Buffer_4(.clk(clk), .I_WB(WB_2), .I_ReDat_Mem(data_mem), .I_ALU_Res(alu_result_2), .I_Addr_Reg_Wri(Dir_Wri_BR_2), .I_Jump(Jump_3), .I_Ins32_J(JAddress_2), .O_WB_RegWrite(control_regwrite_2), .O_WB_MemtoReg(control_memreg_2), .O_ReDat_Mem(data_mem_2), .O_ALU_Res(alu_result_3), .O_Addr_Reg_Wri(Dir_Wri_BR_3), .O_Jump(Jump_4), .O_Ins32_J(JAddress_3));


initial
begin
$readmemb("Inicializacion Memoria de Instrucciones.txt",_IM.memory);
$readmemb("Inicializacion BR.txt",_BR.memory);
$readmemb("Inicializacion Memoria de Datos.txt",_Mem.memory);
end

endmodule
