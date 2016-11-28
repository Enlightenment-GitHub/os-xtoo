# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

BASE_URI="https://github.com/${PN:0:7}/${MY_PN}"
MY_PN="mongo-java-driver"
MY_P="${MY_PN}-r${PV}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}/${PN}"
else
	SRC_URI="${BASE_URI}/archive/r${PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${MY_P}/${PN}/"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="MongoDB Binary JSON"

SLOT="$(get_major_version)"
HOMEPAGE="https://mongodb.github.io/$(get_version_component_range 1-2)/${MY_PN}/"
LICENSE="Apache-2.0"

RDEPEND=">=virtual/jre-1.8"

DEPEND=">=virtual/jdk-1.8"

S="${WORKDIR}/${MY_S}/"

JAVA_SRC_DIR="src/main/"
