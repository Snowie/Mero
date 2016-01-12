import tty
import vga
import merosystem, isrs

proc kernel_early() {.exportc.} =
  gdtInstall()
  idtInstall()
  isrsInstall()

  terminalInitialize()
  terminalWrite("Initialized the terminal...\n")

proc kernel_main() {.exportc.} =
  terminalWrite("Hello, world!\n")
  terminalSetColor(makeVGAAttribute(LightGreen, Green))
  terminalWrite("Testing colors...\n")

  terminalSetColor(makeVGAAttribute(Green, Black))
  terminalWrite("Testing decimal writing with 8675309: ")
  terminalWriteDecimal(8675309)
  terminalWrite("\n")

  terminalWrite("Testing hex writing with 0xDEADBEEF: ")
  terminalWriteHex(cast[uint](0xDEADBEEF))
  terminalWrite("\n")

  #Test exceptions...
  terminalWriteDecimal(1 div 0)