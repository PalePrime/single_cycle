asm (".globl _start; _start: lui sp, 0x8; j main");

void* jmp_table[16];

const char *message = "\nWelcome!\n\n";
const char *help_msg = "\nSorry, no help available...";
const char *not_msg = "Not a command";
const char *err_msg = "Incorrect";
const char *prompt  = "> ";

#define BUF_MAX   80

#define BUF_OK    0
#define BUF_FULL  1
#define BUF_EMPTY 2
#define BUF_ERR   3

struct buffer {
    int start;
    int end;
    char buf[BUF_MAX];
    int error;
};

void write_io(char out, int pos) {
    volatile char *port = (char*)0x80000000;
    port[pos] = out;
}

char read_io(int pos) {
    volatile char *port = (char*)0x80000000;
    return port[pos];
}

void write_mem_w(int data, int address) {
    volatile int *mem = (int*)0x0;
    mem[address >> 2] = data;
}

int read_mem_w(int address) {
    volatile int *mem = (int*)0x0;
    return mem[address >> 2];
}

void inner_put_c(char c) {
    while((read_io(3) & 0x40) == 0) {}
    write_io(c, 1);
    write_io(0x40, 3);
    write_io(0, 3);
}

char get_c() {
    while((read_io(3) & 0x20) == 0) {}
    char c = read_io(1);
    write_io(0x20, 3);
    write_io(0, 3);
    return c;
}

void put_c(char c) {
    if (c == '\n') {
        inner_put_c('\r');
    }
    inner_put_c(c);
}

void put_s(const char* s) {
    int i = 0;
    char tmp = s[0];
    while (tmp != 0) {
        put_c(tmp);
        i++;
        tmp = s[i];
    }
}

void put_hex(int number, int size) {
    const char* digits = "0123456789ABCDEF";
    while(size > 0) {
        int byte = (number >> ((size - 1) << 3));
        put_c(digits[(byte >> 4) & 0xf]);
        put_c(digits[byte & 0xf]);
        size--;
    }
}

void get_line(struct buffer* line) {
    line->start = 0;
    line->end = 0;
    line->error = BUF_OK;
    while(1) {
        char c = get_c();
        // put_hex(c,1);
        if (c == '\n' || c == '\r') {
            //put_c('\n');
            if (line->end == 0) {
                line->error = BUF_EMPTY;
            }
            break;
        } else if (c >= ' ' && c < 128) {
            //put_c(c);
            int pos = line->end;
            line->buf[pos] = c;
            if(pos + 1 >= BUF_MAX) {
                line->error = BUF_FULL;
                break;
            } else {
                line->end = pos + 1;
            }
        } else if (c == '\b' || c == 0x7f) {
            if (line->end > 0) {
                //put_c(c); put_c(' '); put_c(c);
                line->end = line->end - 1;
            }
        }
    }
}

char next_char(struct buffer* line) {
    char c = 0;
    if (line->error == BUF_OK && (line->start < line->end)) {
        c = line->buf[line->start];
    }
    return c;
}

char read_char(struct buffer* line) {
    char c = next_char(line);
    if (c != 0) {
        line->start = line->start + 1;
    } else {
        line->error = BUF_ERR;
    }
    return c;
}

void mark_error(struct buffer* line, int count, int exact) {
    if (count > 0 || (count != 0 && exact)) {
        line->error = BUF_ERR;
    }
}

void glob_space(struct buffer* line, int count, int exact) {
    while(1) {
        char c = next_char(line);
        if (c == ' ' || c == '\t') {
            line->start = line->start + 1;
            count--;
        } else {
            break;
        }
    }
    mark_error(line, count, exact);
}

void glob_eol(struct buffer* line) {
    glob_space(line, 0, 0);
    char c = next_char(line);
    if (c != 0) {
        line->error = BUF_ERR;
    }
}

int read_hex(struct buffer* line, int count, int exact) {
    int result = 0;
    while (1) {
        char c = next_char(line);
        int digit = -1;
        if (c >= '0' && c <= '9') {
            digit = (int)(c - '0');
        } else if (c >= 'A' && c <= 'F') {
            digit = (int)(c - 'A' + 10);
        } else if (c >= 'a' && c <= 'f') {
            digit = (int)(c - 'a' + 10);
        }
        if (digit >= 0) {
            result = (result << 4) + digit;
            line->start = line->start + 1;
            count--;
        } else {
            break;
        }
    }
    mark_error(line, count, exact);
    return result;
}

void command_i() {
    put_c('\n');
    for (int i = 3; i>=0; i--) {
        put_hex(read_io(i), 1);    
    }
}

void command_l(struct buffer* cmd) {
    glob_space(cmd, 1, 0);
    char data = (char)read_hex(cmd,2,0);
    glob_eol(cmd);
    if (cmd->error == BUF_OK) {
        write_io(data, 0);
    }
}

void command_m(struct buffer* cmd) {
    glob_space(cmd, 1, 0);
    int address = read_hex(cmd,1,0);
    glob_space(cmd, 0, 0);
    int count = read_hex(cmd, 0, 0) & 0xFF;
    if (count>0) count--;
    glob_eol(cmd);
    if (cmd->error == BUF_OK) {
        put_c('\n');
        for (int i = 0; i <= count; i++) {
            put_hex(read_mem_w(address), 4);   
            address = address + 4; 
            put_c('\n');
        }
    }
}

void command_f(struct buffer* cmd) {
    struct buffer line;
    glob_space(cmd, 1, 0);
    int address = read_hex(cmd,1,0);
    glob_eol(cmd);
    if (cmd->error == BUF_OK) {
        while (1) {
            get_line(&line);
            if (line.error == BUF_EMPTY) {
                break;
            } else {
                int data = read_hex(&line, 1, 0);
                glob_eol(&line);
                if (line.error == BUF_OK) {
                    write_mem_w(data, address);
                    address = address + 4;
                } else {
                    break;
                }
            }
        }
    }
}

void command_x(struct buffer* cmd) {
    int (*fptr)(int, int);
    glob_space(cmd, 1, 0);
    int address = read_hex(cmd,1,0);
    glob_eol(cmd);
    if (cmd->error == BUF_OK) {
        fptr = (int (*)(int, int))address;
        int result = fptr(0, 0);
        put_hex(result, 1);
    }
}

void command(struct buffer* cmd) {
    char c = read_char(cmd);
    switch (c) {
        case 0:
            break;
        case 'h':
            put_s(help_msg);
            break;
        case 'm':
            command_m(cmd);
            break;
        case 'f':
            command_f(cmd);
            break;
        case 'x':
            command_x(cmd);
            break;
        case 'i':
            command_i();
            break;
        case 'l':
            command_l(cmd);
            break;
        default:
            put_s(not_msg);
            break;
    }
    if (cmd->error == BUF_ERR) {
        put_s(err_msg);
    }
}

int main() {
    struct buffer cmd;
    put_s(message);
    while(1) {
        put_s(prompt);
        get_line(&cmd);
        if (cmd.error == BUF_OK) {
            command(&cmd);
        }
        put_c('\n');
    }
}
