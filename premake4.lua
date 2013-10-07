local OS=os.get()

local cmd = {
 dir =     { linux = "ls", windows = "dir", macosx = "ls" },
 libdirs = { linux = { "" }, windows = { "./Lua/lib" }, macosx = { "" } },
 includedirs = { linux = { "/usr/include/lua5.1"}, windows = { "./Lua/include", os.getenv("BOOST") }, macosx = { "" } },
 links = { linux = { "lua5.1-c++" }, windows = { "lua5.1" }, macosx = { "lua","c++" } },
 location = { linux = "Build", windows = "Build", macosx = "BuildClang" },
 buildoptions = { linux = "-v -std=gnu++0x -fPIC", windows = "-v -std=c++11 -fPIC", macosx = "-v -stdlib=libc++ -std=c++11 -fPIC" }
}

local cfg={}

for i,v in pairs(cmd) do
 cfg[i]=cmd[i][OS]
end

local function concat( array1, array2 )
	local res = {}
	for _,v in ipairs(array1) do
		res[#res+1] = v
	end
	for _,v in ipairs(array2) do
		res[#res+1] = v
	end
	return res
end

-- Apply to current "filter" (solution/project)
function DefaultConfig()
	location( cfg.location )
	configuration "Debug"
		defines { "DEBUG", "_DEBUG" }
		objdir "Build/obj"
		targetdir "simpletest"
		targetprefix ""
		flags { "Symbols" }
	configuration "Release"
		defines { "RELEASE" }
		objdir "Build/obj"
		targetdir "simpletest"
		targetprefix ""
		flags { "Optimize" }
	configuration "*" -- to reset configuration filter
end

function CompilerSpecificConfiguration()
	configuration {"xcode*" }

	configuration {"gmake"}
		buildoptions( cfg.buildoptions )

	configuration {"codeblocks" }

	configuration { "vs*"}

	configuration { "macosx" }
		postbuildcommands { "mv ../simpletest/stackcrawlertest.dylib ../simpletest/stackcrawlertest.so" }

	configuration { "*" }
end

----------------------------------------------------------------------------------------------------------------

newaction {
   trigger     = "test",
   description = "run lua test",
   execute     = function ()
      os.execute("cd simpletest && busted json_test.lua && cd ..")
   end
}

----------------------------------------------------------------------------------------------------------------

-- A solution contains projects, and defines the available configurations
local sln=solution "stackcrawlertest"
	location( cfg.location )
		sln.absbasedir=path.getabsolute(sln.basedir)
		configurations { "Debug", "Release" }
		platforms { "native","x32", "x64" }
   print 'project'
		libdirs ( cfg.libdirs )
		includedirs (concat ( cfg.includedirs, { 
			[[./LuaBridge/Source/LuaBridge]],
			[[./luatablestack]],
			[[./picojson]],
			[[./picojson_serializer]]
		} ) )
		vpaths {
			["Headers"] = {"**.h","**.hpp"},
			["Sources"] = {"**.c", "**.cpp"},
		}

----------------------------------------------------------------------------------------------------------------
   local dll=project "stackcrawlertest"
	location( cfg.location )
		kind "SharedLib"
		DefaultConfig()
		language "C++"
		files {
			"./pugilua/*.h",
			"./luatablestack/*.cpp",
			"./simpletest/*.cpp",
			"./simpletest/*.h"
		}
		links(cfg.links)
		CompilerSpecificConfiguration()