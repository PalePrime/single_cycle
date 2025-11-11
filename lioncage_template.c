typedef void (*write_io_t)(char out, int pos);
typedef char (*read_io_t)(int pos);
write_io_t write_io = (write_io_t)0x8;
read_io_t read_io = (read_io_t)0xC;

int main() {
    int wasAtG1 = 0;
    int count   = 0;
    while (1) {
        // What needs to be done?
        int sensors   = read_io(1);
        int button1   = (read_io(0) & 0b00000001) != 0;
        int atG1      = (sensors    & 0b00000001) != 0;
        int atG2      = (sensors    & 0b00000010) != 0;
        int operation = 0;
        // TODO: Check sensors (current and previous)
        //       and increment/decrement as appropriate
        //       by assigning 1 or -1 to operation
        if ( /* change this */ 0) operation = 1;
        if ( /* and this.   */ 0) operation = -1;
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
