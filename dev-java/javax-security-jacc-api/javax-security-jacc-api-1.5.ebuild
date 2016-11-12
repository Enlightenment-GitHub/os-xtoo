# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN//-/.}"
MY_PN="${MY_PN/.ap/-ap}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Java Authorization Contract For Containers API"
HOMEPAGE="http://jcp.org/en/jsr/detail?id=115"
SRC_URI="http://central.maven.org/maven2/${PN:0:5}/${PN:6:8}/${PN:15:4}/${MY_PN}/${PV}/${MY_P}-sources.jar"

LICENSE="CDDL GPL-2-with-linking-exception"
SLOT="0"
KEYWORDS="~amd64"

CP_DEPEND="java-virtuals/servlet-api:4.0"

DEPEND="app-arch/unzip:0
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"
