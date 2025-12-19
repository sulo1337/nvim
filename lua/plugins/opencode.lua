return {
  "NickvanDyke/opencode.nvim",

  dependencies = {
    {
      "folke/snacks.nvim",
      ---@module "snacks"
      opts = {
        input = { enabled = true },
        picker = { enabled = true },
        terminal = { enabled = true },
      },
    },
  },

  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>;"

        ------------------------------------------------------------------
        -- ROOT PREFIX
        ------------------------------------------------------------------
        maps.n[prefix] = { desc = " OpenCode" }
        maps.v[prefix] = { desc = " OpenCode" }

        ------------------------------------------------------------------
        -- ASK AI
        ------------------------------------------------------------------
        maps.n[prefix .. "?"] = {
          function() require("opencode").ask("@this: ", { submit = true }) end,
          desc = "Ask AI (auto submit)",
        }
        maps.v[prefix .. "?"] = maps.n[prefix .. "?"]

        maps.n[prefix .. "a"] = {
          function() require("opencode").prompt "@this: " end,
          desc = "Add context to prompt (no submit)",
        }
        maps.v[prefix .. "a"] = maps.n[prefix .. "a"]

        ------------------------------------------------------------------
        -- SELECT / TOGGLE / BUFFER
        ------------------------------------------------------------------
        maps.n[prefix .. "s"] = {
          function() require("opencode").select() end,
          desc = "Select / execute action",
        }
        maps.v[prefix .. "s"] = maps.n[prefix .. "s"]

        maps.n[prefix .. "t"] = {
          function() require("opencode").toggle() end,
          desc = "Toggle OpenCode UI",
        }

        maps.n[prefix .. "b"] = {
          function() require("opencode").prompt("@buffer", { append = true }) end,
          desc = "Add current buffer",
        }

        ------------------------------------------------------------------
        -- PROMPT MENU <leader>;p
        ------------------------------------------------------------------
        local prompt_prefix = prefix .. "p"
        maps.n[prompt_prefix] = { desc = "Prompt Shortcuts" }
        maps.v[prompt_prefix] = { desc = "Prompt Shortcuts" }

        local named_prompts = {
          a = { name = "ask_this", desc = "Append selection/cursor to prompt" },
          c = { name = "document", desc = "Document selection/cursor" },
          d = { name = "diagnostics", desc = "Explain diagnostics" },
          f = { name = "fix", desc = "Fix diagnostics" },
          g = { name = "diff", desc = "Review diff" },
          i = { name = "implement", desc = "Implement selection/cursor" },
          o = { name = "optimize", desc = "Optimize selection/cursor" },
          r = { name = "review", desc = "Review selection/cursor" },
          t = { name = "test", desc = "Write tests for selection/cursor" },
        }

        for key, info in pairs(named_prompts) do
          maps.n[prompt_prefix .. key] = {
            function() require("opencode").prompt(info.name) end,
            desc = info.desc,
          }
          maps.v[prompt_prefix .. key] = maps.n[prompt_prefix .. key]
        end

        ------------------------------------------------------------------
        -- SESSION MANAGEMENT
        -----------------------------------------------------------------
        maps.n[prefix .. "n"] = {
          function() require("opencode").command "session.new" end,
          desc = "New session",
        }

        maps.n[prefix .. "l"] = {
          function() require("opencode").command "session.list" end,
          desc = "List sessions",
        }

        maps.n[prefix .. "h"] = {
          function() require("opencode").command "session.interrupt" end,
          desc = "Interrupt session",
        }

        maps.n[prefix .. "c"] = {
          function() require("opencode").command "session.compact" end,
          desc = "Compact session",
        }

        ------------------------------------------------------------------
        -- NAVIGATION / SCROLL
        ------------------------------------------------------------------
        maps.n["<M-j>"] = {
          function() require("opencode").command "session.half.page.down" end,
          desc = "OpenCode half page down",
        }

        maps.n["<M-k>"] = {
          function() require("opencode").command "session.half.page.up" end,
          desc = "OpenCode half page up",
        }

        -- Full page scroll
        maps.n["<C-S-d>"] = {
          function() require("opencode").command "session.page.down" end,
          desc = "OpenCode page down",
        }

        maps.n["<C-S-u>"] = {
          function() require("opencode").command "session.page.up" end,
          desc = "OpenCode page up",
        }

        maps.n[prefix .. "0"] = {
          function() require("opencode").command "session.first" end,
          desc = "First message",
        }

        maps.n[prefix .. "$"] = {
          function() require("opencode").command "session.last" end,
          desc = "Last message",
        }

        ------------------------------------------------------------------
        -- OPERATOR / RANGE MAPPINGS (VIM STYLE)
        ------------------------------------------------------------------
        maps.n["go"] = {
          function() return require("opencode").operator "@this " end,
          expr = true,
          desc = "Operator: add range",
        }

        maps.n["gol"] = {
          function() return require("opencode").operator "@this " .. "_" end,
          expr = true,
          desc = "Operator: add line",
        }

        maps.n["gov"] = {
          function() return require("opencode").operator "@visible " .. "_" end,
          expr = true,
          desc = "Operator: add visible lines",
        }
      end,
    },
  },

  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Place custom opencode configuration here if needed
    }

    -- Required for reload events
    vim.o.autoread = true
  end,
}
