# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="KAPPA"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="Prefixes and suffixes analisys of text"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-perl/Module-Build"
