VENDOR=$(cat device/samsung/universal7885-common/vendor_name)
if [ ! $VENDOR ]; then
VENDOR=aosp;
fi

# Generate AndroidProducts.mk
echo "# Auto-Generated by device/samsung/a20e/setup.sh" > device/samsung/a20e/AndroidProducts.mk
echo "PRODUCT_MAKEFILES += \$(LOCAL_DIR)/"$VENDOR"_a20e.mk" >>  device/samsung/a20e/AndroidProducts.mk

# Generate <vendor>_a20e.mk
echo "# Auto-Generated by device/samsung/a20e/setup.sh" > device/samsung/a20e/"$VENDOR"_a20e.mk
echo "\$(call inherit-product, device/samsung/a20e/full_a20e.mk)" >> device/samsung/a20e/"$VENDOR"_a20e.mk
if test -f vendor/"$VENDOR"/config/common_full_phone.mk && echo "common_full_phone"; then
	echo "\$(call inherit-product, vendor/"$VENDOR"/config/common_full_phone.mk)" >> device/samsung/a20e/"$VENDOR"_a20e.mk
elif test -f vendor/"$VENDOR"/config/common.mk && echo "common"; then
	echo "\$(call inherit-product, vendor/"$VENDOR"/config/common.mk)" >> device/samsung/a20e/"$VENDOR"_a20e.mk
fi
echo "PRODUCT_NAME := "$VENDOR"_a20e" >> device/samsung/a20e/"$VENDOR"_a20e.mk
echo "" >>  device/samsung/a20e/"$VENDOR"_a20e.mk
echo "# Additional Props" >>  device/samsung/a20e/"$VENDOR"_a20e.mk
echo "TARGET_FACE_UNLOCK_SUPPORTED := true" >>  device/samsung/a20e/"$VENDOR"_a20e.mk
echo "TARGET_BOOT_ANIMATION_RES := 720" >> device/samsung/a20e/"$VENDOR"_a20e.mk
