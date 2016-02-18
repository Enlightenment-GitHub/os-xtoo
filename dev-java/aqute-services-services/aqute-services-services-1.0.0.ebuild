# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN/aqute/aQute}
MY_PN=${MY_PN//-/.}

DESCRIPTION="aQute Remote provides remote debugging for bnd projects"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/pkriens/aQute.repo/blob/master/repo/${MY_PN}/${MY_PN}-${PV}.jar?raw=true -> ${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CDEPEND="dev-java/aqute-services-struct:0
	dev-java/bndlib:3
	java-virtuals/servlet-api:4.0"

DEPEND="app-arch/unzip
	${CDEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/"

JAVA_GENTOO_CLASSPATH="
	aqute-services-struct
	bndlib-3
	servlet-api-4.0
"
JAVA_SRC_DIR="OSGI-OPT/src/aQute/service"

java_prepare() {
	java-pkg_clean
}
