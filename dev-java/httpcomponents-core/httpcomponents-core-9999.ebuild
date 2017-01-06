# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="http${PN:15}"
MY_P="${MY_PN}-${PV}"
MY_MOD="${MY_PN}"
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
DESCRIPTION="Low level HTTP transport components"
HOMEPAGE="https://hc.apache.org/${PN}-${SLOT}.x/"
LICENSE="Apache-2.0"

DEPEND=">=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/${MY_MOD}"

JAVA_SRC_DIR="src/main/java"
