package main


/*
#cgo CFLAGS: -I./include -I/opt/ros/humble/include/rcl -I/opt/ros/humble/include/rcutils -I/opt/ros/humble/include/rmw -I/opt/ros/humble/include/rcl_yaml_param_parser -I/opt/ros/humble/include/rosidl_runtime_c -I/opt/ros/humble/include/rosidl_typesupport_interface
#cgo LDFLAGS: -L./build -lhello
#include "hello.h"
*/
import "C"
import (
    "fmt"
)


func main() {
    // 调用 C 函数
    C.hello_from_c()

    // 调用 C 函数并获取返回值
    result := C.add(3, 5)
    fmt.Printf("Result of add(3, 5) from C: %d\n", result)

}