# Exported from https://tiplanet.org/pb/ on Sun Sep  6 17:20:50 2020 (CEST)

# ----------------------------
# Program Options
# ----------------------------

NAME         ?= CNTAGION
ICON         ?= icon.png
DESCRIPTION  ?= "Contagion CE 2.0.0"
COMPRESSED   ?= YES
ARCHIVED     ?= YES

# ----------------------------
# Compile Options
# ----------------------------

# That one gets passed by builder.sh inside EXTRA_CFLAGS
OPT_MODE      =
EXTRA_CFLAGS ?= -Oz -W -Wall -Wwrite-strings -Wno-unknown-pragmas -Wno-incompatible-library-redeclaration -Wno-main-return-type

# ----------------------------
# Debug Options
# ----------------------------

OUTPUT_MAP   ?= NO

# CEmu is a host-side development tool. Override this with the executable path
# when it is not available on PATH (see tests/cemu/README.md).
CEMU         ?= CEmu

# v15 uses meta/makefile.mk; retain support for the older CEDEV layout.
CFLAGS ?= -Oz -Wall -Wextra
ifneq ($(MAKECMDGOALS),test-host)
ifneq ($(wildcard $(CEDEV)/meta/makefile.mk),)
CEDEV_TOOLCHAIN := $(CEDEV)
include $(CEDEV)/meta/makefile.mk
else ifneq ($(wildcard $(CEDEV)/include/.makefile),)
include $(CEDEV)/include/.makefile
else
CE_MAKEFILE := $(shell cedev-config --makefile 2>/dev/null)
ifeq ($(CE_MAKEFILE),)
$(error CE Toolchain not found. Set CEDEV or put cedev-config on PATH. Host checks: make test-host)
endif
include $(CE_MAKEFILE)
endif
endif

.PHONY: test-host
test-host:
	@sh tests/host/run.sh
	@sh tests/host/run.sh test_ticker

.PHONY: test-cemu

ifeq ($(OS),Windows_NT)
test-cemu: target
	@where "$(CEMU)" >NUL 2>&1 || if not exist "$(CEMU)" (echo CEmu was not found. Set CEMU to the full path of CEmu.exe. & exit /b 1)
	@"$(CEMU)" --send-arch "$(BINDIR)/$(TARGET)" --launch "$(NAME)"
else
test-cemu: target
	@if ! command -v "$(CEMU)" >/dev/null 2>&1 && [ ! -x "$(CEMU)" ]; then \
		echo "CEmu was not found. Set CEMU to the executable path; see tests/cemu/README.md."; \
		exit 1; \
	fi
	@"$(CEMU)" --send-arch "$(BINDIR)/$(TARGET)" --launch "$(NAME)"
endif
