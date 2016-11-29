# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

HOMEPAGE="https://github.com/jpountz/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-ant-2 ${ECLASS}

DESCRIPTION="LZ4 compression for Java"
LICENSE="Apache-2.0"
IUSE="jni"
SLOT="0"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	jni? ( dev-java/cpptasks:0 )
	>=virtual/jdk-1.8"

S="${WORKDIR}/${P}/"

EANT_ANT_TASKS="cpptasks"
EANT_DOC_TARGET="docs"
EANT_EXTRA_ARGS="-Divy.module=${PN} -Divy.revision=${PV}"

java_prepare() {
	# Remove binaries
	rm -fR src/resources/*

	# Needed to build since not using ivy
	mkdir -p java build/java || die

	sed -i -e 's|depends="init"||g' \
		-e 's| depends="init, generate-sources"||' \
		-e 's|install-cpptasks,||' \
		build.xml || die "Could not sed build.xml"

	if ! use jni; then
		EANT_EXTRA_ARGS+=" -Dskip.jni=true"
	fi
}

src_install() {
	cd "${S}/dist"
	java-pkg_newjar ${PN}.jar

	if use jni; then
		cd "${S}/build/jni/linux/amd64" \
			|| die "Could not cd to jni directory"
		java-pkg_doso lib${PN}.so
	fi

	use source && java-pkg_dosrc "${S}/src/java"
	use doc && java-pkg_dohtml -r "${S}/build/docs"
}
