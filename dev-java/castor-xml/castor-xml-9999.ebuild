# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:6}"
MY_PV="${PV}"
MY_P="${MY_PN}-${MY_PV}"

BASE_URI="https://github.com/${MY_PN}-data-binding/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
#	SRC_URI="${BASE_URI}/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	SRC_URI="https://repo1.maven.org/maven2/org/codehaus/${MY_PN}/${PN}/${PV}/${P}-sources.jar"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Castor ${PN:7}"
HOMEPAGE="https://${MY_PN}-data-binding.github.io/${MY_PN}/"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	~dev-java/castor-core-${PV}:${SLOT}
	dev-java/commons-logging:0
	dev-java/commons-lang:2.1
	dev-java/jakarta-oro:2.0
	dev-java/jakarta-regexp:1.5
	dev-java/javax-inject:0
	dev-java/ldapsdk:4.1
	dev-java/spring-context:4.3
"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

#S="${WORKDIR}/${MY_P}/${PN:7}"

#JAVA_SRC_DIR="src/main/java"
#JAVA_ADDRES_DIRS="src/main/resources"

#java_prepare() {
#	Need to process mapping-binding.xml
#	xjc -enableIntrospection -extension \
#		-d "${S}/${JAVA_SRC_DIR}" \
#		-p org.exolab.castor.mapping.xml \
#		"${S}/${JAVA_ADDRES_DIRS}/org/exolab/castor/mapping/mapping.xsd" \
#		|| die "Failed to generate java files via xjc"
#}
