//set DMEM
DMEM[0] = 4;
DMEM[1] = 2;
 //R0, R1, R2 is used
IMEM[0] = 'b 1100_0000_0000_0100;
IMEM[1] = 'b 1100_0001_0000_0010;
IMEM[2] = 'b 1100_0011_0000_0000; // R3 = 0 answer
IMEM[3] = 'b 1100_0100_0000_0000; // R4 = 0 DMEM address from
IMEM[4] = 'b 1100_0101_0000_0001; // R5 = 1 DMEM address from
IMEM[5] = 'b 1011_0110_0000_0100; // R6 = DMEM[R4=0] load;
IMEM[6] = 'b 1011_0111_0000_0101; // R7 = DMEM[R5=1] load;

IMEM[7] = 'b 1100_1000_0000_0001; // R8 = 1 for bit shift
IMEM[8] = 'b 1100_1001_0000_1100; // R9 = 12 loop return point
IMEM[9] = 'b 1100_1010_0000_1111; // R10 = 15 loop skip point
IMEM[10] = 'b 1100_1011_0001_0100; // R11 = 20 end point
IMEM[11] = 'b 1100_1100_0000_1000; // R12 = 8;

IMEM[12] = 'b 0101_1101_0101_0111; // R13 = R5 & R7
IMEM[13] = 'b 1001_0000_0000_1010; // to loop skip point
IMEM[14] = 'b 0000_0011_0011_0110; // R3 = R3+R6;
IMEM[15] = 'b 0011_0110_0110_1000; // R6 = R6<<R8(R8=1)
IMEM[16] = 'b 0011_0101_0101_1000; // R5 = R5<<R8(R8=1)
IMEM[17] = 'b 0001_1100_1100_1000; // R12 = R12-R8(R8=1);
IMEM[18] = 'b 1001_0000_0000_1011; // to end point
IMEM[19] = 'b 1000_0000_0000_1001; // to loop start
IMEM[20] = 'b 1100_1101_0000_0010; // R13 = 2 DMEM address to
IMEM[21] = 'b 1010_0000_0011_1101; // store R3 -> DMEM[R13=2]

