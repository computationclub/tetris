all: run

run: Tetris.hack
	$(HACK_JS) Tetris.hack

clean:
	rm -f *.vm *.asm *.hack

%.vm: %.jack
	$(JACK_COMPILER) $< > $@

Tetris.asm: Main.vm Grid.vm
	$(VM_TRANSLATOR) --init Main.vm Grid.vm lib/*.vm > Tetris.asm

%.hack: %.asm
	$(HACK_ASSEMBLER) $< > $@

.PHONY: all run
