#!/bin/bash
#
# travis-env.sh
# travis environment configuration script
#

# exit on command failures
set -e

if [ "$TRAVIS_OS_NAME" == "linux" ] ;
then

	# source ubuntu release information
	source /etc/lsb-release

	if [ "$DISTRIB_RELEASE" == "12.04" ] ;
	then

		# 12.04 doesn't have c++11 compatible compiler, so we'll install g++ 4.8
		add-apt-repository -y ppa:ubuntu-toolchain-r/test
		apt-get update
		apt-get install -y gcc-4.8 g++-4.8
		update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 100 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8

	else

		# update apt-get
		apt-get update

	fi

	apt-get install -y tcl-dev

fi

