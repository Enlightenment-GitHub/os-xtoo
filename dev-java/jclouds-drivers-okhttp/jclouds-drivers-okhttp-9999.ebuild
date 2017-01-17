# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:7}"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}"

BASE_URI="https://github.com/${MY_PN}/${MY_PN}"
DRIVER="${PN:16}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/rel/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="JClouds Driver for ${DRIVER}"
HOMEPAGE="https://jclouds.apache.org/"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/javax-inject:0
	~dev-java/jclouds-core-${PV}:${SLOT}
	dev-java/guava:21
	dev-java/guice:4
	dev-java/okhttp:0
	dev-java/okio:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

if [[ ${PV} == 9999 ]]; then
	S="${WORKDIR}/${P}/${PN:8:7}/${DRIVER}"
else
	S="${WORKDIR}/${MY_PN}-rel-${MY_P}/${PN:8:7}/${DRIVER}"
fi

JAVA_SRC_DIR="src/main/java"

# Incomplete okhttp3 patch
#PATCHES=(
#	"${FILESDIR}/${PN}-${SLOT}-okhttp3.patch"
#)
