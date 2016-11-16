# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JBoss Logging Annotation"

MY_PN="${PN:0:13}-tools"
MY_PV="${PV}.Final"
MY_P="${PN}-${MY_PV}"

SLOT="$(get_major_version)"
HOMEPAGE="https://github.com/${PN:0:13}"
SRC_URI="${HOMEPAGE}/${MY_PN}/archive/${MY_PV}.zip -> ${P}.zip"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

CP_DEPEND="dev-java/jboss-logging:0"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_PN}-${MY_PV}/${PN:14}"

JAVA_SRC_DIR="src/main/java"
