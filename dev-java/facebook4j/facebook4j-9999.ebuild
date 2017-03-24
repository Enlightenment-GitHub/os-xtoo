# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

BASE_URI="https://github.com/roundrop/${PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Easily usable Facebook Graph API binding library"
HOMEPAGE="https://${PN}.github.io"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	dev-java/commons-logging:0
	dev-java/log4j:0
	dev-java/slf4j-api:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${P}/${PN}-core"

# hours comes after mission or will fail
PATCHES=(
	"${FILESDIR}/album-picture.patch"
	"${FILESDIR}/hashmap-linkedhashmap.patch"
	"${FILESDIR}/page-mission.patch"
	"${FILESDIR}/page-hours.patch"
)
