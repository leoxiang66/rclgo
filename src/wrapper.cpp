#include "wrapper.h"
#include <rclcpp/rclcpp.hpp>

extern "C" {

int init_ros() {
    int argc = 0;
    char **argv = nullptr;
    rclcpp::init(argc, argv);
    std::cout << "成功init ros" << std::endl;
    return 0;
}

void shutdown_ros() {
    rclcpp::shutdown();
    std::cout << "成功关闭ros" << std::endl;
}

} // extern "C"