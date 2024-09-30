TITLE HW_2_Phouthavong.asm
; Header comment block as shown in lecture notes

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.data
; Part 3: Symbolic Constant
SECONDS_IN_DAY EQU 24 * 60 * 60  ; Number of seconds in a day

; Part 4: Variables for arithmetic operation
A SDWORD 781379d           ; A = +781379 (signed)
B SDWORD 010101101011b      ; B = 010101101011 (signed)
C_value DWORD 0FAC8h        ; Renamed from C to C_value (unsigned)
D SDWORD -57d               ; D = -57 (signed)

.code
main PROC
    ; Part 1: Compute the product 2 * 3 * 4 * 5 * 6 * 7
    xor ax, ax             ; Zero out AX register
    mov ax, 2              ; Initialize AX with 2
    imul ax, 3             ; Multiply AX by 3
    imul ax, 4             ; Multiply AX by 4
    imul ax, 5             ; Multiply AX by 5
    imul ax, 6             ; Multiply AX by 6
    imul ax, 7             ; Multiply AX by 7

    ; Display register values for Part 1
    call DumpRegs  
    call WaitMsg           ; Pause execution


    ; Part 2: Set Carry and Overflow Flags
    ; Zero out EBX register for carry flag
    xor ebx, ebx
    add ebx, 0FFFFFFFFh     ; Adding max value to cause carry flag

    ; Zero out ECX register for overflow flag
    xor ecx, ecx
    add ecx, 7FFFFFFFh      ; Adding large value to cause overflow

    ; Display register values for Part 2
    call DumpRegs  
    call WaitMsg           ; Pause execution


    ; Part 3: Compute seconds in a day
    xor edx, edx            ; Zero out EDX register
    mov edx, SECONDS_IN_DAY ; Store the value of SECONDS_IN_DAY in EDX

    ; Display register values for Part 3
    call DumpRegs  
    call WaitMsg           ; Pause execution


    ; Part 4: Compute A = (A - B) + (C - D)
    xor eax, eax            ; Zero out EAX register
    xor ecx, ecx            ; Zero out ECX register

    ; A - B
    mov eax, A
    sub eax, B

    ; C_value - D
    mov ecx, C_value
    sub ecx, D

    ; (A - B) + (C_value - D)
    add eax, ecx

    ; Store the result in variable A
    mov A, eax

    ; Display the result in EAX using WriteInt
    call WriteInt

    ; Display register values for Part 4
    call DumpRegs  
    call WaitMsg           ; Pause execution


    ; Exit the program correctly before ending the procedure
    exit
main ENDP
END main