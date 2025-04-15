# 编译器
CC = gcc

# 编译选项
CFLAGS = -Wall -fPIC

# 本地头文件目录
INCLUDE_DIR = include

# ROS 2 头文件目录（外部依赖）
ROS2_INCLUDE = -I/opt/ros/humble/include/rcl -I/opt/ros/humble/include/rcutils -I/opt/ros/humble/include/rmw -I/opt/ros/humble/include/rcl_yaml_param_parser -I/opt/ros/humble/include/rosidl_runtime_c -I/opt/ros/humble/include/rosidl_typesupport_interface

# 静态库的输出文件
STATIC_LIB = build/libhello.a

# 可执行文件的输出
EXECUTABLE = build/hello

# 头文件和源文件目录
SRC_DIR = src

# 输出目录
OUTPUT_DIR = build

# 确保输出目录存在
$(shell mkdir -p $(OUTPUT_DIR))

# 编译静态库
$(STATIC_LIB): $(SRC_DIR)/hello.c
	$(CC) $(CFLAGS) $(INCLUDE_DIR:%=-I%) $(ROS2_INCLUDE) -o $(OUTPUT_DIR)/hello.o -c $(SRC_DIR)/hello.c
	ar rcs $(STATIC_LIB) $(OUTPUT_DIR)/hello.o  # 使用 ar 工具生成静态库

# 创建可执行文件
$(EXECUTABLE): $(OUTPUT_DIR)/hello.o $(STATIC_LIB)
	$(CC) $(CFLAGS) $(INCLUDE_DIR:%=-I%) $(ROS2_INCLUDE) $(OUTPUT_DIR)/hello.o -L$(OUTPUT_DIR) -lhello -o $(EXECUTABLE)

# 生成可执行文件（明确目标）
c: $(EXECUTABLE)

# 清理编译产生的文件
clean:
	rm -rf $(OUTPUT_DIR)
	rm -rf main