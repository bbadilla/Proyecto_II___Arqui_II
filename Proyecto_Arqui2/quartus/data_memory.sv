module data_memory(input logic clk, we,
						 input logic [127:0] a,
						 output logic [15:0] rd [255:0]);
						 
  logic [15:0] RAM [255:0];
  logic [255:0] deco_out [7:0];
  logic [7:0] adder_in [255:0]; 
  logic [3:0] add_8_out [255:0];
  logic [7:0] b [7:0];
  
  assign rd = RAM;
  
  genvar i;
	generate
		 for(i = 0; i < 256; i++)
		 begin: test
			  initial
			  begin
					RAM[i][15:0] = 16'b0;
			  end
		 end
	endgenerate
	
  assign b[0] = a[7:0];
  assign b[1] = a[23:16];
  assign b[2] = a[39:32];
  assign b[3] = a[55:48];
  assign b[4] = a[71:64];
  assign b[5] = a[87:80];
  assign b[6] = a[103:96];
  assign b[7] = a[119:112];
  
  genvar j;
	generate
		 for(i = 0; i < 8; i++)
		 begin:hola
			deco_hist deco(b[i], deco_out[i]);
			for(j = 0; j < 256; j++)
			begin:hola2
				assign adder_in[j][i] = deco_out[i][j];
			end
		 end	 
		 for(j = 0; j < 256; j++)
		 begin:hola3
			Add_8 add_deco(adder_in[j], add_8_out[j]);
		 end
	endgenerate
	
  
  always_ff @(negedge clk)
    if (we)
		begin
			RAM[0] <= (RAM[0] + add_8_out[0]);
			RAM[1] <= (RAM[1] + add_8_out[1]);
			RAM[2] <= (RAM[2] + add_8_out[2]);
			RAM[3] <= (RAM[3] + add_8_out[3]);
			RAM[4] <= (RAM[4] + add_8_out[4]);
			RAM[5] <= (RAM[5] + add_8_out[5]);
			RAM[6] <= (RAM[6] + add_8_out[6]);
			RAM[7] <= (RAM[7] + add_8_out[7]);
			RAM[8] <= (RAM[8] + add_8_out[8]);
			RAM[9] <= (RAM[9] + add_8_out[9]);
			RAM[10] <= (RAM[10] + add_8_out[10]);
			RAM[11] <= (RAM[11] + add_8_out[11]);
			RAM[12] <= (RAM[12] + add_8_out[12]);
			RAM[13] <= (RAM[13] + add_8_out[13]);
			RAM[14] <= (RAM[14] + add_8_out[14]);
			RAM[15] <= (RAM[15] + add_8_out[15]);
			RAM[16] <= (RAM[16] + add_8_out[16]);
			RAM[17] <= (RAM[17] + add_8_out[17]);
			RAM[18] <= (RAM[18] + add_8_out[18]);
			RAM[19] <= (RAM[19] + add_8_out[19]);
			RAM[20] <= (RAM[20] + add_8_out[20]);
			RAM[21] <= (RAM[21] + add_8_out[21]);
			RAM[22] <= (RAM[22] + add_8_out[22]);
			RAM[23] <= (RAM[23] + add_8_out[23]);
			RAM[24] <= (RAM[24] + add_8_out[24]);
			RAM[25] <= (RAM[25] + add_8_out[25]);
			RAM[26] <= (RAM[26] + add_8_out[26]);
			RAM[27] <= (RAM[27] + add_8_out[27]);
			RAM[28] <= (RAM[28] + add_8_out[28]);
			RAM[29] <= (RAM[29] + add_8_out[29]);
			RAM[30] <= (RAM[30] + add_8_out[30]);
			RAM[31] <= (RAM[31] + add_8_out[31]);
			RAM[32] <= (RAM[32] + add_8_out[32]);
			RAM[33] <= (RAM[33] + add_8_out[33]);
			RAM[34] <= (RAM[34] + add_8_out[34]);
			RAM[35] <= (RAM[35] + add_8_out[35]);
			RAM[36] <= (RAM[36] + add_8_out[36]);
			RAM[37] <= (RAM[37] + add_8_out[37]);
			RAM[38] <= (RAM[38] + add_8_out[38]);
			RAM[39] <= (RAM[39] + add_8_out[39]);
			RAM[40] <= (RAM[40] + add_8_out[40]);
			RAM[41] <= (RAM[41] + add_8_out[41]);
			RAM[42] <= (RAM[42] + add_8_out[42]);
			RAM[43] <= (RAM[43] + add_8_out[43]);
			RAM[44] <= (RAM[44] + add_8_out[44]);
			RAM[45] <= (RAM[45] + add_8_out[45]);
			RAM[46] <= (RAM[46] + add_8_out[46]);
			RAM[47] <= (RAM[47] + add_8_out[47]);
			RAM[48] <= (RAM[48] + add_8_out[48]);
			RAM[49] <= (RAM[49] + add_8_out[49]);
			RAM[50] <= (RAM[50] + add_8_out[50]);
			RAM[51] <= (RAM[51] + add_8_out[51]);
			RAM[52] <= (RAM[52] + add_8_out[52]);
			RAM[53] <= (RAM[53] + add_8_out[53]);
			RAM[54] <= (RAM[54] + add_8_out[54]);
			RAM[55] <= (RAM[55] + add_8_out[55]);
			RAM[56] <= (RAM[56] + add_8_out[56]);
			RAM[57] <= (RAM[57] + add_8_out[57]);
			RAM[58] <= (RAM[58] + add_8_out[58]);
			RAM[59] <= (RAM[59] + add_8_out[59]);
			RAM[60] <= (RAM[60] + add_8_out[60]);
			RAM[61] <= (RAM[61] + add_8_out[61]);
			RAM[62] <= (RAM[62] + add_8_out[62]);
			RAM[63] <= (RAM[63] + add_8_out[63]);
			RAM[64] <= (RAM[64] + add_8_out[64]);
			RAM[65] <= (RAM[65] + add_8_out[65]);
			RAM[66] <= (RAM[66] + add_8_out[66]);
			RAM[67] <= (RAM[67] + add_8_out[67]);
			RAM[68] <= (RAM[68] + add_8_out[68]);
			RAM[69] <= (RAM[69] + add_8_out[69]);
			RAM[70] <= (RAM[70] + add_8_out[70]);
			RAM[71] <= (RAM[71] + add_8_out[71]);
			RAM[72] <= (RAM[72] + add_8_out[72]);
			RAM[73] <= (RAM[73] + add_8_out[73]);
			RAM[74] <= (RAM[74] + add_8_out[74]);
			RAM[75] <= (RAM[75] + add_8_out[75]);
			RAM[76] <= (RAM[76] + add_8_out[76]);
			RAM[77] <= (RAM[77] + add_8_out[77]);
			RAM[78] <= (RAM[78] + add_8_out[78]);
			RAM[79] <= (RAM[79] + add_8_out[79]);
			RAM[80] <= (RAM[80] + add_8_out[80]);
			RAM[81] <= (RAM[81] + add_8_out[81]);
			RAM[82] <= (RAM[82] + add_8_out[82]);
			RAM[83] <= (RAM[83] + add_8_out[83]);
			RAM[84] <= (RAM[84] + add_8_out[84]);
			RAM[85] <= (RAM[85] + add_8_out[85]);
			RAM[86] <= (RAM[86] + add_8_out[86]);
			RAM[87] <= (RAM[87] + add_8_out[87]);
			RAM[88] <= (RAM[88] + add_8_out[88]);
			RAM[89] <= (RAM[89] + add_8_out[89]);
			RAM[90] <= (RAM[90] + add_8_out[90]);
			RAM[91] <= (RAM[91] + add_8_out[91]);
			RAM[92] <= (RAM[92] + add_8_out[92]);
			RAM[93] <= (RAM[93] + add_8_out[93]);
			RAM[94] <= (RAM[94] + add_8_out[94]);
			RAM[95] <= (RAM[95] + add_8_out[95]);
			RAM[96] <= (RAM[96] + add_8_out[96]);
			RAM[97] <= (RAM[97] + add_8_out[97]);
			RAM[98] <= (RAM[98] + add_8_out[98]);
			RAM[99] <= (RAM[99] + add_8_out[99]);
			RAM[100] <= (RAM[100] + add_8_out[100]);
			RAM[101] <= (RAM[101] + add_8_out[101]);
			RAM[102] <= (RAM[102] + add_8_out[102]);
			RAM[103] <= (RAM[103] + add_8_out[103]);
			RAM[104] <= (RAM[104] + add_8_out[104]);
			RAM[105] <= (RAM[105] + add_8_out[105]);
			RAM[106] <= (RAM[106] + add_8_out[106]);
			RAM[107] <= (RAM[107] + add_8_out[107]);
			RAM[108] <= (RAM[108] + add_8_out[108]);
			RAM[109] <= (RAM[109] + add_8_out[109]);
			RAM[110] <= (RAM[110] + add_8_out[110]);
			RAM[111] <= (RAM[111] + add_8_out[111]);
			RAM[112] <= (RAM[112] + add_8_out[112]);
			RAM[113] <= (RAM[113] + add_8_out[113]);
			RAM[114] <= (RAM[114] + add_8_out[114]);
			RAM[115] <= (RAM[115] + add_8_out[115]);
			RAM[116] <= (RAM[116] + add_8_out[116]);
			RAM[117] <= (RAM[117] + add_8_out[117]);
			RAM[118] <= (RAM[118] + add_8_out[118]);
			RAM[119] <= (RAM[119] + add_8_out[119]);
			RAM[120] <= (RAM[120] + add_8_out[120]);
			RAM[121] <= (RAM[121] + add_8_out[121]);
			RAM[122] <= (RAM[122] + add_8_out[122]);
			RAM[123] <= (RAM[123] + add_8_out[123]);
			RAM[124] <= (RAM[124] + add_8_out[124]);
			RAM[125] <= (RAM[125] + add_8_out[125]);
			RAM[126] <= (RAM[126] + add_8_out[126]);
			RAM[127] <= (RAM[127] + add_8_out[127]);
			RAM[128] <= (RAM[128] + add_8_out[128]);
			RAM[129] <= (RAM[129] + add_8_out[129]);
			RAM[130] <= (RAM[130] + add_8_out[130]);
			RAM[131] <= (RAM[131] + add_8_out[131]);
			RAM[132] <= (RAM[132] + add_8_out[132]);
			RAM[133] <= (RAM[133] + add_8_out[133]);
			RAM[134] <= (RAM[134] + add_8_out[134]);
			RAM[135] <= (RAM[135] + add_8_out[135]);
			RAM[136] <= (RAM[136] + add_8_out[136]);
			RAM[137] <= (RAM[137] + add_8_out[137]);
			RAM[138] <= (RAM[138] + add_8_out[138]);
			RAM[139] <= (RAM[139] + add_8_out[139]);
			RAM[140] <= (RAM[140] + add_8_out[140]);
			RAM[141] <= (RAM[141] + add_8_out[141]);
			RAM[142] <= (RAM[142] + add_8_out[142]);
			RAM[143] <= (RAM[143] + add_8_out[143]);
			RAM[144] <= (RAM[144] + add_8_out[144]);
			RAM[145] <= (RAM[145] + add_8_out[145]);
			RAM[146] <= (RAM[146] + add_8_out[146]);
			RAM[147] <= (RAM[147] + add_8_out[147]);
			RAM[148] <= (RAM[148] + add_8_out[148]);
			RAM[149] <= (RAM[149] + add_8_out[149]);
			RAM[150] <= (RAM[150] + add_8_out[150]);
			RAM[151] <= (RAM[151] + add_8_out[151]);
			RAM[152] <= (RAM[152] + add_8_out[152]);
			RAM[153] <= (RAM[153] + add_8_out[153]);
			RAM[154] <= (RAM[154] + add_8_out[154]);
			RAM[155] <= (RAM[155] + add_8_out[155]);
			RAM[156] <= (RAM[156] + add_8_out[156]);
			RAM[157] <= (RAM[157] + add_8_out[157]);
			RAM[158] <= (RAM[158] + add_8_out[158]);
			RAM[159] <= (RAM[159] + add_8_out[159]);
			RAM[160] <= (RAM[160] + add_8_out[160]);
			RAM[161] <= (RAM[161] + add_8_out[161]);
			RAM[162] <= (RAM[162] + add_8_out[162]);
			RAM[163] <= (RAM[163] + add_8_out[163]);
			RAM[164] <= (RAM[164] + add_8_out[164]);
			RAM[165] <= (RAM[165] + add_8_out[165]);
			RAM[166] <= (RAM[166] + add_8_out[166]);
			RAM[167] <= (RAM[167] + add_8_out[167]);
			RAM[168] <= (RAM[168] + add_8_out[168]);
			RAM[169] <= (RAM[169] + add_8_out[169]);
			RAM[170] <= (RAM[170] + add_8_out[170]);
			RAM[171] <= (RAM[171] + add_8_out[171]);
			RAM[172] <= (RAM[172] + add_8_out[172]);
			RAM[173] <= (RAM[173] + add_8_out[173]);
			RAM[174] <= (RAM[174] + add_8_out[174]);
			RAM[175] <= (RAM[175] + add_8_out[175]);
			RAM[176] <= (RAM[176] + add_8_out[176]);
			RAM[177] <= (RAM[177] + add_8_out[177]);
			RAM[178] <= (RAM[178] + add_8_out[178]);
			RAM[179] <= (RAM[179] + add_8_out[179]);
			RAM[180] <= (RAM[180] + add_8_out[180]);
			RAM[181] <= (RAM[181] + add_8_out[181]);
			RAM[182] <= (RAM[182] + add_8_out[182]);
			RAM[183] <= (RAM[183] + add_8_out[183]);
			RAM[184] <= (RAM[184] + add_8_out[184]);
			RAM[185] <= (RAM[185] + add_8_out[185]);
			RAM[186] <= (RAM[186] + add_8_out[186]);
			RAM[187] <= (RAM[187] + add_8_out[187]);
			RAM[188] <= (RAM[188] + add_8_out[188]);
			RAM[189] <= (RAM[189] + add_8_out[189]);
			RAM[190] <= (RAM[190] + add_8_out[190]);
			RAM[191] <= (RAM[191] + add_8_out[191]);
			RAM[192] <= (RAM[192] + add_8_out[192]);
			RAM[193] <= (RAM[193] + add_8_out[193]);
			RAM[194] <= (RAM[194] + add_8_out[194]);
			RAM[195] <= (RAM[195] + add_8_out[195]);
			RAM[196] <= (RAM[196] + add_8_out[196]);
			RAM[197] <= (RAM[197] + add_8_out[197]);
			RAM[198] <= (RAM[198] + add_8_out[198]);
			RAM[199] <= (RAM[199] + add_8_out[199]);
			RAM[200] <= (RAM[200] + add_8_out[200]);
			RAM[201] <= (RAM[201] + add_8_out[201]);
			RAM[202] <= (RAM[202] + add_8_out[202]);
			RAM[203] <= (RAM[203] + add_8_out[203]);
			RAM[204] <= (RAM[204] + add_8_out[204]);
			RAM[205] <= (RAM[205] + add_8_out[205]);
			RAM[206] <= (RAM[206] + add_8_out[206]);
			RAM[207] <= (RAM[207] + add_8_out[207]);
			RAM[208] <= (RAM[208] + add_8_out[208]);
			RAM[209] <= (RAM[209] + add_8_out[209]);
			RAM[210] <= (RAM[210] + add_8_out[210]);
			RAM[211] <= (RAM[211] + add_8_out[211]);
			RAM[212] <= (RAM[212] + add_8_out[212]);
			RAM[213] <= (RAM[213] + add_8_out[213]);
			RAM[214] <= (RAM[214] + add_8_out[214]);
			RAM[215] <= (RAM[215] + add_8_out[215]);
			RAM[216] <= (RAM[216] + add_8_out[216]);
			RAM[217] <= (RAM[217] + add_8_out[217]);
			RAM[218] <= (RAM[218] + add_8_out[218]);
			RAM[219] <= (RAM[219] + add_8_out[219]);
			RAM[220] <= (RAM[220] + add_8_out[220]);
			RAM[221] <= (RAM[221] + add_8_out[221]);
			RAM[222] <= (RAM[222] + add_8_out[222]);
			RAM[223] <= (RAM[223] + add_8_out[223]);
			RAM[224] <= (RAM[224] + add_8_out[224]);
			RAM[225] <= (RAM[225] + add_8_out[225]);
			RAM[226] <= (RAM[226] + add_8_out[226]);
			RAM[227] <= (RAM[227] + add_8_out[227]);
			RAM[228] <= (RAM[228] + add_8_out[228]);
			RAM[229] <= (RAM[229] + add_8_out[229]);
			RAM[230] <= (RAM[230] + add_8_out[230]);
			RAM[231] <= (RAM[231] + add_8_out[231]);
			RAM[232] <= (RAM[232] + add_8_out[232]);
			RAM[233] <= (RAM[233] + add_8_out[233]);
			RAM[234] <= (RAM[234] + add_8_out[234]);
			RAM[235] <= (RAM[235] + add_8_out[235]);
			RAM[236] <= (RAM[236] + add_8_out[236]);
			RAM[237] <= (RAM[237] + add_8_out[237]);
			RAM[238] <= (RAM[238] + add_8_out[238]);
			RAM[239] <= (RAM[239] + add_8_out[239]);
			RAM[240] <= (RAM[240] + add_8_out[240]);
			RAM[241] <= (RAM[241] + add_8_out[241]);
			RAM[242] <= (RAM[242] + add_8_out[242]);
			RAM[243] <= (RAM[243] + add_8_out[243]);
			RAM[244] <= (RAM[244] + add_8_out[244]);
			RAM[245] <= (RAM[245] + add_8_out[245]);
			RAM[246] <= (RAM[246] + add_8_out[246]);
			RAM[247] <= (RAM[247] + add_8_out[247]);
			RAM[248] <= (RAM[248] + add_8_out[248]);
			RAM[249] <= (RAM[249] + add_8_out[249]);
			RAM[250] <= (RAM[250] + add_8_out[250]);
			RAM[251] <= (RAM[251] + add_8_out[251]);
			RAM[252] <= (RAM[252] + add_8_out[252]);
			RAM[253] <= (RAM[253] + add_8_out[253]);
			RAM[254] <= (RAM[254] + add_8_out[254]);
			RAM[255] <= (RAM[255] + add_8_out[255]);
		end

	
		
endmodule 