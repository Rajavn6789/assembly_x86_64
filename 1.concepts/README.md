## Registers
Registers are part of processors that temporarily holds memory, In x86_64 architecture registers hold 64 bits or 8 bytes. It can hold values ranging from 0 - 2^64

1. rip - instruction pointer
2. rax - accumulator
3. rbx - base
4. rcx - count
5. rdx - data
6. r8-15
7. rsi - source index
8. rdi - destination index
9. rbp - base pointer
10. rsp - stack pointer

## Flags
Like registers flag can hold data - 1 bit (true or false)

1. Carry Flag (CF)
2. Parity Flag (PF)
3. Zero Flag (ZF)
4. Sign Flag(SF)
5. Overflow Flag(OF)
6. Adjust Flag(AF)
7. Interrupt Enabled(IE)

## Pointers
Pointers are registers that holds the memory address data

1. Index pointer(rip) - Points the next address to be executed in the control flow
2. Stack Pointer(rsp) - Points to the top of address stack
3. Stack Base Pointer (rbp) - Points to the bottom of the address stack
.....

## Control flow
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

## Comparisons
 Comparisons allow program to take different path based on certain conditions, after making comparisons certain flags are section
 for eg a = b ZF is set to 1, a != b ZF is set to 0

```asm
  cmp rax, 23
  cmp rax, rbx
```

## Conditional jumps
  Conditional jumps can be made after comparison.
```asm
  cmp rax, 23
  je _doThis ; equals

  cmp rax, rbx
  je _doThat ; greater
```
## Registers As pointers
  To treat register as pointer, rax becomes [rax]
```asm
  mov rax, rbx - Loads the value of rbx into the rax
  mov rax, [rbx] - Loads the value of rbx pointing to into the rbx
```
