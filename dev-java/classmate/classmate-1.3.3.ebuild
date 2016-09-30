# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Zero-dependency library for introspecting type information"

MY_PN="java-${PN}"

SLOT="0"
SRC_URI="https://github.com/FasterXML/${MY_PN}/archive/${P}.zip"
HOMEPAGE="http://fasterxml.com"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_PN}-${P}/"

JAVA_SRC_DIR="src/main/java"
