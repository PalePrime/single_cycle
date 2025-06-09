asm(".globl _start; _start: j main");

void write_io(char out, int pos) {
    volatile char *port = (char*)0x80000000;
    port[pos] = out;
}

char read_io(int pos) {
    volatile char *port = (char*)0x80000000;
    return port[pos];
}

int main() {
    int wasAtG1 = 0;
    int count   = 0;
    while (1) {
        // What needs to be done?
        int sensors   = read_io(1);
        int button1   = (read_io(0) & 0b00000010) != 0;
        int atG1      = (sensors    & 0b00000001) != 0;
        int atG2      = (sensors    & 0b00000010) != 0;
        int operation = 0;
        if (atG1 && !wasAtG1 && !atG2) operation = 1;
        if (!atG1 && wasAtG1 && !atG2) operation = -1;
        // Now, do it!
        count   = count + operation;
        wasAtG1 = atG1;
        // Present the result
        write_io(count, 1);
        // Possibly exit
        if (button1) break;
    }
    return count;
}
