# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

if [[ ${PV} == 9999 ]]; then
        ECLASS="git-r3"
        EGIT_REPO_URI="https://github.com/Obsidian-StudiosInc/${PN}.git"
else
	SRC_URI="https://github.com/Obsidian-StudiosInc/${PN}/archive/v${PV}.zip -> ${P}.zip"
	KEYWORDS="~amd64"
fi

inherit autotools ${ECLASS}

DESCRIPTION="Anti-Spam Server Proxy Report"
HOMEPAGE="http://www.o-sinc.com/#!/software/${PN}"

LICENSE="GPL-2"
SLOT="0"

src_prepare() {
   eautoreconf
}
