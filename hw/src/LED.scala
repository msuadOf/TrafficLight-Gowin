package LED

import chisel3._

class top(s:Int) extends Module {
  val io = IO(new Bundle {
    val o   = Output(Bool())
  })
  val cnt=RegInit(UInt(32.W),0.U)
    io.o:=false.B
  when(cnt === (12000000.U * s.U)){
    cnt:=0.U
    io.o := ~ io.o
  }
  cnt:=cnt+1.U

}