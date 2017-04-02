# Copyright 2017 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

# Based on ebuild from enlightenment-live overlay
# Copyright 1999-2016 Gentoo Foundation

EAPI="6"

MY_P="${PN}-${PV/_/-}"

if [[ ${PV} == 9999 ]]; then
	ECLASS="autotools git-r3"
	EGIT_REPO_URI="https://git.enlightenment.org/apps/${PN}.git"
else
	SRC_URI="http://www.smhouston.us/stuff/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
fi

inherit eutils ${ECLASS}

DESCRIPTION="Enlightenment image viewer built on the EFL."
HOMEPAGE="http://www.smhouston.us/${PN}/"
LICENSE="BSD-2"
SLOT="0"

IUSE="doc nls static-libs"

RDEPEND=">=dev-libs/efl-1.18.0"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	[[ ${PV} = 9999 ]] && eautoreconf
}

src_configure() {
	local config=(
		$(use_enable nls)
		$(use_enable static-libs static)
	)

	econf "${config[@]}"
}

src_install() {
	default
	prune_libtool_files
}
