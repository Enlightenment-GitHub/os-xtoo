# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="pentaho-commons-database"
MY_PV="${PV}-R"
MY_P="${MY_PN}-${MY_PV}"
BASE_URI="https://github.com/pentaho/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${MY_P}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="${PN//-/ }"
HOMEPAGE="${BASE_URI}"
LICENSE="LGPL-2.1"
SLOT="$(get_major_version)"

CP_DEPEND="dev-java/commons-logging:0"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}/${PN}"

JAVA_SRC_DIR="src"
