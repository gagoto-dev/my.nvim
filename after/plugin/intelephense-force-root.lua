-- ~/.config/nvim/after/plugin/intelephense-force-root.lua
-- local ROOT = "/var/www/ION-V2"
local ROOT = "/srv/http/ionsmart.local"

local lspconfig = vim.lsp.config

-- 1) Parchea la definición registrada en lspconfig para que SIEMPRE use /var/www/ION-V2
do
	local doc = lspconfig.intelephense and lspconfig.intelephense.document_config
	if doc and doc.default_config then
		doc.default_config.root_dir = function(_)
			return ROOT
		end
		doc.default_config.before_init = function(params, _)
			params.rootUri = vim.uri_from_fname(ROOT)
			params.rootPath = ROOT
			params.workspaceFolders = { { name = ROOT, uri = params.rootUri } }
		end
		doc.default_config.single_file_support = false
		-- (opcional) por si tienes archivos grandes
		doc.default_config.settings = doc.default_config.settings or {}
		doc.default_config.settings.intelephense = doc.default_config.settings.intelephense or {}
		doc.default_config.settings.intelephense.files = { maxSize = 2000000 }
	end
end

-- 2) Si ya hay un cliente intelephense vivo con root mal, páralo
for _, c in ipairs(vim.lsp.get_clients()) do
	if c.name == "intelephense" and c.config and c.config.root_dir ~= ROOT then
		c.stop(true)
	end
end

-- 4) Guardia: si se adjunta con la raíz equivocada, lo reiniciamos con la buena
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("IntelephenseForceRoot", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "intelephense" then
			if client.config.root_dir ~= ROOT then
				client.stop(true)
				vim.defer_fn(function()
					-- vuelve a arrancar sobre el buffer actual
					vim.lsp.start({
						name = "intelephense",
						cmd = { "intelephense", "--stdio" },
						root_dir = ROOT,
						before_init = function(params, _)
							params.rootUri = vim.uri_from_fname(ROOT)
							params.rootPath = ROOT
							params.workspaceFolders = { { name = ROOT, uri = params.rootUri } }
						end,
						single_file_support = false,
					})
				end, 100)
			end
		end
	end,
})
