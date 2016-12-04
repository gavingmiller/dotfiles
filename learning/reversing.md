
### Instructions

Instructions are written as: `XXX dst, src`.
AT&T instructions are opposite

* NOP  - actually equal to: `xchg eax, eax`
* PUSH - push word onto the stack (numeric constant or register value)
  * decrements the stack pointer (esp) by 4.
* POP  - pop word off of the stack onto a register
  * increments the stack pointer (esp) by 4.
* CALL - transfer control to a different function. "Change the EIP"
  * Push address of the next instruction onto the stack
    * for use by RET when the procedure is done
  * Then change EIP to address given to CALL
  * Destination can be specified in multiple ways:
    * Absolute address
    * Relative address - to the end of the instruction
* RET  - 2 forms:
  * RET
    * pop top of stack into eip
    * typically cdecl functions
  * RET 0x8
    * pop top of stack into eip and add constant to esp
    * typically stdcall
* MOV  -
  * register to register
  * memory to register, register to memory
  * immediate to register, immediate to memory
  * never memory to memory

### Register Conventions

Per intel's suggestions and not always used according to convention. 16/8 bit
versions exist for most of the below registers in a reduced notation.
See page 26, 27 of [2].

* EAX - Store function return values --> see a mov into eax before return
  * Also the accumulator register
* EBX - Base pointer to data section
  * used to in position independent code: linux
* ECX - Counter for string and loop operations
* EDX - I/O pointer

* ESI - source pointer for string operations
* EDI - destination pointer for string operations

* ESP - Stack pointer
  * Top of the stack
* EBP - Stack frame base pointer (b for base)
  * Each new function gets a new base frame
  * Area between ESP - EBP is what a function "owns"
* EIP - pointer to next instruction to execute (indirect control)
  * cannot directly set

----

EFLAGS - register that holds single bit flags

* ZF - zero flag set if some instruction is zero
* SF - sign flag set to most significant bit of result 0 positive, 1 negative
  * see page 18 in [2] for negative numbers
* What are the other eflags?

----

Functions share responsibility for not smashing each other's registers. This exhibits itself
in values getting shuffled on/off the stack.

* caller-save registers (eax, edx, ecx)
  * caller is in charge of saving the value before calling a subroutine and restoring
  the value after the call returns (IE: the cellee can modify values in eax, edx, & ecx)

* callee-save reigsters (ebp, ebx, esi, edi)
  * The callee is responsible for making sure these values are saved & restored
  * The callee must be a good citizen and not modify values the caller didn't save

### The Stack

* Stack is FILO - push data onto the top of the stack and pop off the top
  * Stack grows towards lower memory addresses
  * Per harry: draw sideways
* ESP points to the top of the stack; lowest address being used
* < ESP is considered undefined

### Stack Frame

```
+-------------------------+\              stack bottom
| Local Vars              | \---------> +-------------------------+
+-------------------------+             | main() frame            |
| Caller-save regs        |     ------> +-------------------------+
+-------------------------+    /        | subroutine() frame      |
| args to callee          |   /     --> +-------------------------+
+-------------------------+  /     /    | undef                   |
| Caller's saved ret addr | /     /     +-------------------------+
+-------------------------+/     /        stack top
| Saved frame ptr         |     /
+-------------------------+    /
| Callee-save regs        |   /
+-------------------------+  /
| Local vars              | /
+-------------------------+/

-- And this continues as new functions get pushed onto the stack
```

### Calling Conventions

* cdecl - most common convention
  * function params pushed right to left `fn(a, b, c, d) => push d, push c, push b, push a, call fn`
  * saves old stack frame and sets up a new stack frame
  * *caller cleans up stack*
* stdcall
  * same as cdecl
  * EXCEPT callee responsible for cleain up stack params
  * Usually MS C++ code -- Win32 API


# Refs

* [1] [Day 1, Part 1](https://www.youtube.com/watch?v=H4Z0S9ZbC0g&list=PL038BE01D3BAEFDB0)
* [2] [Day 1 Slides](http://opensecuritytraining.info/IntroX86_files/IntroductionToIntelx86-Part1.pdf)
* [3] [Day 1, Part 2](https://www.youtube.com/watch?v=3ulCFewbj-I&list=PL038BE01D3BAEFDB0&index=2)
