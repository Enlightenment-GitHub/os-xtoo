# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Space efficient annotation indexer and offline reflection library"

MY_PN="wildfly"
MY_PV="${PV}.Final"
MY_P="${PN}-${MY_PV}"

SLOT="$(get_major_version)"
HOMEPAGE="https://github.com/${MY_PN}/${PN}"
SRC_URI="${HOMEPAGE}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

CP_DEPEND="dev-java/ant-core:0"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="
	${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_P}"

JAVA_SRC_DIR="src/main/java"
