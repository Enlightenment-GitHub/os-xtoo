# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_PN="${PN: -2}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Oracle Berkeley DB Java Edition"
HOMEPAGE="http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/"
SRC_URI="http://download.oracle.com/otn/${PN/db-/db/}-${PV}.tar.gz"
RESTRICT="fetch"

LICENSE="AGPL-3"
SLOT="$(get_major_version)"
KEYWORDS="~amd64 ~x86"

JVM="1.8"

DEPEND=">=virtual/jdk-${JVM}"

RDEPEND=">=virtual/jre-${JVM}"

S="${WORKDIR}/${MY_P}"

# Necessary to negate hard coded -Dbuild.sysclasspath=ignore in antflags
EANT_EXTRA_ARGS="-Dbuild.sysclasspath=last"

java_prepare() {
	java-pkg_clean

	# Re-writer does not catch this odd target
	sed -i -e "s|1.7|${JVM}|" build-common.xml \
		|| die "Could not change jdk version"
}

src_install() {
	java-pkg_newjar build/lib/${MY_PN}.jar ${PN}.jar

	use doc && java-pkg_dojavadoc docs
	use source && java-pkg_dosrc src
}

pkg_nofetch() {
	einfo "Oracle Berkeley DB Java Edition requires an Oracle account."
	einfo "You need to login or create an account at oracle.com"
	einfo "Please download"
	einfo " - ${MY_P}"
	einfo "from ${SRC_URI}"
	einfo "Or from alternate"
	einfo "${HOMEPAGE} downloads/index.html"
	einfo "You will be prompted to log in or create an account"
	einfo "Then place it in ${DISTDIR}"
}
