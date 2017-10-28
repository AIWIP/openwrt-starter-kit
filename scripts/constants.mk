# targets.mk
#
# Declares the shared constants
#

# Directories
export TOP_DIR:=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
export BIN_DIR=$(TOP_DIR)/bin
export BUILD_DIR=/home/vagrant/build_dir
export FEED_DIR=$(BUILD_DIR)/feed
export PACKAGE_SRC=$(FEED_DIR)/$(PACKAGE_NAME)
export PLATFORM_DIR=$(BIN_DIR)/$(PLATFORM_PATH)
export SOURCE_DIR=$(BUILD_DIR)/platforms/$(PLATFORM_NAME)
export EXPORT_DIR=$(SOURCE_DIR)/bin

# Commands
export CP=sudo cp
export FEEDS=cd $(SOURCE_DIR) && sudo ./scripts/feeds
export MAKE=cd $(SOURCE_DIR) && sudo make

# Constants
export FEED_NAME=$(AUTHOR)
export PACKAGE_NAME=$(NAME)
export PACKAGE_CATEGORY=$(AUTHOR)