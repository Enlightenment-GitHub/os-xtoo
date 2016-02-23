# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="High-Availability JDBC"

SLOT="$(get_version_component_range 1)"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.zip -> ${PN}-${PV}.zip"
HOMEPAGE="http://${PN}.github.io/"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
IUSE=""

CP_DEPEND="dev-java/berkeley-db-je:0
	dev-java/commons-codec:0
	dev-java/commons-logging:0
	dev-java/commons-pool:0
	dev-java/jboss-logging:0
	dev-java/jgroups:3
	dev-java/slf4j-api:0
	dev-java/sqljet:0"

# Project uses Berkeley DB Java Edition from Oracle
# pure java version of Berkeley DB
# tried to use open source one but has issues and likely using the pure
# java one for a reason
#	sys-libs/db:6.0[java]


RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${P}/"

JAVA_SRC_DIR="src/main/java"

java_prepare() {
	java-pkg_clean

	# Change from Java Edition to Regular
	# does not build/compile
#	sed -i -e "s|cat.je.|cat.db.|g" \
#		${S}/src/main/java/net/sf/hajdbc/state/bdb/*.java || die
}
