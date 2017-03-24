# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:5}"
MY_P="${MY_PN}-${PV}"
BASE_URI="https://github.com/apache/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Relational database implemented entirely in Java - ${PN:6}"
HOMEPAGE="https://db.apache.org/${PN}/"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/ant-core:0
	~dev-java/derby-shared-${PV}:${SLOT}
	dev-java/osgi-core-api:6
"

DEPEND="${CP_DEPEND}
	dev-java/javacc:0
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/java/${PN:6}"

java_prepare() {
	cd "${S}/org/apache/derby/impl/sql/compile/" || die
	javacc "sqlgrammar.jj" || die "javacc sqlgrammar.jj failed"

	# Nasty temp hack, file is part of derby-build
	# may stay and remove file from derby-build, or leave duplicated
	local my_path
	my_path="org/apache/derbyPreBuild"
	mkdir "${S}/${my_path}" || die "Could not create ${S}/${my_path}"
	cp "${S}/../build/${my_path}/ReleaseProperties.java" \
		"${S}/${my_path}/" \
		|| die "Copying ReleaseProperties.java failed"
}
