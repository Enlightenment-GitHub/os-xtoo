# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="httpcore"
MY_P="${MY_PN}-${PV}"
MY_MOD="${MY_PN}-${PN:20}"
BASE_URI="https://github.com/apache/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
else
	SRC_URI="${BASE_URI}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

SLOT="$(get_version_component_range 1-2)"
DESCRIPTION="Low level HTTP transport components ${MY_MOD}"
HOMEPAGE="https://hc.apache.org/${PN:0:19}-${SLOT}.x/"
LICENSE="Apache-2.0"

CP_DEPEND="~dev-java/httpcomponents-core-${PV}:${SLOT}"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/${MY_MOD}"

JAVA_SRC_DIR="src/main/java"
