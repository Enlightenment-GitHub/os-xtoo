# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

JAVA_PKG_IUSE="doc source examples"

inherit java-pkg-2 java-ant-2

MY_P="rel_${PV//./_}_ga"

DESCRIPTION="Javassist makes Java bytecode manipulation simple"
HOMEPAGE="http://jboss-javassist.github.io/javassist/"
SRC_URI="https://github.com/jboss-${PN}/${PN}/archive/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-1.1"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip
	>=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${PN}-${MY_P}"

EANT_DOC_TARGET="javadocs"
JAVA_ANT_REWRITE_CLASSPATH=y
EANT_NEEDS_TOOLS="yes"

src_install() {
	java-pkg_dojar ${PN}.jar
	dohtml Readme.html || die
	use doc && java-pkg_dojavadoc html
	use source && java-pkg_dosrc src/main/javassist
	use examples && java-pkg_doexamples sample/*
}
