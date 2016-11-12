# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Hibernate's core"

MY_PN="${PN:0:9}"
MY_PV="${PV}.Final"
MY_P="${PN}-${MY_PV}"

SLOT="$(get_major_version)"
SRC_URI="https://github.com/${PN:0:9}/${PN}/archive/${MY_PV}.zip -> ${P}.zip"
HOMEPAGE="http://${MY_PN}.org/"
KEYWORDS="~amd64"
LICENSE="LGPL-2.1"
IUSE=""

CP_DEPEND="dev-java/jboss-logging:0
	dev-java/jboss-logging-annotations:2"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_P}/"

JAVA_SRC_DIR="src/main/java"
