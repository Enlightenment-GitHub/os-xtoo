# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:6}"
MY_PV="${PV}"
MY_P="${MY_PN}-${MY_PV}"

BASE_URI="https://github.com/${MY_PN}-data-binding/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Castor ${PN:7}"
HOMEPAGE="http://${MY_PN}-data-binding.github.io/${MY_PN}/"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/ant-core:0
	~dev-java/castor-core-${PV}:${SLOT}
	~dev-java/castor-codegen-${PV}:${SLOT}
	~dev-java/castor-schema-${PV}:${SLOT}
	~dev-java/castor-xml-${PV}:${SLOT}
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/${PN:7}"

JAVA_SRC_DIR="src/main/java"
JAVA_ADDRES_DIRS="src/main/resources"
