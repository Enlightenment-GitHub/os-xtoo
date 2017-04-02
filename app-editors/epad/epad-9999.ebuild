# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

MY_PN="ePad"
MY_PV="${PV}"
MY_P="${MY_PN}-${MY_PV}"
BASE_URI="https://github.com/JeffHoogland/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${MY_P}"
fi

PYTHON_COMPAT=( python{2_7,3_4,3_6} pypy2_0 )

inherit eutils python-r1 ${ECLASS}

DESCRIPTION="A simple text editor written in python and elementary"
HOMEPAGE="${BASE_URI}"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/python-efl
	dev-python/python-elm-extensions
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_S}"

DOCS=( README.md ${PN}.1 )

src_install() {
	dobin epad
	domenu ${MY_PN}.desktop
}
