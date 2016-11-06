# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

MY_PN="${PN:3}"
MY_P="${MY_PN}-${PV}"

EGO_SRC=${PN}/${MY_PN}
EGO_PN=${EGO_SRC}/...

if [[ ${PV} = *9999* ]]; then
	ECLASS="golang-vcs"
else
	KEYWORDS="~amd64"
	SRC_URI="https://${EGO_SRC}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	ECLASS="golang-vcs-snapshot"
fi

inherit golang-build ${ECLASS}

DESCRIPTION="A CLI for Rackspace"
HOMEPAGE="https://${EGO_SRC}"
LICENSE="Apache-2.0"
SLOT="0"

CDEPEND=""
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

#src_install() {
#        golang-build_src_install
#        dobin bin/*
#}
