@echo off
rem Display all commands before executing them.

set LLVM_VERSION=%1
set LLVM_REPO_URL=%2

if "%LLVM_REPO_URL%" == "" (
    set LLVM_REPO_URL=https://github.com/llvm/llvm-project.git
)

if "%LLVM_VERSION%" == "" (
    echo "Usage: $0 <llvm-version> <llvm-repository-url>"
    echo
    echo "# Arguments"
    echo "  llvm-version         The name of a LLVM release branch without the \`release/\` prefix"
    echo "  llvm-repository-url  The URL used to clone LLVM sources (default: https://github.com/llvm/llvm-project.git)"
) else (
	rem Clone the LLVM project.
	if not exist llvm-project (
	  git clone "%LLVM_REPO_URL%" llvm-project
	)

	cd llvm-project
	git fetch origin
	git checkout "release/%LLVM_VERSION%"

	rem Create a directory to build the project.
	mkdir build
	cd build

	rem Create a directory to receive the complete installation.
	mkdir install

	rem Adjust compilation based on the OS.
	set CMAKE_ARGUMENTS=""

	rem Run `cmake` to configure the project.
	cmake ^
	  -G Ninja ^
	  -DCMAKE_BUILD_TYPE=Release ^
	  -DCMAKE_INSTALL_PREFIX="install" ^
	  -DLLVM_ENABLE_PROJECTS="clang;lld" ^
	  -DLLVM_ENABLE_TERMINFO=OFF ^
	  -DLLVM_ENABLE_ZLIB=OFF ^
	  -DLLVM_INCLUDE_DOCS=OFF ^
	  -DLLVM_INCLUDE_EXAMPLES=OFF ^
	  -DLLVM_INCLUDE_GO_TESTS=OFF ^
	  -DLLVM_INCLUDE_TESTS=OFF ^
	  -DLLVM_INCLUDE_TOOLS=ON ^
	  -DLLVM_INCLUDE_UTILS=OFF ^
	  -DLLVM_OPTIMIZED_TABLEGEN=ON ^
	  -DLLVM_TARGETS_TO_BUILD="X86;AArch64" ^
	  %CMAKE_ARGUMENTS% ^
	  ../llvm

	cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="install" -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_ENABLE_TERMINFO=OFF -DLLVM_ENABLE_ZLIB=OFF -DLLVM_INCLUDE_DOCS=OFF -DLLVM_INCLUDE_EXAMPLES=OFF -DLLVM_INCLUDE_GO_TESTS=OFF -DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_TOOLS=ON -DLLVM_INCLUDE_UTILS=OFF  -DLLVM_OPTIMIZED_TABLEGEN=ON -DLLVM_TARGETS_TO_BUILD="X86;AArch64" ../llvm

	rem Showtime!
	ninja install
)
