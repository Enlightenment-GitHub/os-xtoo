# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_PN="org.osgi.service.obr"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="OSGi Service OBR by Apache"
HOMEPAGE="http://felix.apache.org"
SRC_URI="mirror://apache/dist/felix/${MY_P}-project.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/osgi-core-api:6"

DEPEND="app-arch/unzip:0
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}"

java_prepare() {
	cp "${FILESDIR}"/${P}-build.xml build.xml || die
}

JAVA_ANT_REWRITE_CLASSPATH="true"

src_install() {
	java-pkg_newjar target/${MY_P}.jar
}
