;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
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
main:
            mov.w   PC, R4                  ; Copy PC to R4. Its copy note cutted
            mov.w   R4, R5                  ; Copy R4 to R5. move word. 16 bit
            mov.w   R5, R6                  ; Copy R5 to R6

            mov.b   PC, R7                  ; Copy LB of PC to R7. move byte. 8 bit
            mov.b   R7, R8                  ; Copy LB of R7 to R8
            mov.b   R8, R9                  ; Copy LB of R8 to R9

            mov.w   SP, R10                 ; Copy SP to R10
            mov.w   R10, R11                ; Copy R10 to R11
            mov.w   R11, R12                ; Copy R11 to R12

            mov.b   SP, R13                 ; Copy LB of SP to R13
            mov.b   R13, R14                ; Copy LB of R13 to R14
            mov.b   R14, R15                ; Copy LB of R14 to R15

            
            jmp     main
                                            

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
            
