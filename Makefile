# =============================================================================
# Makefile - RAPID PC-side build
#
# Requirements:
#   MinGW-w64 / MSYS2 UCRT64  (gcc must be on PATH)
#   Windows (uses Win32 serial API)
#
# Usage:
#   make          - build build/RAPID.exe
#   make clean    - remove build artefacts
#   make gui      - launch the Python GUI
# =============================================================================

# ---- Toolchain ---------------------------------------------------------------
CC      := gcc
CFLAGS  := -O2 -Wall -Wextra -std=c11
LDFLAGS := -lm

# ---- Directories -------------------------------------------------------------
SRCDIR   := src
BUILDDIR := build

# ---- Target ------------------------------------------------------------------
TARGET := $(BUILDDIR)/RAPID.exe

SRCS := $(SRCDIR)/main.c $(SRCDIR)/inputParser.c $(SRCDIR)/serial.c
OBJS := $(SRCS:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)
DEPS := $(OBJS:.o=.d)

# ---- Runtime defaults --------------------------------------------------------
PORT := COM25
FILE := input.gds

# ==============================================================================

.PHONY: all clean gui

all: $(TARGET)

$(TARGET): $(OBJS) | $(BUILDDIR)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	@echo "Built $@"

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/%.o: $(SRCDIR)/%.c | $(BUILDDIR)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

-include $(DEPS)

VENV_PYTHON   := venv/Scripts/python
SYSTEM_PYTHON := python

gui:
	@if [ -f venv/Scripts/python.exe ]; then \
		$(VENV_PYTHON) src/gui.py; \
	else \
		$(SYSTEM_PYTHON) src/gui.py; \
	fi

clean:
	rm -rf $(BUILDDIR)
