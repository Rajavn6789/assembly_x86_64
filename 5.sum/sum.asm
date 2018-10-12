; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.

; To assemble and run:
; nasm -f elf64 -o sum.o sum.asm && ld sum.o -o sum
; ----------------------------------------------------------------------------------------
section .data
  digit db 0,10
  num1: equ 1
  num2: equ 2

section .text
  global _start

_start:
    mov rax, num1
    mov rbx, num2
    add rax, rbx
    
    call _printRAXDigit
    call _exitTerminal

_printRAXDigit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret

_exitTerminal:
    mov       rax, 60
    mov       rdi, 1
    syscall
    ret
