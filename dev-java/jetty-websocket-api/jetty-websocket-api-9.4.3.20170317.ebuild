# Copyright 2016-2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Jetty's WebSocket API"

MY_PN="jetty"
MY_PV="$(replace_version_separator 3 '.v')"
MY_PV="${MY_PV/_rc/.RC}"
MY_P="${MY_PN}-${MY_PV}"

SLOT="$(get_version_component_range 1-2)"
SRC_URI="https://github.com/eclipse/${MY_PN}.project/archive/${MY_P}.tar.gz"
HOMEPAGE="https://www.eclipse.org/${MY_PN}/"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"

RDEPEND=">=virtual/jre-1.8"

DEPEND=">=virtual/jdk-1.8"

S="${WORKDIR}/${MY_PN}.project-${MY_P}/${PN:0:15}/${PN:6}"
