TERMUX_PKG_HOMEPAGE=https://apps.gnome.org/TextEditor/
TERMUX_PKG_DESCRIPTION="GNOME Text Editor is a simple text editor focused on a pleasing default experience"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="47.1"
TERMUX_PKG_SRCURL=https://download.gnome.org/sources/gnome-text-editor/${TERMUX_PKG_VERSION%.*}/gnome-text-editor-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=de95642e2b40ff265feecd86b939e0fd018e4eb2ba499350f2bad2bfcc54010c
TERMUX_PKG_DISABLE_GIR=false
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="editorconfig-core-c, glib, gtk4, gtksourceview5, libadwaita, libandroid-wordexp, libcairo, libspelling, pango"
TERMUX_PKG_BUILD_DEPENDS="g-ir-scanner, glib-cross, valac"
TERMUX_PKG_RECOMMENDS="gnome-text-editor-help"

termux_step_pre_configure() {
	# Workaround strict compiler error
	sed -i "s/-Werror/-Wno-error/g" meson.build

	termux_setup_gir
	termux_setup_glib_cross_pkg_config_wrapper

	export LDFLAGS+=" -landroid-wordexp"
}
