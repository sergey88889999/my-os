; boot.asm
org 0x7C00

jmp start

message db 'Hello, Bootable Floppy!', 0
message_len equ $ - message

start:
  mov ah, 0x0E ; функция для вывода символа
  mov bh, 0x00 ; страница экрана
  mov bl, 0x07 ; цвет символа
  mov al, 'H'  ; символ для вывода
  int 0x10     ; вызов BIOS для вывода символа
  ; Здесь вы можете добавить код для вывода других символов

hang:
  jmp hang     ; бесконечный цикл

times 510-($-$$) db 0 ; Заполните оставшиеся байты с нулями
dw 0xAA55             ; Завершающая сигнатура
