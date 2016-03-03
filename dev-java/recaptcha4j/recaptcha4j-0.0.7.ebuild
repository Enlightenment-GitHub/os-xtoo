# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="reCAPTCHA Library for Java"
HOMEPAGE="http://code.google.com/p/recaptcha/"
SRC_URI="http://${PN/4j/}.googlecode.com/files/${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="app-arch/unzip:0
	>=virtual/jdk-1.8"

RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${P}"

JAVA_SRC_DIR="src/main/java"
