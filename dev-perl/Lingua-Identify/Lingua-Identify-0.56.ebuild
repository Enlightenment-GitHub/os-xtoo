# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="AMBS"
DIST_SECTION="Lingua"
DIST_VERSION="0.56"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="Language identification"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-perl/Class-Factory-Util
	dev-perl/Text-Affixes
	dev-perl/Text-Ngram"
DEPEND="${RDEPEND}"
