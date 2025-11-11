typedef void (*putc_t)(char c);
putc_t putc = (putc_t)0x10;

const char message[] = "Hello world!\r\n";

int main() {
    int i = 0;
    char tmp = message[0];
    while (tmp != 0) {
        putc(tmp);
        i++;
        tmp = message[i];
    }
    return i;
}
