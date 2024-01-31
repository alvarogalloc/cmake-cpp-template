SRC_FILES = $(shell find src/ -type f -name '*')
INCLUDE_FILES = $(shell find include/ -type f -name '*')
BUILD_FILES = $(shell find build/  -type f -name '*.ninja')

config: CMakeLists.txt $(BUILD_FILES) vcpkg.json
	@mkdir -p build
	@cmake -S . -B build \
		-G "Ninja" \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=ON

build: config $(SRC_FILES) $(INCLUDE_FILES)
	@cmake --build build

format:
	@echo "Formatting with cppcheck"
	@clang-format -i src/**.cpp include/**.h --sort-includes

lint:
	@echo "Linting with cppcheck"
	@cppcheck --enable=all src

clean:
	@rm -rf build
