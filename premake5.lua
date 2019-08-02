project "squirrel"
    kind "StaticLib"
    language "C++"
	cppdialect "C++17"
	staticruntime "On"
    
	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputDir .. "/%{prj.name}")
	
	files {
		"./squirrel/**.cpp",
		"./squirrel/**.h",
		
		"./sqstdlib/**.cpp",
		"./sqstdlib/**.h",
		
		"./include/**.h",
	}
	
	includedirs { 
		"./include"
	}
	
	undefines {
		"UNICODE",
		"_UNICODE",
		"SQUNICODE"
	}
	
	defines {
		"_SQ64"
	}
	
	filter "system:windows"
        systemversion "latest"
		defines { '_CRT_SECURE_NO_WARNINGS' }
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines { 'DEBUG' }
	
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		defines { 'NDEBUG' }
	
	filter "configurations:Distribute"
		runtime "Release"
		optimize "on"
		defines { 'NDEBUG' }
