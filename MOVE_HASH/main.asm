;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
; Chapter 6 - MOV Instruction with Immediate Mode (#N) Addressing
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------

Main:
            mov.w   #1234h, R4              ; Move 1234h to R4. h for hex
            mov.w   #0FACEh, R5             ; Move 0FACEh to R5

            mov.b   #99h, R6                ; Move 99h to R6
            mov.b   #0FFh, R7               ; Move 0FFh to R7 

            mov.w   #371, R8                ; Move 123 to R8. no h for decimal
            mov.b   #010101010b, R9         ; Move 010101010b to R9. b for binary
            mov.b   #'B', R10               ; Move 'B' to R10. ' for char. ASCI Code for B is 0x000042
            



            jmp     Main                   ; Loop forever
                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            