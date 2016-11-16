# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

#inherit cmake-utils

DESCRIPTION="An install helper program for desktop stuff"
HOMEPAGE="https://github.com/${PN}/${PN}/wiki"
SRC_URI="https://github.com/${PN}/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN}-release-${PV}/"
