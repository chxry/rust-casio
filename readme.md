# rust on the casio??

this is hell please just write c

if you really must then youll need
- [gccrs](https://github.com/Rust-GCC/gccrs) and gnu binutils with `--target=sh3eb-elf`
- [mkg3a](https://gitlab.com/taricorp/mkg3a)
- if i actually make bindings then also [rust-bindgen cli](https://rust-lang.github.io/rust-bindgen/command-line-usage.html)

tested on the cg50 but should work on other prizm calculators
