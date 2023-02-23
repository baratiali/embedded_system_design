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

init:
            bic.w   #0001h, &PM5CTL0        ; Disable GPIO power-on default high-impedance mode
            bic.b   #01h,   &P1DIR          ; Set P1.0 to output direction

main:
            xor.b   #01h, &P1OUT            ; Toggle P1.0 using exclusive-OR
            mov.w   #0ffffh, R4             ; Delay. Puts a big number in R4 to make a delay
delay:
            dec.w   R4                      ; Decrement R4
            jnz     delay                   ; If R4 is not zero, jump back to delay
            jmp     main                    ; Jump back to main. repeat main forever

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
            