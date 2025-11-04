include src/main/c/platform.mk

define ONLY_GRADLE
You haven't specified a platform to build the native library, so I'm only going
to build the Java portion of the project. To build natives, specify a platform:

    make linux|osx|freebsd|windows

endef

fast:
	rm -f $$(find -name '*.o')
	make -C src/main/c/ arm32v8HF
	cd src/main/c/resources/ && zip -0u ../../../../build/libs/nrjavaserial-5.2.1.jar native/linux/ARM_32/libNRJavaSerialv8_HF.so

only-gradle:
	$(info $(ONLY_GRADLE))
	$(call gradlew-build)
%:
	$(MAKE) -C src/main/c $@
	$(call gradlew-build)
