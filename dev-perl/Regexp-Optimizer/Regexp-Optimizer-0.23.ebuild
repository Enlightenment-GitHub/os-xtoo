# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="DANKOGAI"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="optimizes regular expressions"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-perl/Regexp-Assemble"
DEPEND="${RDEPEND}"
