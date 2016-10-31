# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="jclouds"
MY_PV="${PV/_/-}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="JClouds Core"
SLOT="$(get_version_component_range 1-2)"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/archive/rel/${MY_P}.zip"
HOMEPAGE="https://jclouds.apache.org/"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
IUSE=""

GUICE_SLOT="4"

CP_DEPEND="dev-java/auto-service:0
	dev-java/guava:19
	dev-java/gson:2.2.2
	dev-java/guice:${GUICE_SLOT}
	dev-java/guice-extensions-assistedinject:${GUICE_SLOT}
	dev-java/javax-inject:0
	dev-java/jax-rs:2
	dev-java/osgi-core-api:6
	dev-java/rocoto:6"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.7"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.7"

S="${WORKDIR}/${MY_PN}-rel-${MY_P}/core"

JAVA_SRC_DIR="src/main/java"
