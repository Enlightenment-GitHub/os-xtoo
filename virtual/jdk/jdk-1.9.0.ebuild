# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Virtual for Java Development Kit (JDK)"
KEYWORDS="~amd64"
SLOT="9"

RDEPEND="|| (
		dev-java/oracle-jdk-bin:${SLOT}
	)"
