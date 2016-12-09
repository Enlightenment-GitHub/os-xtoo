# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:5}"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}"

HOMEPAGE="https://github.com/apache/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${HOMEPAGE}.git"
	MY_S="${P}/${PN#${MY_PN}-}"
else
	SRC_URI="${HOMEPAGE}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${MY_P}/${PN#${MY_PN}-}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Distributed streaming platform ${PN#${MY_PN}-}"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/lz4-java:0
	dev-java/slf4j-api:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}"

JAVA_SRC_DIR="src/main/java/"
