# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Felix Framework"
HOMEPAGE="http://felix.apache.org/documentation/subprojects/apache-felix-framework.html"
LICENSE="Apache-2.0"

MY_PN="org.apache.felix.resolver"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://apache/felix/${MY_P}-source-release.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CP_DEPEND="dev-java/osgi-core-api:6"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}"

JAVA_SRC_DIR="src/main"

