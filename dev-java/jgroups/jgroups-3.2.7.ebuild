# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_PN="JGroups"
MY_PV="${PV//./_}"
MY_P="${MY_PN}_${MY_PV}_Final"

DESCRIPTION="JGroups is a toolkit for reliable multicast communication"
SRC_URI="https://github.com/belaban/${MY_PN}/archive/${MY_P}.zip"
HOMEPAGE="http://www.jgroups.org/"
LICENSE="LGPL-2.1"
SLOT="3"
KEYWORDS="~amd64 ~x86"
IUSE=""

BND_SLOT="3"

CDEPEND="dev-java/bsh:0
	dev-java/bnd:${BND_SLOT}
	dev-java/log4j:0
	java-virtuals/jmx"

DEPEND="app-arch/unzip
	${CDEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CDEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/${MY_PN}-${MY_P}"

java_prepare() {
	java-pkg_clean

	# Required for newer BND, not sure how it worked with older
	sed -i -e 's|classpath="${bndclasspath}|classpath="${compile.dir}|' \
		"${S}/build.xml" || die

	cd "${S}/lib" || die
	java-pkg_jar-from bsh
	java-pkg_jar-from log4j
	java-pkg_jar-from --virtual jmx

	#if ! use test; then
		rm -vr "${S}"/tests/{junit,other,junit-functional}/org \
			|| die "Failed to remove tests."
	#fi
}

JAVA_ANT_ENCODING="ISO-8859-1"

EANT_ANT_TASKS="bnd-3"
EANT_BUILD_TARGET="jgroups.jar"

src_install() {
	java-pkg_newjar dist/jgroups-*.jar ${PN}.jar

	if use doc; then
		java-pkg_dojavadoc dist/javadoc
		insinto /usr/share/doc/${PF}
		doins -r doc/* || die
	fi
	use source && java-pkg_dosrc src/*

}

