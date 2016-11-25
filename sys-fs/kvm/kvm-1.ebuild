# Copyright 2016 Obsidian-Studios, Inc.
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit udev user

DESCRIPTION="KVM group and device node file"
HOMEPAGE="http://www.gentoo.org/"
KEYWORDS="~amd64"
LICENSE="GPL-2"
SRC_URI=""
SLOT="0"

RDEPEND="virtual/udev"

DEPEND=""

S="${WORKDIR}"

KVM_RULES="65-kvm.rules"

pkg_setup() {
	enewgroup kvm 36
}

src_prepare() {
	default
	echo 'KERNEL=="kvm", NAME="%k", GROUP="kvm", MODE="0660"' \
		> ${KVM_RULES} || die
}

src_install() {
	udev_dorules ${KVM_RULES}
}
