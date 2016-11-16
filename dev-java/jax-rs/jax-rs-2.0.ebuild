# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

REV="A"

DESCRIPTION="Reference implementation of the Java API for RESTful Services"
HOMEPAGE="https://jax-rs-spec.java.net/"
DOWNLOAD_PAGE="http://download.oracle.com/otndocs/jcp/${PN/-/}-${PV/./_}_rev_${REV}-mrel-spec/index.html"
SRC_URI="javax.ws.rs-api-${PV}.rev.${REV}-sources.jar"
RESTRICT="fetch"
LICENSE="oracle-jsr339"
SLOT="2"
KEYWORDS="~amd64"

DEPEND="app-arch/unzip:0
	>=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

pkg_nofetch() {
	einfo "Please go to"
	einfo " ${DOWNLOAD_PAGE}"
	einfo "and download file:"
	einfo "JSR-000339 ${PN^^} ${PV} rev ${REV} sources"
	einfo "Place the file ${SRC_URI} in:"
	einfo " ${DISTDIR}"
}
