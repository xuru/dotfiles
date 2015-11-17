/* to compile gcc -o pity pity.c */
#include <util.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/wait.h>

static inline void report_error(int err, char* errmsg) {
    perror(errmsg);
    exit(err);
}

int main(int argc, char* argv[]) {
    int master;
    int slave;
    int pid;
    int child;
    int err;
    int n;
    int flags;
    FILE* fp;
    char* buff[128];
    struct termios term_info;
    struct termios term_slave;
    struct termios term_restore;
    struct winsize wsize;

    /* get terminal info and save it for later use */
    err = tcgetattr(fileno(stdin), &term_info);
    if (err < 0) {
        report_error(err, "couldn't get terminal attributes");
    }
    term_restore = term_info;
    term_slave = term_info;

    pid = forkpty(&master, NULL, &term_slave, NULL);
    if (pid < 0) {
        report_error(pid, "couldn't forkpty");
    }

    if (pid == 0) {
        /* I'm the child */
        err = execvp(argv[1], argv+1);
        report_error(err, "couldn't exec");
    }

    /* work that happens in the master */
    term_info.c_lflag &= ~ICANON;  /* turn off canonical mode */
    err = tcsetattr(fileno(stdin), TCSANOW, &term_info);
    if (err < 0) {
        report_error(err, "couldn't set terminal attributes");
    }

    /* turn off blocking on stdin */
    flags = fcntl(fileno(stdin), F_GETFL, 0);
    flags |= O_NONBLOCK;
    err = fcntl(fileno(stdin), F_SETFL, flags);
    if (err < 0) {
        report_error(err, "failed to set stdin nonblock");
    }

    /* turn off blocking on pty */
    flags = fcntl(master, F_GETFL, 0);
    flags |= O_NONBLOCK;
    err = fcntl(master, F_SETFL, flags);
    if (err < 0) {
        perror("failed to set pty nonblock");
    }
    for(;;) {
        child = waitpid(pid, NULL, WNOHANG);
        if (child == pid) {
            break;
        }
        n = read(fileno(stdin), buff, sizeof(buff));
        if (n > 0) {
            write(master, buff, n);
        } else {
            if (n < 0) {
                if (errno != EAGAIN) {
                    break;
                }
            }
        }
        n = read(master, buff, sizeof(buff));
        if (n > 0) {
            write(fileno(stderr), buff, n);
        } else {
            if (n < 0) {
                if (errno != EAGAIN) {
                    break;
                }
            }
        }
    }
    err = tcsetattr(fileno(stdin), TCSANOW, &term_restore);
    if (err < 0) {
        report_error(err, "couldn't restore terminal attributes");
    }
    exit(0);
}
