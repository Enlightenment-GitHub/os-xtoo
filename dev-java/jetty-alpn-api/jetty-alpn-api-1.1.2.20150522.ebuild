# Copyright 2015 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_USE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's ALPN API"

MY_PN="${PN/jetty-/}"
MY_PV="${PV/2015/v2015}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="0"
SRC_URI="https://github.com/eclipse/jetty.alpn/archive/${MY_P}.zip"
HOMEPAGE="http://www.eclipse.org/${MY_PN}/documentation/current/alpn-chapter.html"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""

RDEPEND=">=virtual/jre-1.8"

DEPEND=">=virtual/jdk-1.8"

S="${WORKDIR}/jetty.alpn-${MY_P}/"

JAVA_SRC_DIR="src/main/java"
