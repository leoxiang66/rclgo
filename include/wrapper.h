#ifndef WRAPPER_H
#define WRAPPER_H

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief 初始化 ROS 2，内部调用 rclcpp::init()。
 *
 * 当前实现调用 rclcpp::init(0, nullptr)，不传递任何命令行参数。
 *
 * @return int 返回 0 表示成功。
 */
int init_ros();

/**
 * @brief 关闭 ROS 2，内部调用 rclcpp::shutdown()。
 */
void shutdown_ros();

#ifdef __cplusplus
}
#endif

#endif // WRAPPER_H