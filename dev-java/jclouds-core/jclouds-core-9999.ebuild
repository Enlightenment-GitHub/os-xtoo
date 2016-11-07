# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="jclouds"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}"

BASE_URI="https://github.com/${MY_PN}/${MY_PN}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	S="${WORKDIR}/${P}/core"
else
	SRC_URI="${BASE_URI}/archive/rel/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_PN}-rel-${MY_P}/core"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="JClouds Core"
SLOT="0"
HOMEPAGE="https://jclouds.apache.org/"
LICENSE="Apache-2.0"

GUICE_SLOT="4"

CP_DEPEND="
	dev-java/auto-service:0
	dev-java/guava:20
	dev-java/gson:2.2.2
	dev-java/guice:${GUICE_SLOT}
	dev-java/guice-extensions-assistedinject:${GUICE_SLOT}
	dev-java/javax-inject:0
	dev-java/jax-rs:2
	dev-java/osgi-core-api:6
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.7"

if [[ ${PV} == 9999 ]]; then
	S="${WORKDIR}/${P}/core"
else
	S="${WORKDIR}/${MY_PN}-rel-${MY_P}/core"
fi

JAVA_SRC_DIR="src/main/java"
