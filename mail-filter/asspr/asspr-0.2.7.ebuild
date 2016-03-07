# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools

DESCRIPTION="Anti-Spam Server Proxy Report"
HOMEPAGE="http://www.o-sinc.com/#!/software/${PN}"
SRC_URI="https://github.com/Obsidian-StudiosInc/${PN}/archive/v${PV}.zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
   eautoreconf
}
