SKIPUNZIP=1

unzip -d "$MODPATH" "$ZIPFILE" -j "module.prop" >/dev/null
mkdir $MODPATH/system
mkdir $MODPATH/system/bin

if [ $ARCH == "arm" ]; then
	ui_print ""
	ui_print "- Ваша архитиктура $ARCH"
	ui_print "Распаковка adb"
	unzip -d "$MODPATH/system/bin" "$ZIPFILE" -j "adb_arm" >/dev/null
	mv "$MODPATH/system/bin/adb_arm" "$MODPATH/system/bin/adb"
	ui_print "Распаковка fastboot"
	unzip -d "$MODPATH/system/bin" "$ZIPFILE" -j "fastboot_arm" >/dev/null
	mv "$MODPATH/system/bin/fastboot_arm" "$MODPATH/system/bin/fastboot"
	ui_print "- Установка разрешений"
	set_perm $MODPATH/system/bin/adb 0 2000 755 u:object_r:system_file:s0
	set_perm $MODPATH/system/bin/fastboot 0 2000 755 u:object_r:system_file:s0
elif [ $ARCH == "arm64" ]; then
	ui_print ""
	ui_print "- Ваша архитиктура $ARCH"
	ui_print "- Распаковка adb"
	unzip -d "$MODPATH/system/bin" "$ZIPFILE" -j "adb_arm64" >/dev/null
	mv "$MODPATH/system/bin/adb_arm64" "$MODPATH/system/bin/adb"
	ui_print "- Распаковка fastboot"
	unzip -d "$MODPATH/system/bin" "$ZIPFILE" -j "fastboot_arm64" >/dev/null
	mv "$MODPATH/system/bin/fastboot_arm64" "$MODPATH/system/bin/fastboot"
	ui_print "- Установка разрешений"
	set_perm $MODPATH/system/bin/adb 0 2000 755 u:object_r:system_file:s0
	set_perm $MODPATH/system/bin/fastboot 0 2000 755 u:object_r:system_file:s0
else
	abort "Ваша архитиктура $ARCH, не поддерживается"
fi;
