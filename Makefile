# 编译器设置
CC      = gcc
CXX     = g++

# 编译选项
CFLAGS  = -Wall -fPIC
CXXFLAGS= -std=c++17 -Wall -fPIC

# 项目内部头文件目录
INCLUDE_DIR = include

# ROS 2 头文件目录（外部依赖）
# 如果觉得过于繁琐，也可以直接使用 -I/opt/ros/humble/include
ROS2_INCLUDE = -I/opt/ros/humble/include/rcl \
               -I/opt/ros/humble/include/rcutils \
               -I/opt/ros/humble/include/rmw \
               -I/opt/ros/humble/include/rcl_yaml_param_parser \
               -I/opt/ros/humble/include/rosidl_runtime_c \
               -I/opt/ros/humble/include/rosidl_typesupport_interface \
			   -I/opt/ros/humble/include/rclcpp \
			   -I/opt/ros/humble/include/rcpputils \
			   -I/opt/ros/humble/include/builtin_interfaces \
			   -I/opt/ros/humble/include/rosidl_runtime_cpp \
			   -I/opt/ros/humble/include/tracetools \
			   -I/opt/ros/humble/include/rcl_interfaces \
			   -I/opt/ros/humble/include/libstatistics_collector \
			   -I/opt/ros/humble/include/statistics_msgs

# 源码和输出目录
SRC_DIR    = src
OUTPUT_DIR = build

# 目标文件和库
HELLO_OBJ  = $(OUTPUT_DIR)/hello.o
WRAPPER_OBJ= $(OUTPUT_DIR)/wrapper.o

LIBHELLO   = $(OUTPUT_DIR)/libhello.a
LIBWRAPPER = $(OUTPUT_DIR)/libwrapper.a

EXECUTABLE = $(OUTPUT_DIR)/hello

# 确保输出目录存在
$(shell mkdir -p $(OUTPUT_DIR))

# 编译 hello.c 生成对象文件（C 文件）
$(HELLO_OBJ): $(SRC_DIR)/hello.c
	$(CC) $(CFLAGS) $(INCLUDE_DIR:%=-I%) $(ROS2_INCLUDE) -c $(SRC_DIR)/hello.c -o $(HELLO_OBJ)

# 打包 hello.o 为静态库 libhello.a
$(LIBHELLO): $(HELLO_OBJ)
	ar rcs $(LIBHELLO) $(HELLO_OBJ)

# 编译 wrapper.cpp 生成对象文件（C++ 文件）
$(WRAPPER_OBJ): $(SRC_DIR)/wrapper.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE_DIR:%=-I%) $(ROS2_INCLUDE) -c $(SRC_DIR)/wrapper.cpp -o $(WRAPPER_OBJ)

# 打包 wrapper.o 为静态库 libwrapper.a
$(LIBWRAPPER): $(WRAPPER_OBJ)
	ar rcs $(LIBWRAPPER) $(WRAPPER_OBJ)

# 链接生成最终可执行文件
# 注意使用 CXX 链接，添加 -lrclcpp 链接 ROS2 rclcpp 库
$(EXECUTABLE): $(HELLO_OBJ) $(LIBHELLO) $(LIBWRAPPER)
	$(CXX) $(CXXFLAGS) $(INCLUDE_DIR:%=-I%) $(ROS2_INCLUDE) $(HELLO_OBJ) -L$(OUTPUT_DIR) -lhello -lwrapper -o $(EXECUTABLE) -L/opt/ros/humble/lib -lrclcpp

# 默认目标：构建所有目标
all: $(LIBHELLO) $(LIBWRAPPER) 

# 清理生成的文件
clean:
	rm -rf $(OUTPUT_DIR)
	rm -rf main