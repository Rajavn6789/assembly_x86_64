; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.

; To assemble and run:
; nasm -f elf64 -o conditions.o conditions.asm && ld conditions.o -o conditions
; ----------------------------------------------------------------------------------------

section .data
  num1: equ 1
  num2: equ 2
  msg1:	db "Sum is equal to 3", 10
  msg1len: equ $ - msg1
  msg2:	db "Sum is not equal to 3", 10
  msg2len: equ $ - msg2

section .text
  global _start

; TODO: get number from arg c and check
_start:
    mov rax, num1
    mov rbx, num2
    add rax, rbx ; add rbx -> rax
    cmp	rax, 4 ; compare 4 with rax value

    je _successBlock
    jne _failureBlock

_successBlock:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, msg1len
    syscall
    call _exitTerminal

_failureBlock:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, msg2len
    syscall
    call _exitTerminal

_exitTerminal:
    mov       rax, 60
    mov       rdi, 0
    syscall
    ret
