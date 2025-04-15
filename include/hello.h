// hello.h
#ifndef HELLO_H
#define HELLO_H

#include <rcl/rcl.h>
#include <rcl/init_options.h>
#include <rcl/error_handling.h>
#include <stdio.h>      // 标准 I/O 函数，如 printf、perror
#include <stdlib.h>     // 标准库函数，如 system、exit
#include <string.h>     // 字符串操作，如 strlen
#include <time.h>       // 时间相关的函数
#include <unistd.h>     // POSIX API，如 getpid、getuid
#include <sys/utsname.h> // 获取系统信息，如 uname


void hello_from_c();
int add(int a, int b);

void reverse_string(char *str);

int demo();

#endif
