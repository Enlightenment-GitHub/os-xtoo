# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

if [[ ${PV} == 9999 ]]; then
	ECLASS="bzr"
	EBZR_REPO_URI="lp:appmenu-qt5"

else
	SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${PN}-${PV}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

inherit eutils qmake-utils ${ECLASS}

DESCRIPTION="Application menu module for Qt5"
HOMEPAGE="https://launchpad.net/appmenu-qt5"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
IUSE=""

DEPEND="dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5"

RDEPEND="${DEPEND}"

DOCS=( COPYING README )

src_configure() {
	# adds /etc/profile.d/appmenu-qt5.sh
	eqmake5 "CONFIG+=enable-by-default"
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
