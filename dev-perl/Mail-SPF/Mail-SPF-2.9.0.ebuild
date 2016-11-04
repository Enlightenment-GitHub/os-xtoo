# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="JMEHNLE"
DIST_SECTION="mail-spf"
DIST_VERSION="v${PV}"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="An object-oriented implementation of Sender Policy Framework"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="virtual/perl-Time-Local"
DEPEND="${RDEPEND}
	dev-perl/Module-Build
	virtual/perl-ExtUtils-MakeMaker
	test? ( dev-perl/Test-Deep )"
