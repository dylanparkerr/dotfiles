-- The issues I was having were with lombok.. i think the sogeti was preventing the download..
-- copying the one i got from cfa mvn deps worked

-- trying new java plugin
vim.pack.add({
  {
    src = 'https://github.com/JavaHello/spring-boot.nvim',
    version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
  },
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-java/nvim-java',
})

require('java').setup()
vim.lsp.enable('jdtls')
vim.lsp.config('jdtls', {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home",
            default = true,
          }
        }
      }
    }
  }
})


-- -- Needed from :Mason
-- -- jdtls              - the language server
-- -- java-debug-adapter - to debug applications via explicit configuration, or automatically discovered main classes
-- -- java-test          - to debug junit tests, either whole classes or individual test methods
-- vim.pack.add({
--     {src = 'https://github.com/mfussenegger/nvim-jdtls'},  -- makes configuring jdtls less of a pain, even though its still a pain..
-- })
--
-- local jdtls = require("jdtls")
-- local home = vim.env.HOME
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = home .. "/jdtls-workspace/" .. project_name
-- local system_os = ""
--
-- local java_21
-- if vim.fn.has("mac") == 1 then
-- 	system_os = "mac"
--     java_21 ="/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home"
-- elseif vim.fn.has("unix") == 1 then
-- 	system_os = "linux"
--     java_21 ="/usr/lib/jvm/java-21-amazon-corretto"
-- elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
-- 	system_os = "win"
-- else
-- 	print("uhhh, defaulting to linux")
-- 	system_os = "linux"
-- end
--
-- -- needed for debugging
-- local bundles = {vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar")}
-- -- needed for running/debugging unit tests
-- vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", true), "\n"))
--
-- local config = {
-- 	cmd = {
-- 		"java", -- should be on path, java 17+
-- 		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
-- 		"-Dosgi.bundles.defaultStartLevel=4",
-- 		"-Declipse.product=org.eclipse.jdt.ls.core.product",
-- 		"-Dlog.protocol=true",
-- 		"-Dlog.level=ALL",
-- 		"-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
-- 		"-Xmx4g",
-- 		"--add-modules=ALL-SYSTEM",
-- 		"--add-opens",
-- 		"java.base/java.util=ALL-UNNAMED",
-- 		"--add-opens",
-- 		"java.base/java.lang=ALL-UNNAMED",
--
-- 		-- eclipse jdtls location
-- 		"-jar",
-- 		home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
-- 		"-configuration",
-- 		-- home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
-- 		home .. "/.local/share/nvim/mason/packages/jdtls/config",
-- 		"-data",
-- 		workspace_dir,
-- 	},
--
-- 	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),
--
-- 	-- eclipse.jdt.ls specific settings
-- 	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
-- 	settings = {
-- 		java = {
--             home = java_21,
-- 			eclipse = {
-- 				downloadSources = true,
-- 			},
-- 			configuration = {
-- 				updateBuildConfiguration = "interactive",
-- 				runtimes = {
-- 					-- {
-- 					-- 	name = "JavaSE-11",
-- 					-- 	path = java_11,
-- 					-- },
-- 					-- {
-- 					-- 	name = "JavaSE-17",
-- 					-- 	path = java_17,
-- 					-- },
-- 					{
-- 						name = "JavaSE-21",
-- 						path = java_21,
-- 					},
-- 				},
-- 			},
-- 			maven = {
-- 				downloadSources = true,
-- 			},
-- 			implementationsCodeLens = {
-- 				enabled = true,
-- 			},
-- 			referencesCodeLens = {
-- 				enabled = true,
-- 			},
-- 			references = {
-- 				includeDecompiledSources = true,
-- 			},
-- 			signatureHelp = { enabled = true },
-- 			format = {
-- 				enabled = false,
-- 				-- Formatting works by default, but you can refer to a specific file/URL if you choose
-- 				-- settings = {
-- 				--   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
-- 				--   profile = "GoogleStyle",
-- 				-- },
-- 			},
-- 		},
-- 		completion = {
-- 			favoriteStaticMembers = {
-- 				"org.hamcrest.MatcherAssert.assertThat",
-- 				"org.hamcrest.Matchers.*",
-- 				"org.hamcrest.CoreMatchers.*",
-- 				"org.junit.jupiter.api.Assertions.*",
-- 				"java.util.Objects.requireNonNull",
-- 				"java.util.Objects.requireNonNullElse",
-- 				"org.mockito.Mockito.*",
-- 			},
-- 			importOrder = {
-- 				"java",
-- 				"javax",
-- 				"com",
-- 				"org",
-- 			},
-- 		},
-- 		extendedClientCapabilities = jdtls.extendedClientCapabilities,
-- 		sources = {
-- 			organizeImports = {
-- 				starThreshold = 9999,
-- 				staticStarThreshold = 9999,
-- 			},
-- 		},
-- 		codeGeneration = {
-- 			toString = {
-- 				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
-- 			},
-- 			useBlocks = true,
-- 		},
-- 	},
-- 	-- needed for auto-completion with method signatures and placeholders
-- 	capabilities = require('config.completion').capabilities,
-- 	flags = {
-- 		allow_incremental_sync = true,
-- 	},
-- 	init_options = {
-- 		-- the bundles above to support debugging and unit testing
-- 		bundles = bundles,
-- 	},
-- }
--
-- -- needed for debugging
-- config["on_attach"] = function(client, bufnr)
-- 	jdtls.setup_dap({ hotcodereplace = "auto" })
-- 	require("jdtls.dap").setup_dap_main_class_configs()
-- end
--
-- vim.keymap.set("n", '<leader>tc', function()
--   if vim.bo.filetype == 'java' then
--     require('jdtls').test_class();
--   end
-- end)
--
-- vim.keymap.set("n", '<leader>tm', function()
--   if vim.bo.filetype == 'java' then
--     require('jdtls').test_nearest_method();
--   end
-- end)
--
-- -- starts a new client and server, or attaches to an existing client and server based on the `root_dir`
-- jdtls.start_or_attach(config)

