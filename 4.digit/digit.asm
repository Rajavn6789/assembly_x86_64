; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.

; To assemble and run:
; nasm -f elf64 -o digit.o digit.asm && ld digit.o -o digit
; ----------------------------------------------------------------------------------------
section .data
  digit db 0,10

section .text
  global _start

_start:
    mov rax, 1
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
