typedef void (*write_io_t)(char out, int pos);
typedef char (*read_io_t)(int pos);
typedef void (*putc_t)(char c);
typedef char (*getc_t)();
typedef void (*puts_t)(const char*);

//write_io_t write_io = (write_io_t)0x8;
//read_io_t read_io = (read_io_t)0xC;
putc_t putc = (putc_t)0x10;
