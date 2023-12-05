// UFMG
// 05/12/2023
// Ricardo de Oliveira Duarte
// A very simple general parser in C language to convert textual input stimulus to gtkwave vcd format

#include <stdio.h>

void generateVCD(FILE *output) {
    // Header
    fprintf(output, "$date\n");
    fprintf(output, "   December 5, 2023.00\n");
    fprintf(output, "$end\n");

    fprintf(output, "$version\n");
    fprintf(output, "   SimpleVCDParser\n");
    fprintf(output, "$end\n");

    fprintf(output, "$timescale 1ns $end\n");

    // Module definition
    fprintf(output, "$scope module top $end\n");

    // Signal definition
    fprintf(output, "$var reg 4 # data $end\n");
    fprintf(output, "$var reg 1 ! clock $end\n");
    fprintf(output, "$var reg 1 @ reset $end\n");

    // End of module definition
    fprintf(output, "$upscope $end\n");

    // Initial values
    fprintf(output, "$dumpvars\n");
    fprintf(output, "b0000 #\n");
    fprintf(output, "0!\n");
    fprintf(output, "0@\n");
    fprintf(output, "$end\n");

    // Simulation data
    fprintf(output, "#0\n");
    fprintf(output, "b0001 #\n");
    fprintf(output, "#10\n");
	fprintf(output, "1!\n");
    fprintf(output, "b0010 #\n");
    fprintf(output, "#20\n");
	fprintf(output, "0!\n");
    fprintf(output, "b0011 #\n");
    fprintf(output, "#30\n");
	fprintf(output, "1!\n");
    fprintf(output, "b0100 #\n");

    // End of simulation
    fprintf(output, "#40\n");
	fprintf(output, "0!\n");
	fprintf(output, "1@\n");
    fprintf(output, "b0000 #\n");	
    fprintf(output, "#50\n");
    fprintf(output, "$finish\n");
}

int main() {
    FILE *output = fopen("output.vcd", "w");
    if (output == NULL) {
        perror("Error opening output file");
        return 1;
    }

    generateVCD(output);

    fclose(output);
    return 0;
}
