package main


/*
#cgo CFLAGS: -I/opt/ros/humble/include/rcl               -I/opt/ros/humble/include/rcutils               -I/opt/ros/humble/include/rmw               -I/opt/ros/humble/include/rcl_yaml_param_parser               -I/opt/ros/humble/include/rosidl_runtime_c               -I/opt/ros/humble/include/rosidl_typesupport_interface 		   -I/opt/ros/humble/include/rclcpp 		   -I/opt/ros/humble/include/rcpputils 		   -I/opt/ros/humble/include/builtin_interfaces 		   -I/opt/ros/humble/include/rosidl_runtime_cpp 		   -I/opt/ros/humble/include/tracetools 		   -I/opt/ros/humble/include/rcl_interfaces 		   -I/opt/ros/humble/include/libstatistics_collector 		   -I/opt/ros/humble/include/statistics_msgs -I./include
#cgo LDFLAGS: -L./build -L/opt/ros/humble/lib -lhello -lwrapper -lrclcpp -lrcutils -lstdc++
#include "hello.h"
#include "wrapper.h"
*/
import "C"
import (
    // "fmt"
)

// C只需要include "hello.h"

func main() {
    // 调用 C 函数
    // C.hello_from_c()

    // // 调用 C 函数并获取返回值
    // result := C.add(3, 5)
    // fmt.Printf("Result of add(3, 5) from C: %d\n", result)

    // C.demo()

    C.init_ros()

    C.shutdown_ros()

}