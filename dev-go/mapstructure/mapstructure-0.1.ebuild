# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

EGO_SRC=github.com/mitchellh/${PN}
EGO_PN=${EGO_SRC}/...

if [[ ${PV} = *9999* ]]; then
	ECLASS="golang-vcs"
else
	KEYWORDS="~amd64"
	SRC_URI="https://${EGO_SRC}/archive/master.tar.gz -> ${P}.tar.gz"
	ECLASS="golang-vcs-snapshot"
fi

inherit golang-build ${ECLASS}

DESCRIPTION="Library for decoding generic map values into native Go structures"
HOMEPAGE="https://${EGO_SRC}"
LICENSE="MIT"
SLOT="0"
