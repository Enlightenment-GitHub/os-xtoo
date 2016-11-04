# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="CREAMYG"
DIST_VERSION="0.952"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="Perl interface to Snowball stemmers"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=""
DEPEND="dev-perl/Module-Build"
