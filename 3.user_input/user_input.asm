; ----------------------------------------------------------------------------------------
; Gets User input and publish it in the terminal. Runs on 64-bit Linux only.

; To assemble and run:
; nasm -f elf64 -o user_input.o user_input.asm && ld user_input.o -o user_input
; ----------------------------------------------------------------------------------------

section .data
  text1:  db  "What is your name? "
  text2:  db  "hello, "

section .bss
  name:  resb  18 ; reserve 18 bytes

section .text
  global _start

_start:
    call _askName
    call _getName

    call _printHello
    call _printName

    call _exitTerminal

_askName:
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, text1
    mov       rdx, 19
    syscall
    ret

_getName:
    mov       rax, 0 ; 0 is to get input
    mov       rdi, 0
    mov       rsi, name
    mov       rdx, 19
    syscall
    ret

_printHello:
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, text2
    mov       rdx, 7
    syscall
    ret

_printName:
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, name
    mov       rdx, 19
    syscall
    ret

_exitTerminal:
    mov       rax, 60
    mov       rdi, 1
    syscall
    ret
