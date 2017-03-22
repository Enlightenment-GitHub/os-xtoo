# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's NPN API"

MY_PN="${PN/jetty-/}"
MY_PV="${PV/2014/v2014}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="0"
SRC_URI="https://central.maven.org/maven2/org/eclipse/${PN:0:5}/npn/${MY_PN}/${MY_PV}/${MY_P}-sources.jar"
HOMEPAGE="https://wiki.eclipse.org/Jetty/Feature/NPN"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

RDEPEND=">=virtual/jre-1.8"

DEPEND="
	app-arch/unzip
	>=virtual/jdk-1.8
"
