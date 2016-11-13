# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SQLJet pure Java implementation of SQLite."
SLOT="0"
SRC_URI="http://${PN}.com/files/${P}-src.zip"
HOMEPAGE="http://${PN}.com/"
KEYWORDS="~amd64"
LICENSE="GPL-2"
IUSE=""

CP_DEPEND="dev-java/antlr:3.5"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${P}"

JAVA_SRC_DIR="${PN}/src/main/java"
