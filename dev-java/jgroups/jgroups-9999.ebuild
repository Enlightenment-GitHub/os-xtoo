# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="JGroups"
MY_PV="${PV}.Final"
MY_P="${MY_PN}-${MY_PV}"
BASE_URI="https://github.com/belaban/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${MY_PN}-${MY_P}"
fi

inherit java-pkg-2 java-pkg-simple java-osgi ${ECLASS}

DESCRIPTION="JGroups is a toolkit for reliable multicast communication"
HOMEPAGE="https://www.jgroups.org/"
LICENSE="LGPL-2.1"
SLOT="$(get_major_version)"

CP_DEPEND="
	dev-java/log4j:0
	dev-java/log4j-api:0
	dev-java/log4j-core:0
	dev-java/slf4j-api:0
"

DEPEND="dev-java/bnd:3
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}"

JAVA_SRC_DIR="src"

java_prepare() {
	sed -i -e "/Bundle-Required*/d" "${S}/conf/jgroups.bnd" \
		|| die "Could not remove BREE from jgroups.bnd"
}

src_install() {
	java-osgi_dojar "${PN}.jar" "org.jgroups" "${MY_PN}" \
		"Export-Package: org.jgroups"
	mv "${PN}.jar" "bnd-${PN}.jar"
	bnd wrap -o "${PN}.jar" "bnd-${PN}.jar" \
		|| die "Could not wrap jar via bnd"
	java-pkg-simple_src_install
}
