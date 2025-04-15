// hello.c
#include "hello.h"

void hello_from_c() {
    printf("Hello from C!\n");
}

int add(int a, int b) {
    return a + b;
}


// 一个简单的字符串逆序函数（不依赖非标准库函数）
void reverse_string(char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        char tmp = str[i];
        str[i] = str[len - 1 - i];
        str[len - 1 - i] = tmp;
    }
}


int demo() {
    // 1. 打印欢迎信息
    printf("Demonstrating built-in C tools on Ubuntu.\n\n");

    // 2. 使用 time.h 获取当前时间
    time_t now = time(NULL);
    if (now == -1) {
        perror("time");
        exit(EXIT_FAILURE);
    }
    printf("Current time: %s\n", ctime(&now));

    // 3. 利用 unistd.h 获取进程和用户信息
    printf("Process ID: %d\n", getpid());
    printf("Parent Process ID: %d\n", getppid());
    printf("User ID: %d, Group ID: %d\n\n", getuid(), getgid());

    // 4. 使用 sys/utsname.h 获取系统信息
    struct utsname sysInfo;
    if (uname(&sysInfo) == -1) {
        perror("uname");
        exit(EXIT_FAILURE);
    }
    printf("System Information:\n");
    printf("  System Name: %s\n", sysInfo.sysname);
    printf("  Node Name:   %s\n", sysInfo.nodename);
    printf("  Release:     %s\n", sysInfo.release);
    printf("  Version:     %s\n", sysInfo.version);
    printf("  Machine:     %s\n\n", sysInfo.machine);

    // 5. 利用 string.h 进行字符串操作
    char text[] = "Hello, Ubuntu!";
    printf("Original text: %s\n", text);
    reverse_string(text);
    printf("Reversed text: %s\n\n", text);

    // 6. 使用 stdlib.h 的 system() 调用系统命令(例如：列出当前目录内容)
    printf("Running system command 'ls -l':\n");
    int ret = system("ls -l");
    if (ret == -1) {
        perror("system");
    }

    // 7. interaction
    char input[256];
    printf("Please enter a string: ");
    if (fgets(input, sizeof(input), stdin) == NULL) {
        perror("fgets");
        exit(EXIT_FAILURE);
    }
    // 去掉尾部的换行符
    size_t len = strlen(input);
    if (len > 0 && input[len - 1] == '\n') {
        input[len - 1] = '\0';
    }
    printf("Original input: %s\n", input);
    reverse_string(input);
    printf("Reversed input: %s\n\n", input);

    return 0;
}