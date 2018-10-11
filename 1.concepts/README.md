### a) Registers
Registers are part of processors that hold 64 bits of data. It can hold values ranging from 0 - 2^64.

1. rip - instruction pointer
2. rax - register a extended(accumulator)
3. rbx -  register b extended(base)
4. rcx - register c extended(count)
5. rdx - register d extended
6. rbp -  register base pointer (start of stack)
7. rsp -  register stack pointer (current location in stack, growing downwards)
7. rsi - register source index (source for data copies)
8. rdi - register destination index (destination for data copies)
9. r8 - register 8
10. r9 - register 9
11. r10 - register 10
12. r11 - register 11
13. r12 - register 12
14. r13 - register 13
15. r14 - register 14
16. r15 - register 15

### b) Flags
Flag can also hold data (only one bit of data true or false)

1. Carry Flag (CF)
2. Parity Flag (PF)
3. Zero Flag (ZF)
4. Sign Flag(SF)
5. Overflow Flag(OF)
6. Adjust Flag(AF)
7. Interrupt Enabled(IE)
8. DF - Direction flag
9. OF - Overflow flag

### c) Pointers
Pointers are also registers that holds data. They hold "point to" data, meaning they hold memory address.

1. Index pointer(rip) - Points the next address to be executed in the control flow
2. Stack Pointer(rsp) - Points to the top of address stack
3. Stack Base Pointer (rbp) - Points to the bottom of the address stack
.....

##### i) Registers As pointers
  To treat register as pointer, rax becomes [rax]
```asm
  mov rax, rbx ;Loads the value of rbx into the rax
  mov rax, [rbx] ;Loads the value of rbx pointing to into the rbx
```

### d) Control flow
All program runs from top to bottom
rip - instruction pointer, holds the address of the next instruction to be executed
```asm
_start:
    mov       rax, 1  ; rip = x
    mov       rdi, 1  ; rip = x + 1
    mov       rsi, msg ; rip = x + 2
    mov       rdx, 11 ; rip = x + 3
    syscall ; rip = x + 4
```

#### i) Comparisons
 Comparisons allow program to take different path based on certain conditions, after making comparisons certain flags are section
 for eg a = b ZF is set to 1, a != b ZF is set to 0

```asm
  cmp rax, 23 ;compares value of rax with 23
  cmp rax, rbx ; compares value of rax with the value stored in rbx
```

#### ii) Conditional jumps
  Conditional jumps can be made after comparison.
```asm
  cmp rax, 23
  je _doThis ; equals

  cmp rax, rbx
  je _doThat ; greater
```

#### iii) Call
 Call is also a type of jump, where it jumps to a subroutine and returns to the previous execution once the subroutine execution is complete.
 ```asm
 _start:
     call _exitTerminal ; calls subroutine

 _exitTerminal:
     mov       rax, 60
     mov       rdi, 1
     syscall
     ret     
 ```

## Credits
Thanks to [Kupala](https://www.youtube.com/playlist?list=PLetF-YjXm-sCH6FrTz4AQhfH6INDQvQSn) and  [senecacollege](https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start) most of the content are obtained from his video tutorial series.
