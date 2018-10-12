; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.

; To assemble and run:
; nasm -f elf64 -o hello.o hello.asm && ld hello.o -o hello
; ----------------------------------------------------------------------------------------

section .data
  msg:  db  "Hello, World", 10 ; msg-> name assigned to address in memory db -> define bytes  "Hey, World", 10 -> defined bytes
  msglen: equ $ - msg

section .text
  global _start

_start:
    call _printHello
    call _exitTerminal

_printHello:
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, msg
    mov       rdx, msglen
    syscall
    ret

_exitTerminal:
    mov       rax, 60
    mov       rdi, 1
    syscall
    ret
