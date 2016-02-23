# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_P="${PN}-parent-${PV}"

DESCRIPTION="XML Pull Parsing"
HOMEPAGE="http://www.xmlpull.org/"
SRC_URI="https://github.com/karlmdavis/${PN}/archive/${MY_P}.zip"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${PN}-${MY_P}"

JAVA_SRC_DIR="${PN}/src/main/java/"

java_prepare() {
	java-pkg_clean
}
