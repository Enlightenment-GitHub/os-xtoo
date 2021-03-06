# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A collection of Google's core Java libraries"
HOMEPAGE="https://code.google.com/p/guava-libraries/ https://github.com/google/guava"
SRC_URI="https://search.maven.org/remotecontent?filepath=com/google/${PN}/${PN}/${PV}/${P}-sources.jar"

LICENSE="Apache-2.0"
SLOT="18"
KEYWORDS="~amd64 ~amd64-linux ~x64-macos"

CDEPEND="
	dev-java/javax-inject:0
	dev-java/jsr305:0
	java-virtuals/jdk-with-com-sun:0"
RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"
DEPEND="${CDEPEND}
	app-arch/unzip
	>=virtual/jdk-1.7" # https://code.google.com/p/guava-libraries/issues/detail?id=635

JAVA_GENTOO_CLASSPATH="jsr305,javax-inject"

PATCHES=( "${FILESDIR}/${PN}-${SLOT}-java-1.8.patch" )
