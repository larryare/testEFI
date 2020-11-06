#!/bin/zsh

NVME=0
CPUF=0
SIP=0

# Check if NVME present

if
	(($(kextstat | grep NVMeFix | wc -l) == 1))
then
	echo "\e[32mNVMeFix.kext loaded"
	NVME=1
else
	echo "\e[31mNVMEFix.kext not present"
fi

# Check if CPUFriend present
if
	(($(kextstat | grep CPUF | wc -l) == 1))
then
	echo "\e[32mCPUFriend.kext loaded"
	CPUF=1
else
	echo "\e[31mCPUFriend.kext not present"
fi
if
	(($(csrutil status | grep enabled | wc -l) == 1))
then
	echo "\e[32mSIP Enabled"
	SIP=1
else
	echo "\e[31mSIP Disabled"
fi


if
	((CPUF==1 && NVME==1 && SIP==1))
then
	echo "\e[32mAll Good!"
else
	echo "\e[31mCheck CONFIG!"

fi


