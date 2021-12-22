ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m   := lab6.o
ccflags-y += -g
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD
	cp lab6.ko lab6.ko.unstripped
	$(CROSS_COMPILE)strip -dS lab6.o
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
endif
