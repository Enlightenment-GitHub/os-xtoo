# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"
JAVA_NO_COMMONS=1

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java continuation object creator"
HOMEPAGE="https://commons.apache.org/sandbox/${PN}/"
SRC_URI="https://repo1.maven.org/maven2/com/google/code/maven-play-plugin/org/apache/${PN:0:7}/${PN}/1590792-patched-play-${PV}/${PN}-1590792-patched-play-${PV}-sources.jar"
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"

CP_DEPEND="
	dev-java/ant-core:0
	dev-java/asm:4
	dev-java/commons-jci-core:0
	dev-java/commons-logging:0
"

DEPEND="app-arch/unzip
	${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"
