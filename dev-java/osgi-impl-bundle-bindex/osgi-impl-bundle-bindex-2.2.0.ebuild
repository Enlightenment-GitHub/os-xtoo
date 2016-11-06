# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="org.${PN//-/.}"

DESCRIPTION="OSGi Bundle Bindex"
HOMEPAGE="https://github.com/bndtools/repo/tree/master/bundles/org.osgi.impl.bundle.bindex"
SRC_URI="https://github.com/bndtools/repo/blob/master/bundles/${MY_PN}/${MY_PN}-${PV}.jar?raw=true -> ${P}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/ant-core:0
	dev-java/bndlib:3
	dev-java/kxml:2
	dev-java/osgi-core-api:5
	dev-java/osgi-obr:0
	dev-java/xmlpull:0"

DEPEND="app-arch/unzip:0
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/"

JAVA_SRC_DIR="OSGI-OPT/src/"
