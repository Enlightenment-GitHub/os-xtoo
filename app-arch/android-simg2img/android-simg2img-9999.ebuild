# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

HOMEPAGE="https://github.com/anestisb/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/${PV}.zip -> ${P}.zip"
fi

inherit eutils ${ECLASS}

DESCRIPTION="Tool to convert Android sparse images to raw images"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"
IUSE="doc"

RDEPEND=""

DEPEND="${RDEPEND}"

MAKEOPTS+=" -j1"

[[ ${PV} != 9999 ]] && DEPEND="app-arch/unzip ${DEPEND}"

src_install() {
	local bin
	local BINS="simg2img simg2simg img2simg append2simg"

	for bin in ${BINS}; do
		dobin ${bin}
	done
}
