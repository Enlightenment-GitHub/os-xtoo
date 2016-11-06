# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN=${PN/aqute/aQute}
MY_PN=${MY_PN//-/.}

DESCRIPTION="aQute Remote provides remote debugging for bnd projects"
HOMEPAGE="http://www.aqute.biz/Bnd/Bnd"
SRC_URI="https://github.com/pkriens/aQute.repo/blob/master/repo/${MY_PN}/${MY_PN}-${PV}.jar?raw=true -> ${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/aqute-services-struct:0
	dev-java/bndlib:3
	dev-java/libg:3
	java-virtuals/servlet-api:4.0"

DEPEND="app-arch/unzip:0
	${CP_DEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/"

JAVA_SRC_DIR="OSGI-OPT/src/"
