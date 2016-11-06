# Copyright 2015-2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

EGO_SRC=github.com/racker/${PN}
EGO_PN=${EGO_SRC}/...

if [[ ${PV} = *9999* ]]; then
	inherit golang-vcs
else
	SRC_URI="https://${EGO_SRC}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	inherit golang-vcs-snapshot
fi

inherit golang-build

DESCRIPTION="REST client optimized for APIs using JSON for request and response bodies"
HOMEPAGE="https://${EGO_SRC}"
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""
CDEPEND=""
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"
