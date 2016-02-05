# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_USE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="SQLJet pure Java implementation of SQLite."
SLOT="0"
SRC_URI="http://${PN}.com/files/${P}-src.zip"
HOMEPAGE="http://${PN}.com/"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-2"
IUSE=""

CDEPEND="dev-java/antlr:3.5"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.7"

S="${WORKDIR}/${P}"

JAVA_GENTOO_CLASSPATH="antlr-3.5"
JAVA_SRC_DIR="${PN}/src/main/java"

java_prepare() {
	java-pkg_clean
}
