# Copyright 2015-2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Nagios plugin to check the status of a Linode using the Linode API."
HOMEPAGE="https://github.com/Obsidian-StudiosInc/${PN}"
SRC_URI="https://github.com/Obsidian-StudiosInc/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64 ~x86"


DEPEND=""
RDEPEND="net-misc/curl"

src_install() {
	exeinto /usr/lib/nagios/plugins
	doexe ${PN}.sh
}
