# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="${PN:0:19}"
MY_PV="${PV}.Final"
MY_P="${MY_PN}-${MY_PV}"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Hibernate Validator ${PN:20}"
HOMEPAGE="https://hibernate.org/validator"
SRC_URI="https://github.com/${PN:0:9}/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="$(get_major_version)"

CP_DEPEND="
	dev-java/beanvalidation-api:1.0
	dev-java/eclipse-javax-persistence:2
	dev-java/jboss-logging:0
	dev-java/joda-time:0
	dev-java/jsoup:0
"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/${PN:20}"

JAVA_SRC_DIR="src/main/java"
JAVA_ADDRES_DIRS="src/main/resources"

java_prepare() {
	xjc -enableIntrospection \
		-p org.hibernate.validator.internal.xml \
		-extension -target 2.1 -d "${S}/${JAVA_SRC_DIR}" \
		"${S}/src/main/xsd/validation-configuration-1.0.xsd" \
		"${S}/src/main/xsd/validation-mapping-1.0.xsd" \
		-b "${S}/src/main/xjb/binding-customization.xjb" \
		|| die "Failed to generate java files via xjc"
}
