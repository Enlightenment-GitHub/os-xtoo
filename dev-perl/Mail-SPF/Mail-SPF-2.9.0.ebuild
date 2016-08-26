# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR="JMEHNLE"
MODULE_SECTION="mail-spf"
MODULE_VERSION="v${PV}"

inherit perl-module

DESCRIPTION=" An object-oriented implementation of Sender Policy Framework"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="virtual/perl-Time-Local"
DEPEND="${RDEPEND}
	dev-perl/Module-Build
	virtual/perl-ExtUtils-MakeMaker
	test? ( dev-perl/Test-Deep )"

SRC_TEST="do"


# SRC_URI="mirror://cpan/authors/id/${MODULE_AUTHOR:0:1}/${MODULE_AUTHOR:0:2}/${MODULE_AUTHOR}/${MODULE_SECTION:+${MODULE_SECTION}/}${MODULE_A}"
