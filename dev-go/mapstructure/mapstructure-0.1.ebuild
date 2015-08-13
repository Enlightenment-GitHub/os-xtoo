# Copyright 2015 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGO_SRC=github.com/mitchellh/${PN}
EGO_PN=${EGO_SRC}/...

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	KEYWORDS="~amd64"
	SRC_URI="https://${EGO_SRC}/archive/master.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi

inherit golang-build

DESCRIPTION="Go library for decoding generic map values into native Go structures"
HOMEPAGE="https://${EGO_SRC}"
LICENSE="MIT"
SLOT="0"
IUSE=""
DEPEND=""
RDEPEND=""
