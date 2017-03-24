# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN}"
MY_PV="${PV}"
MY_P="${MY_PN}-${MY_PV}"
BASE_URI="https://github.com/${PN}/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${P}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Open Java API for OLAP"
HOMEPAGE="https://www.${PN}.org/"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="dev-java/xerces:2"

JDK_VERSION="1.8"

DEPEND="${CP_DEPEND}
	dev-java/javacc:0
	>=virtual/jdk-${JDK_VERSION}"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-${JDK_VERSION}"

S="${WORKDIR}/${MY_S}"

JAVA_SRC_DIR="src"

java_prepare() {
	# remove jdbc 3/1.5 4.0/1.6
	rm -v "${S}/src/org/olap4j/driver/xmla/FactoryJdbc3Impl.java" \
		"${S}/src/org/olap4j/driver/xmla/FactoryJdbc4Impl.java" \
		|| die "Could not remove FactoryJdbc{3,4}Impl.java"

	# set version and timestamp
	local my_file my_path
	my_file="XmlaOlap4jDriverVersion.java"
	my_path="${S}/src/resources/version/"
	sed -i -e "s|@pomversion@|${PV}|" \
		-e "s|@buildtime@|$(date)|" \
		"${my_path}/${my_file}.template" \
		|| die "Could not set version & timestamp"

	# move/rename version template to java
	mv "${my_path}/${my_file}.template" \
		"${S}/src/org/olap4j/driver/xmla/${my_file}" \
		|| die "Could not move/rename template"

	cd "${S}/src/org/olap4j/mdx/parser/impl/"
	javacc -JDK_VERSION="${JDK_VERSION}" MdxParser.jj \
		|| die "javacc MdxParser.jj failed "
}
