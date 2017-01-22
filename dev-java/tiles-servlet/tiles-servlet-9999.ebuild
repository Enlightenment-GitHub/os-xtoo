# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:5}-parent"
MY_P="${MY_PN}-${PV}"

BASE_URI="https://github.com/apache/${PN:0:5}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${MY_P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	MY_S="${PN:0:5}-${MY_P}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Templating framework for modern Java applications ${PN:6}"
HOMEPAGE="https://tiles.apache.org/"
LICENSE="Apache-2.0"
SLOT="0"

TILESREQ_SLOT="0"

CP_DEPEND="
	dev-java/slf4j-api:0
	~dev-java/tiles-api-${PV}:${SLOT}
	~dev-java/tiles-core-${PV}:${SLOT}
	dev-java/tiles-request-api:${TILESREQ_SLOT}
	dev-java/tiles-request-servlet:${TILESREQ_SLOT}
	java-virtuals/servlet-api:2.5
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}/${PN}"

JAVA_SRC_DIR="src/main/java/"

