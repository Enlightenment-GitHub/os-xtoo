# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="eclipse.jdt.ui"
MY_PV="R${PV//./_}"
MY_PV="${MY_PV^^}"
MY_P="${MY_PN}-${MY_PV}"
BASE_URI="https://github.com/${PN:0:7}/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}"
else
	SRC_URI="${BASE_URI}/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="${MY_P}"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Eclipse JDT Core Manipulation (org.eclipse.jdt.core.manipulation)"
HOMEPAGE="${BASE_URI}"
LICENSE="EPL-1.0"
SLOT="$(get_version_component_range 1-2)"

CP_DEPEND="
	~dev-java/eclipse-core-expressions-${PV}:${SLOT}
	~dev-java/eclipse-core-jobs-${PV}:${SLOT}
	~dev-java/eclipse-core-resources-${PV}:${SLOT}
	~dev-java/eclipse-core-runtime-${PV}:${SLOT}
	~dev-java/eclipse-equinox-common-${PV}:${SLOT}
	~dev-java/eclipse-jdt-core-${PV}:${SLOT}
	~dev-java/eclipse-ltk-core-refactoring-${PV}:${SLOT}
	~dev-java/eclipse-text-${PV}:${SLOT}
	~dev-java/eclipse-osgi-${PV}:${SLOT}
	dev-java/icu4j:56
	dev-java/osgi-core-api:6
"
#	~dev-java/eclipse-core-commands-${PV}:${SLOT}
#	~dev-java/eclipse-core-filebuffers-${PV}:${SLOT}
#	~dev-java/eclipse-core-filesystem-${PV}:${SLOT}
#	~dev-java/eclipse-equinox-preferences-${PV}:${SLOT}
#	~dev-java/eclipse-equinox-registry-${PV}:${SLOT}

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_S}/org.${PN//-/.}/"

JAVA_SRC_DIR="common refactoring"
