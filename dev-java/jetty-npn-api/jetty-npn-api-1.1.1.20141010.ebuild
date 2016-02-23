# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's NPN API"

MY_PN="${PN/jetty-/}"
MY_PV="${PV/2014/v2014}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="0"
SRC_URI="https://github.com/eclipse/jetty.npn/archive/${MY_P}.zip"
HOMEPAGE="https://wiki.eclipse.org/Jetty/Feature/NPN"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""

RDEPEND=">=virtual/jre-1.8"

DEPEND=">=virtual/jdk-1.8"

S="${WORKDIR}/jetty.npn-${MY_P}/"

JAVA_SRC_DIR="src/main/java"
