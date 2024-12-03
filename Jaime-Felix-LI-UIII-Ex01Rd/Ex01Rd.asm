					TITLE	Programa para determinar si un n�mero es divisible entre tres una macro
					PAGE	60, 132

; Incluir las macros
Include Macros.inc

; MacroDivisibleTres para determinar si un n�mero es divisible entre tres
; Par�metros de entrada: Numero
; Par�metros de salida: Resultado
; NOTA: Resultado = 1 es divisible. Resultado = 0 no es divisible

MacroDivisibleTres	MACRO	Numero, Resultado
					; Guardar los registros utilizados

					; Almacenar el resultado en el par�metro de salida

					; Recuperar los registros
					ENDM

; Prototipos de llamadas al sistema operativo
GetStdHandle	PROTO	:QWORD
ReadConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD
WriteConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD
ExitProcess		PROTO	CodigoSalida:QWORD

				.DATA
Num				QWORD	0
Res				QWORD	0
MenEnt01		WORD	'P', 'r', 'o', 'p', 'o', 'r', 'c', 'i', 'o', 'n', 'e', ' ', 'u', 'n', ' ', 'n', '�', 'm', 'e', 'r', 'o', ':', ' '
MenSal01		WORD	'E', 'l', ' ', 'n', '�', 'm', 'e', 'r', 'o', ' ', 'e', 's', ' ', 'd', 'i', 'v', 'i', 's', 'i', 'b', 'l', 'e', ' ', 'e', 'n', 't', 'r', 'e', ' ', '3', '.'

; Variables utilizadas por las llamadas al sistema
ManejadorE		QWORD	?
ManejadorS		QWORD	?
Caracteres		QWORD	?
Texto			WORD	13 DUP ( ? )				; Variable temporal para conversi�n Entero - Cadena, Cadena - Entero
SaltoLinea		WORD	13, 10
STD_INPUT		EQU		-10
STD_OUTPUT		EQU		-11

				.CODE
Principal		PROC

				; Alinear espacio en la pila
				SUB		RSP, 40

				; Obtener manejador est�ndar del teclado
				MOV		RCX, STD_INPUT
				CALL	GetStdHandle
				MOV		ManejadorE, RAX

				; Obtener manejador est�ndar de la consola
				MOV		RCX, STD_OUTPUT
				CALL	GetStdHandle
				MOV		ManejadorS, RAX

				; Solicitar la variable Num

				; Llamar la macro para determinar si el n�mero es divisible entre tres

				; Mostrar el mensaje de salida correspondiente seg�n el resultado

				; Salto de l�nea
				MOV		RCX, ManejadorS				; Manejador de la consola donde se escribe
				LEA		RDX, SaltoLinea				; Direcci�n de la cadena a escribir
				MOV		R8, LENGTHOF SaltoLinea		; N�mero de caracteres a escribir
				LEA		R9, Caracteres				; Direcci�n de la variable donde se guarda el total de caracteres escrito
				MOV		R10, 0						; Reservado para uso futuro
				CALL	WriteConsoleW

				; Salir al sistema operativo
				MOV		RCX, 0
				CALL	ExitProcess

Principal		ENDP
				END