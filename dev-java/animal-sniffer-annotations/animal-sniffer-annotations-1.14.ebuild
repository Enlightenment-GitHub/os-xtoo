# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN/-annotations/}"

DESCRIPTION="Animal Sniffer Annotations"
HOMEPAGE="http://www.mojohaus.org/animal-sniffer/"
SRC_URI="https://github.com/mojohaus/${MY_PN}/archive/${MY_PN}-parent-${PV}.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip
	>=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${MY_PN}-${MY_PN}-parent-${PV}/${PN}"

JAVA_SRC_DIR="src/main/java/"

java_prepare() {
	java-pkg_clean
}
