-- scaffold geniefile for glad

glad_script = path.getabsolute(path.getdirectory(_SCRIPT))
glad_root = path.join(glad_script, "glad")

glad_includedirs = {
	path.join(glad_script, "config"),
	glad_root,
}

glad_libdirs = {}
glad_links = {}
glad_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { glad_includedirs }
	end,

	_add_defines = function()
		defines { glad_defines }
	end,

	_add_libdirs = function()
		libdirs { glad_libdirs }
	end,

	_add_external_links = function()
		links { glad_links }
	end,

	_add_self_links = function()
		links { "glad" }
	end,

	_create_projects = function()

project "glad"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		glad_includedirs,
	}

	defines {}

	files {
		path.join(glad_script, "config", "**.h"),
		path.join(glad_root, "**.h"),
		path.join(glad_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
