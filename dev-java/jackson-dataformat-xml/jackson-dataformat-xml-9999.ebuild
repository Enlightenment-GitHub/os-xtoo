# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

BASE_URI="https://github.com/FasterXML/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${PN}-${P}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Jackson support for serializing POJOs as XML"
HOMEPAGE="http://wiki.fasterxml.com/JacksonExtensionXmlDataBinding"
LICENSE="Apache-2.0"
SLOT="$(get_major_version)"

CP_DEPEND="
	~dev-java/jackson-annotations-${PV}:${SLOT}
	~dev-java/jackson-core-${PV}:${SLOT}
	~dev-java/jackson-databind-${PV}:${SLOT}
	~dev-java/jackson-module-jaxb-annotations-${PV}:${SLOT}
	dev-java/stax2-api:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}/"

java_prepare() {
	local my_file
	my_file="${S}src/main/java/com/fasterxml/${PN//-//}/PackageVersion.java"
	sed -e "s|@package@|com.fasterxml.${PN//-/.}|g" \
		-e "s|@projectversion@|${PV}|g" \
		-e "s|@projectartifactid@|${PN}|g" \
		-e "s|@projectgroupid@|com.fasterxml.jackson.dataformat|g" \
		"${my_file}.in" > "${my_file}" \
		|| die "Could not set package version"
}
