asm(".globl _start; _start: j main");

const char message[] = "Hello world!\r\n";

void write_io(char out, int pos) {
    volatile char *port = (char*)0x80000000;
    port[pos] = out;
}

char read_io(int pos) {
    volatile char *port = (char*)0x80000000;
    return port[pos];
}

void putc(char c) {
    while((read_io(3) & 0x40) == 0) {}
    write_io(c, 2);
    write_io(0x40, 3);
    write_io(0, 3);
}

int main() {
    int i = 0;
    char tmp = message[0];
    while (tmp != 0) {
        putc(tmp);
        i++;
        tmp = message[i];
    }
    return 0x42;
}
