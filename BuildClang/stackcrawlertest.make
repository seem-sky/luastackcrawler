# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug)
  OBJDIR     = ../Build/obj/Debug
  TARGETDIR  = ../simpletest
  TARGET     = $(TARGETDIR)/stackcrawlertest.dylib
  DEFINES   += -DDEBUG -D_DEBUG
  INCLUDES  += -I.. -I../LuaBridge/Source/LuaBridge -I../luatablestack -I../picojson -I../picojson_serializer
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -fPIC -v -stdlib=libc++ -std=c++11 -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -dynamiclib -flat_namespace
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llua -lc++
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	mv ../simpletest/stackcrawlertest.dylib ../simpletest/stackcrawlertest.so
  endef
endif

ifeq ($(config),release)
  OBJDIR     = ../Build/obj/Release
  TARGETDIR  = ../simpletest
  TARGET     = $(TARGETDIR)/stackcrawlertest.dylib
  DEFINES   += -DRELEASE
  INCLUDES  += -I.. -I../LuaBridge/Source/LuaBridge -I../luatablestack -I../picojson -I../picojson_serializer
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -fPIC -v -stdlib=libc++ -std=c++11 -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -Wl,-x -dynamiclib -flat_namespace
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llua -lc++
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	mv ../simpletest/stackcrawlertest.dylib ../simpletest/stackcrawlertest.so
  endef
endif

ifeq ($(config),debug32)
  OBJDIR     = ../Build/obj/x32/Debug
  TARGETDIR  = ../simpletest
  TARGET     = $(TARGETDIR)/stackcrawlertest.dylib
  DEFINES   += -DDEBUG -D_DEBUG
  INCLUDES  += -I.. -I../LuaBridge/Source/LuaBridge -I../luatablestack -I../picojson -I../picojson_serializer
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m32 -fPIC -v -stdlib=libc++ -std=c++11 -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -dynamiclib -flat_namespace -m32 -L/usr/lib32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llua -lc++
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	mv ../simpletest/stackcrawlertest.dylib ../simpletest/stackcrawlertest.so
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../Build/obj/x32/Release
  TARGETDIR  = ../simpletest
  TARGET     = $(TARGETDIR)/stackcrawlertest.dylib
  DEFINES   += -DRELEASE
  INCLUDES  += -I.. -I../LuaBridge/Source/LuaBridge -I../luatablestack -I../picojson -I../picojson_serializer
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m32 -fPIC -v -stdlib=libc++ -std=c++11 -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -Wl,-x -dynamiclib -flat_namespace -m32 -L/usr/lib32
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llua -lc++
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	mv ../simpletest/stackcrawlertest.dylib ../simpletest/stackcrawlertest.so
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../Build/obj/x64/Debug
  TARGETDIR  = ../simpletest
  TARGET     = $(TARGETDIR)/stackcrawlertest.dylib
  DEFINES   += -DDEBUG -D_DEBUG
  INCLUDES  += -I.. -I../LuaBridge/Source/LuaBridge -I../luatablestack -I../picojson -I../picojson_serializer
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -m64 -fPIC -v -stdlib=libc++ -std=c++11 -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -dynamiclib -flat_namespace -m64 -L/usr/lib64
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llua -lc++
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	mv ../simpletest/stackcrawlertest.dylib ../simpletest/stackcrawlertest.so
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../Build/obj/x64/Release
  TARGETDIR  = ../simpletest
  TARGET     = $(TARGETDIR)/stackcrawlertest.dylib
  DEFINES   += -DRELEASE
  INCLUDES  += -I.. -I../LuaBridge/Source/LuaBridge -I../luatablestack -I../picojson -I../picojson_serializer
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -m64 -fPIC -v -stdlib=libc++ -std=c++11 -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L.. -Wl,-x -dynamiclib -flat_namespace -m64 -L/usr/lib64
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LIBS      += -llua -lc++
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(LIBS) $(LDFLAGS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
	@echo Running post-build commands
	mv ../simpletest/stackcrawlertest.dylib ../simpletest/stackcrawlertest.so
  endef
endif

OBJECTS := \
	$(OBJDIR)/lauvalueutil.o \
	$(OBJDIR)/luastack.o \
	$(OBJDIR)/luastackcrawler.o \
	$(OBJDIR)/luatablecrawler.o \
	$(OBJDIR)/luavalue.o \
	$(OBJDIR)/picojson_luavalue_serializer.o \
	$(OBJDIR)/stackcrawlertest.o \
	$(OBJDIR)/stackcrawlertest_lib.o \
	$(OBJDIR)/test.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking stackcrawlertest
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning stackcrawlertest
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
ifeq (posix,$(SHELLTYPE))
	-$(SILENT) cp $< $(OBJDIR)
else
	$(SILENT) xcopy /D /Y /Q "$(subst /,\,$<)" "$(subst /,\,$(OBJDIR))" 1>nul
endif
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
endif

$(OBJDIR)/lauvalueutil.o: ../luatablestack/lauvalueutil.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/luastack.o: ../luatablestack/luastack.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/luastackcrawler.o: ../luatablestack/luastackcrawler.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/luatablecrawler.o: ../luatablestack/luatablecrawler.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/luavalue.o: ../luatablestack/luavalue.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/picojson_luavalue_serializer.o: ../simpletest/picojson_luavalue_serializer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/stackcrawlertest.o: ../simpletest/stackcrawlertest.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/stackcrawlertest_lib.o: ../simpletest/stackcrawlertest_lib.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"
$(OBJDIR)/test.o: ../simpletest/test.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)