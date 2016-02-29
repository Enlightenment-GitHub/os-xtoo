# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Guice is a lightweight dependency injection framework for Java 5 and above"
HOMEPAGE="https://github.com/google/guice/"
SRC_URI="https://github.com/google/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="$(get_major_version)"
KEYWORDS="~amd64 ~x86"

IUSE=""

CP_DEPEND="dev-java/aopalliance:1
	dev-java/asm:4
	dev-java/guava:19
	dev-java/cglib:3
	dev-java/javax-inject:0"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	dev-java/bnd:3
	dev-java/jarjar:1
	>=virtual/jdk-1.8"

EANT_ANT_TASKS="bnd-3,jarjar-1"
JAVA_PKG_BSFIX_NAME="build.xml common.xml"
JAVA_ANT_REWRITE_CLASSPATH="yes"

java_prepare() {
	java-pkg_clean

	sed -i -e 's|bndwrap jars="${build.dir}/classes|bndwrap jars="${build.dir}/${ant.project.name}-with-deps.jar|' \
		-e 's|classes.bar|${ant.project.name}-with-deps.jar|' \
		"${S}"/common.xml || die "Could not fix/sed"

	java-pkg_jar-from --into lib/build cglib-3 cglib.jar cglib-3.1.jar
	java-pkg_jar-from --into lib/build asm-4 asm.jar asm-5.0.3.jar
}

src_install() {
	java-pkg_newjar build/dist/"${PN}"-snapshot.jar "${PN}".jar
	use source && java-pkg_dosrc core/src/com
}
