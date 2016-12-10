# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="doc source"

MY_PN="log4j"
MY_P="${MY_PN}-${PV}"
BASE_URI="https://github.com/apache/logging-log4j2"

if [[ ${PV} == 9999 ]]; then
	ECLASS="git-r3"
	EGIT_REPO_URI="${BASE_URI}.git"
	MY_S="${P}/${PN}"
else
	SRC_URI="${BASE_URI}/archive/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	MY_S="logging-log4j2-${MY_P}/${PN}/"
fi

inherit java-pkg-2 java-pkg-simple ${ECLASS}

DESCRIPTION="Apache Logging Log4J2 ${PN#log4j-}"

HOMEPAGE="http://logging.apache.org/log4j/"
LICENSE="Apache-2.0"
SLOT="0"

JACKSON_SLOT="2"

CP_DEPEND="
	dev-java/commons-compress:0
	dev-java/commons-csv:0
	dev-java/conversant-disruptor:0
	dev-java/disruptor:3.3
	dev-java/eclipse-javax-persistence:2
	dev-java/jackson:${JACKSON_SLOT}
	dev-java/jackson-annotations:${JACKSON_SLOT}
	dev-java/jackson-databind:${JACKSON_SLOT}
	dev-java/jackson-dataformat-xml:${JACKSON_SLOT}
	dev-java/jackson-dataformat-yaml:${JACKSON_SLOT}
	dev-java/jansi:0
	dev-java/javax-jms-api:2
	dev-java/jcommander:0
	dev-java/jctools-core:2
	dev-java/jeromq:0
	dev-java/kafka-clients:0
	~dev-java/log4j-api-${PV}:${SLOT}
	dev-java/oracle-javamail:0
	dev-java/osgi-core-api:6
	dev-java/stax2-api:0
"

RDEPEND="${CP_DEPEND}
	>=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_S}/"

JAVA_SRC_DIR="src/main/java"
JAVA_ADDRES_DIR="src/main/resources"
