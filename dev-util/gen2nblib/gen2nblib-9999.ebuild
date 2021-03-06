# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

MY_P="${P}-Source"
BASE_URI="https://github.com/Obsidian-StudiosInc/${PN}"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="${BASE_URI}.git"
	inherit git-r3
else
	KEYWORDS="~amd64"
	SRC_URI="${BASE_URI}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Script to generate Netbeans library files for all Java packages"
HOMEPAGE="${BASE_URI}"
LICENSE="GPL-3"
SLOT="0"

S="${WORKDIR}/${P}"

src_install() {
	dobin ${PN}.sh
}
