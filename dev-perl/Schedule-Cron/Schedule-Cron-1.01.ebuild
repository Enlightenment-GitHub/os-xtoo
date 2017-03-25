# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="ROLAND"
#DIST_VERSION="0.9"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="Cron-like scheduler for Perl subroutines"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/Module-Build
	virtual/perl-ExtUtils-MakeMaker
	test? ( dev-perl/Test-Deep )"
