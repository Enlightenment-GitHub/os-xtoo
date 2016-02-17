# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Felix Framework"
HOMEPAGE="http://felix.apache.org/documentation/subprojects/apache-felix-framework.html"
LICENSE="Apache-2.0"

MY_PN="org.apache.felix.framework"
MY_P="${MY_PN}-${PV}"
SRC_URI="mirror://apache/felix/${MY_P}-source-release.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CDEPEND="dev-java/felix-resolver:0
	dev-java/osgi-annotation:0
	dev-java/osgi-compendium:6
	dev-java/osgi-core-api:6"

DEPEND="${CDEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/${MY_P}"

JAVA_GENTOO_CLASSPATH="
	felix-resolver
	osgi-annotation
	osgi-compendium-6
	osgi-core-api-6
"
JAVA_SRC_DIR="src/main"
