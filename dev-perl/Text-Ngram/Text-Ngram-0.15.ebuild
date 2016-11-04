# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="AMBS"
DIST_SECTION="Text"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="Flexible Ngram analysis (for characters, words, and more)"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-perl/Unicode-CaseFold"
DEPEND="${RDEPEND}"
