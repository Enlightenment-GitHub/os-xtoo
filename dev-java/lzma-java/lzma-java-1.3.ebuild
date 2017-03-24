# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="LZMA library for Java EOL"

SRC_URI="https://github.com/jponge/${PN}/archive/${P}.tar.gz"
HOMEPAGE="https://jponge.github.io/${PN}/"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

RDEPEND=">=virtual/jre-1.8"

DEPEND=">=virtual/jdk-1.8"

S="${WORKDIR}/${PN}-${P}/"

JAVA_SRC_DIR="src/main/java"
