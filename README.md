# 前言

- 平台：Ubuntu22.04
- 本项目初衷是构建一个能集成命令行工具的FPGA开发环境
- 并且，如题，方便chisel生成后一键调用

# TODO

# 闲言碎语
本平台为南邮大三课设量身打造（樂

如果多年后看到这个项目是什么样子

此时正在进行ysyx第六期PA2.1阶段

自动化构建平台确实比GUI感觉高级多了

我想用Chisel把这次作业做了

虽然很有可能最终坚持不下去，

可能最终还是突击两小时verilog糊上屎山交上去，

但如果做成了，

这就是我第一个Chisel完成的数字电路项目

至少南邮历史应该是第一位吧

这点自信还是有的（也就这点出息了

# chisel模板
from（https://github.com/OpenXiangShan/chisel-playground）

Chisel Project Template
=======================

Another version of the [Chisel template](https://github.com/ucb-bar/chisel-template) supporting mill.
mill is another Scala/Java build tool without obscure DSL like SBT. It is much faster than SBT.

Contents at a glance:

* `.gitignore` - helps Git ignore junk like generated files, build products, and temporary files.
* `build.sc` - instructs mill to build the Chisel project
* `Makefile` - rules to call mill
* `playground/src/GCD.scala` - GCD source file
* `playground/src/DecoupledGCD.scala` - another GCD source file
* `playground/src/Elaborate.scala` - wrapper file to call chisel command with the GCD module
* `playground/test/src/GCDSpec.scala` - GCD tester

Feel free to rename or delete files under `playground/` or use them as a reference/template.

## Getting Started

First, install mill by referring to the documentation [here](https://com-lihaoyi.github.io/mill).

To run all tests in this design (recommended for test-driven development):
```bash
make test
```

To generate Verilog:
```bash
make verilog
```

## Change FIRRTL Compiler

You can change the FIRRTL compiler between SFC (Scala-based FIRRTL compiler) and
MFC (MLIR-based FIRRTL compiler) by modifying the `useMFC` variable in `playground/src/Elaborate.scala`.
The latter one requires `firtool`, which is included under `utils/`.
