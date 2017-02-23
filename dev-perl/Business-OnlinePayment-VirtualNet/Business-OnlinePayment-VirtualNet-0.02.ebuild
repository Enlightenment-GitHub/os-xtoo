# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DIST_AUTHOR="IVAN"
DIST_TEST="do"

inherit perl-module

DESCRIPTION="Vital VirtualNet backend for Business::OnlinePayment"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	dev-perl/Business-OnlinePayment
	dev-perl/File-CounterFile
	dev-perl/Net-SSLeay
	dev-perl/String-LRC
	dev-perl/String-Parity
	dev-perl/TimeDate
"
DEPEND="${RDEPEND}
	dev-perl/Module-Build"
