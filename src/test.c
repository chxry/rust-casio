#include <fxcg/display.h>
#include <fxcg/keyboard.h>
#include <stdio.h>

extern int rust_silly();

void main(void) {
    char buf[64];
    sprintf(buf, "num from rust %i", rust_silly());
    
    Bdisp_AllClr_VRAM();
    Print_OS(buf, 0, 0);

    int key;
    while (1) {
        GetKey(&key);

        if (key == KEY_CTRL_EXE) {
            break;
        }
    }
 
    return;
}
