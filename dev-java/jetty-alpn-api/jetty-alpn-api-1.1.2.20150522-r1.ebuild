# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's ALPN API"

MY_PN="${PN/jetty-/}"
MY_PV="${PV/2015/v2015}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="0"
SRC_URI="https://github.com/eclipse/jetty.alpn/archive/${MY_P}.tar.gz"
HOMEPAGE="http://www.eclipse.org/${MY_PN}/documentation/current/alpn-chapter.html"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

RDEPEND=">=virtual/jre-1.8"

DEPEND=">=virtual/jdk-1.8"

S="${WORKDIR}/${PN//-/.}-${MY_PN}-${MY_PV}/"

JAVA_SRC_DIR="src/main/java"
