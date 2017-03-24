# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

BASE_URI="https://github.com/${PN}/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Open source framework for processing XML"
HOMEPAGE="https://${PN}.github.io"
LICENSE="${PN}"
SLOT="$(get_major_version)"

CP_DEPEND="
	dev-java/jaxen:1.1
	dev-java/relaxng-datatype:0
	dev-java/xpp2:0
	dev-java/xpp3:0
	dev-java/xsdlib:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${P}"

PATCHES=(
	"${FILESDIR}/xpp3-add-removeAttribute.patch"
)
