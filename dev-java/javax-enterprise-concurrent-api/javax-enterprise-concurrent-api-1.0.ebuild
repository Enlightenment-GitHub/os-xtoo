# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN//-/.}"
MY_PN="${MY_PN/t.a/t-a}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="JSR 236: Concurrency Utilities for Java EE"
HOMEPAGE="https://java.net/projects/concurrency-ee-spec"
SRC_URI="http://central.maven.org/maven2/${PN:0:5}/${PN:6:10}/${PN:17:10}/${MY_PN}/${PV}/${MY_P}-sources.jar"

LICENSE="|| ( CDDL GPL-2 )"
KEYWORDS="~amd64"
SLOT="0"

DEPEND="app-arch/unzip
	>=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"
