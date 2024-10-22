SRC = $(shell find src/ -type f \( -name \*.c -o -name \*.rs \)) 
OBJS = $(SRC:=.o)
ADDIN = test.g3a
BIN = test.bin

FLAGS = -mb -m4a-nofpu -mhitachi

.SUFFIXES:
.PHONY: clean

setup:
	make -C libfxcg
	# bindgen wrapper.h -o bindings.rs

$(ADDIN): $(BIN)
	mkg3a -n basic:rust -i uns:icon.bmp -i sel:icon.bmp $(BIN) $(ADDIN)

$(BIN): $(OBJS)
	sh3eb-elf-gcc $(OBJS) -nostdlib -Tlibfxcg/toolchain/prizm.x -Llibfxcg/lib -lc -lfxcg -lgcc -o $(BIN)

%.c.o: %.c
	sh3eb-elf-gcc $(FLAGS) -Ilibfxcg/include -c $< -o $@

%.rs.o: %.rs
	sh3eb-elf-gccrs $(FLAGS) -frust-incomplete-and-experimental-compiler-do-not-use -c $< -o $@

clean:
	rm -rf $(ADDIN) $(BIN) $(OBJS)
