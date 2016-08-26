# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Schedule-Cron-Events/Schedule-Cron-Events-1.930.0.ebuild,v 1.1 2013/09/12 14:19:37 dev-zero Exp $

EAPI=5

MODULE_AUTHOR="COG"
MODULE_VERSION="0.07"

inherit perl-module

DESCRIPTION="Prefixes and suffixes analisys of text"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

#RDEPEND="dev-perl/Time-modules"
#	dev-perl/Set-Crontab"
#DEPEND="${RDEPEND}
#	virtual/perl-ExtUtils-MakeMaker
#	test? ( dev-perl/Test-Deep )"

SRC_TEST="do"

