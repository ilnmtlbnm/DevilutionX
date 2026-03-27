# --- Build feature flags ---
set(BUILD_TESTING OFF)
set(BUILD_ASSETS_MPQ OFF)
# Disable all networking — removes ASIO dependency, enables single-threaded build.
set(NONET ON)

# --- Vendored library overrides ---
set(DEVILUTIONX_SYSTEM_SDL_AUDIOLIB OFF)
set(DEVILUTIONX_SYSTEM_LIBSODIUM OFF)
set(DEVILUTIONX_SYSTEM_LIBFMT OFF)

# Emscripten's bzip2 port fails to link.
set(DEVILUTIONX_SYSTEM_BZIP2 OFF)

# --- Persistent storage ---
add_link_options(-lidbfs.js)

# --- LTO disabled ---
# LTO causes function-signature mismatches in TSV enum parsers.
add_compile_options(-fno-lto)
add_link_options(-fno-lto)

# --- Memory ---
add_link_options(-sALLOW_MEMORY_GROWTH=1)

# --- Runtime lifecycle ---
add_link_options(-sEXIT_RUNTIME=1)

# --- Asyncify ---
add_link_options(-sASYNCIFY)
add_link_options(-sASYNCIFY_STACK_SIZE=1048576)

# --- Copy packaging assets ---
file(COPY "${CMAKE_CURRENT_SOURCE_DIR}/Packaging/emscripten/index.html" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
