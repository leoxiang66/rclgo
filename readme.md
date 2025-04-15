# 在GO中调用C函数

General steps:

1. compile C codes to **static libraries (.a)** instead of dynamic libraries (.so)
    - 这是因为静态库会被直接bundle到go的binary文件中
    - 而动态库不会， 需要额外设置运行时链接库的路径
2. build and run Go


```
make clean
make
go build main.go
./main
```