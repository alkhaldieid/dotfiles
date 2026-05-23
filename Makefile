STOW_DIR := stow
TARGET := $(HOME)
MACOS_PACKAGES := aerospace karabiner hammerspoon raycast-scripts zsh
LINUX_PACKAGES := zsh dwm dwmblocks
ALL_PACKAGES := $(shell find $(STOW_DIR) -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)

.PHONY: install-macos install-linux stow unstow zsh-bench sanity

install-macos:
	brew bundle
	stow -d $(STOW_DIR) -t $(TARGET) $(MACOS_PACKAGES)

install-linux:
	sudo pacman -S --needed - < arch-packages.txt
	stow -d $(STOW_DIR) -t $(TARGET) $(LINUX_PACKAGES)

stow:
	stow -d $(STOW_DIR) -t $(TARGET) $(ALL_PACKAGES)

unstow:
	stow -D -d $(STOW_DIR) -t $(TARGET) $(ALL_PACKAGES)

zsh-bench:
	for i in $$(seq 1 10); do /usr/bin/time -p zsh -i -c exit; done

sanity:
	aerospace reload-config
	hs -c "1+1"
	zsh -n stow/zsh/.config/zsh/*.zsh
