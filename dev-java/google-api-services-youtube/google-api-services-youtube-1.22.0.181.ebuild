# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_GPV="${PV%*\.*}"
MY_PV="v3-rev${PV#*.*.*.}-${PV%*\.*}"
MY_P="${PN}-${MY_PV}"

SRC_URI="http://central.maven.org/maven2/com/google/apis/${PN}/${MY_PV}/${MY_P}-sources.jar"
KEYWORDS="~amd64"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="YouTube Data API Client Library for Java"
HOMEPAGE="https://developers.google.com/api-client-library/java/apis/youtube/v3"
LICENSE="Apache-2.0"
SLOT="0"

CP_DEPEND="
	~dev-java/google-api-client-${MY_GPV}:${SLOT}
	~dev-java/google-http-client-${MY_GPV}:${SLOT}
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"
