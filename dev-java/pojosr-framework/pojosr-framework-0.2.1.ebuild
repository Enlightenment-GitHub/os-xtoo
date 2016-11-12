# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit java-pkg-2 java-pkg-simple

MY_P="de.kalpatec.${PN/-/.}-${PV}"

DESCRIPTION="A service registry that enables OSGi style service registry programs"
HOMEPAGE="https://github.com/lefou/pojosr"
SRC_URI="https://github.com/lefou/pojosr/archive/${MY_P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CDEPEND="dev-java/osgi-compendium:4
	dev-java/osgi-core-api:4"

DEPEND=">=virtual/jdk-1.7
	${CDEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CDEPEND}"

S="${WORKDIR}/pojosr-${MY_P}"

JAVA_GENTOO_CLASSPATH="
	osgi-compendium-4
	osgi-core-api-4
"
JAVA_SRC_DIR="src/main/java"

java_prepare() {
	java-pkg_clean
}
