# =============================================================================
# Makefile – RAPID PC-side build
#
# Builds transmission.exe: the PC utility that reads a GDS input file,
# converts coordinates to polar, and streams them over UART to the FPGA.
#
# Requirements:
#   MinGW-w64 / MSYS2 UCRT64  (gcc must be on PATH)
#   Windows (uses Win32 serial API)
#
# Usage:
#   make              – build transmission.exe
#   make clean        – remove build artefacts
#   make run          – build and run (uses default PORT and FILE below)
#   make run PORT=COM3 FILE=my.gds
#
# Note:
#   fpgaCommunication.c and fgpaConfiguration.c target the Zynq PS bare-metal
#   environment and must be built inside Xilinx Vitis / SDK, not here.
# =============================================================================

# ---- Toolchain ---------------------------------------------------------------
CC      := gcc
CFLAGS  := -O2 -Wall -Wextra -std=c11
LDFLAGS := -lm

# ---- Build directory ---------------------------------------------------------
BUILDDIR := build

# ---- Target ------------------------------------------------------------------
TARGET  := $(BUILDDIR)/transmission.exe

# ---- Sources -----------------------------------------------------------------
SRCS    := pcCommunication.c inputParser.c
OBJS    := $(addprefix $(BUILDDIR)/, $(SRCS:.c=.o))
DEPS    := $(OBJS:.o=.d)

# ---- Runtime defaults (override on command line) -----------------------------
PORT    := COM25
FILE    := input.gds

# ==============================================================================

.PHONY: all clean run

all: $(TARGET)

# Create build directory if it doesn't exist
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Link
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	@echo "Built $@"

# Compile into build/ with automatic dependency tracking
$(BUILDDIR)/%.o: %.c | $(BUILDDIR)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

# Pull in generated header dependency files (silently ignored on first build)
-include $(DEPS)

# Run the built executable
run: $(TARGET)
	./$(TARGET) $(PORT) $(FILE)

# Remove all build artefacts
clean:
	rm -rf $(BUILDDIR)
